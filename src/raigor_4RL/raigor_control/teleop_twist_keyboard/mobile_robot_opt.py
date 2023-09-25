#!/usr/bin/env python
# coding=UTF-8
'''
Author: Wei Luo
Date: 2021-03-15 23:02:08
LastEditors: Wei Luo
LastEditTime: 2021-03-17 23:29:04
Note: Note
'''

import os
import sys
import shutil
import errno
import timeit
import rospy
from nav_msgs.msg import Odometry
from geometry_msgs.msg import Twist
from mobile_robot_model import MobileRobotModel
from acados_template import AcadosOcp, AcadosOcpSolver, AcadosSimSolver

# import casadi as ca
import numpy as np
import scipy.linalg

from draw import Draw_MPC_point_stabilization_v1

def safe_mkdir_recursive(directory, overwrite=False):
    if not os.path.exists(directory):
        try:
            os.makedirs(directory)
        except OSError as exc:
            if exc.errno == errno.EEXIST and os.path.isdir(directory):
                pass
            else:
                raise
    else:
        if overwrite:
            try:
                shutil.rmtree(directory)
            except:
                print('Error while removing directory {}'.format(directory))


class MobileRobotOptimizer(object):
    def __init__(self, m_model, m_constraint, t_horizon, n_nodes):
        model = m_model
        self.T = t_horizon
        self.N = n_nodes

        # Ensure current working directory is current folder
        os.chdir(os.path.dirname(os.path.realpath(__file__)))
        self.acados_models_dir = './acados_models'
        safe_mkdir_recursive(os.path.join(os.getcwd(), self.acados_models_dir))
        acados_source_path = os.environ['ACADOS_SOURCE_DIR']
        sys.path.insert(0, acados_source_path)

        nx = model.x.size()[0]
        self.nx = nx
        nu = model.u.size()[0]
        self.nu = nu
        ny = nx + nu
        n_params = len(model.p)

        # create OCP
        ocp = AcadosOcp()
        ocp.acados_include_path = acados_source_path + '/include'
        ocp.acados_lib_path = acados_source_path + '/lib'
        ocp.model = model
        ocp.dims.N = self.N
        ocp.solver_options.tf = self.T

        # initialize parameters
        ocp.dims.np = n_params
        ocp.parameter_values = np.zeros(n_params)

        # cost type
        Q = np.array([[1.0, 0.0, 0.0], [0.0, 5.0, 0.0], [0.0, 0.0, .1]])
        R = np.array([[0.5, 0.0], [0.0, 0.05]])
        ocp.cost.cost_type = 'LINEAR_LS'
        ocp.cost.cost_type_e = 'LINEAR_LS'
        ocp.cost.W = scipy.linalg.block_diag(Q, R)
        ocp.cost.W_e = Q
        ocp.cost.Vx = np.zeros((ny, nx))
        ocp.cost.Vx[:nx, :nx] = np.eye(nx)
        ocp.cost.Vu = np.zeros((ny, nu))
        ocp.cost.Vu[-nu:, -nu:] = np.eye(nu)
        ocp.cost.Vx_e = np.eye(nx)

        # set constraints
        ocp.constraints.lbu = np.array([m_constraint.v_min, m_constraint.omega_min])
        ocp.constraints.ubu = np.array([m_constraint.v_max, m_constraint.omega_max])
        ocp.constraints.idxbu = np.array([0, 1])
        ocp.constraints.lbx = np.array([m_constraint.x_min, m_constraint.y_min])
        ocp.constraints.ubx = np.array([m_constraint.x_max, m_constraint.y_max])
        ocp.constraints.idxbx = np.array([0, 1])

        x_ref = np.zeros(nx)
        u_ref = np.zeros(nu)
        # initial state
        ocp.constraints.x0 = x_ref
        ocp.cost.yref = np.concatenate((x_ref, u_ref))
        ocp.cost.yref_e = x_ref

        # solver options
        ocp.solver_options.qp_solver = 'PARTIAL_CONDENSING_HPIPM'
        ocp.solver_options.hessian_approx = 'GAUSS_NEWTON'
        # explicit Runge-Kutta integrator
        ocp.solver_options.integrator_type = 'ERK'
        ocp.solver_options.print_level = 0
        ocp.solver_options.nlp_solver_type = 'SQP_RTI'

        # compile acados ocp
        json_file = os.path.join('./'+model.name+'_acados_ocp.json')
        self.solver = AcadosOcpSolver(ocp, json_file=json_file)
        self.integrator = AcadosSimSolver(ocp, json_file=json_file)

    def simulation(self, x0, xs):
        # init subs
        subs = MySubscriber()
        rospy.Subscriber("/track_velocity_controller/odom", Odometry, subs.callbackx)
        # print(subs.data)
        # not very understand of self.solver.set
        simX = np.zeros((self.N+1, self.nx)) # nx is the dimension of state  N is the numble of sim points
        simU = np.zeros((self.N, self.nu)) # nu is the dimension of controls
        x_current = x0
        simX[0, :] = x0.reshape(1, -1) # let initial points be the first row of simX
        xs_between = np.concatenate((xs, np.zeros(2))) # xs should be the final target for the car [2,2,0,0,0]
        time_record = np.zeros(self.N)
    
    
        # closed loop
        self.solver.set(self.N, 'yref', xs)
        for i in range(self.N):
            self.solver.set(i, 'yref', xs_between)
            print(xs_between)


        for i in range(self.N):
            
            # solve ocp
            start = timeit.default_timer()
            ##  set inertial (stage 0)
            self.solver.set(0, 'lbx', x_current)
            self.solver.set(0, 'ubx', x_current)
            status = self.solver.solve()
            # write(status,'solver_x.txt')

            if status != 0 :
                raise Exception('acados acados_ocp_solver returned status {}. Exiting.'.format(status))

            simU[i, :] = self.solver.get(0, 'u')
            ''' ros part'''
            ros_send(simU[i,:])
            
            # write(simU[i, :],'solver_u.txt')
            
            time_record[i] =  timeit.default_timer() - start
            # simulate system
            self.integrator.set('x', x_current)
            self.integrator.set('u', simU[i, :])
            
            status_s = self.integrator.solve()
            if status_s != 0:
                raise Exception('acados integrator returned status {}. Exiting.'.format(status))

            # update
            x_current = self.integrator.get('x')
            # print("data type:",type(x_current))
            ''' ros part'''
            # rospy.loginfo("get x")
            x_current = subs.data
            print(x_current)
            # write(x_current,'states.txt')



            simX[i+1, :] = x_current
            # write(x_current,'integrator_x.txt')

        # print("average estimation time is {}".format(time_record.mean()))
        # print("max estimation time is {}".format(time_record.max()))
        # print("min estimation time is {}".format(time_record.min()))
        Draw_MPC_point_stabilization_v1(rob_diam=0.3, init_state=x0, target_state=xs, robot_states=simX, )

def write(data, filename):
    with open(filename,'a') as file:
        file.write(f"{data}\n")

## To do ROS
class MySubscriber:
    def __init__(self):
        self.data = None
        self.data_list = None
    
    def callbackx(self,data):
        pos = data.pose.pose.position
        orientation = data.pose.pose.orientation
        # linear_vel = data.twist.twist.linear
        # angular_vel = data.twist.twist.angular
        # print("Position (x, y): {:.4f}, {:.4f}".format(pos.x, pos.y))
        self.data_list = [pos.x, pos.y, orientation.z]
        self.data = np.array(self.data_list)



def ros_send(data):
    rospy.init_node('sqp_robo',anonymous=True)
    # rospy.loginfo("start to send")
    
    rate = rospy.Rate(35)  # 10Hz

    vel_cmd = rospy.Publisher('/cmd_vel', Twist, queue_size=10)
    
    vel = data[0]
    ang = data[1]

    msg = Twist()
    msg.linear.x = vel
    msg.angular.z = ang
    # print(msg.linear.x)
    # print(msg.angular.z)
    # start_time = rospy.Time.now().to_sec()
    # while (rospy.Time.now().to_sec() - start_time) < 2:
    #     vel_cmd.publish(msg)
    #     rate.sleep()
    
    vel_cmd.publish(msg)
    rate.sleep()
    # if vel_cmd.publish(msg):
    #     rospy.loginfo("Message published successfully.")
    # else:
    #     rospy.logerr("Failed to publish message.")
    
    # rate.sleep()
    # rospy.spin()

if __name__ == '__main__':
    mobile_robot_model = MobileRobotModel()
    opt = MobileRobotOptimizer(m_model=mobile_robot_model.model,
                               m_constraint=mobile_robot_model.constraint, t_horizon=100, n_nodes=200)
    opt.simulation(x0=np.array([0, 0, 0]), xs=np.array([6., 7., 0.5*np.pi]))
