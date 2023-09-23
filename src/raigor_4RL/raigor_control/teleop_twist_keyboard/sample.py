#!/usr/bin/env python

import rospy
import argparse
from geometry_msgs.msg import Twist
import math
# import listener

def stay():
    rospy.init_node('sample',anonymous=True)

    cmd_vel_pub=rospy.Publisher('/cmd_vel',Twist,queue_size=10)

    #rate=rospy.Rate(10)

    twist_msg=Twist()
    twist_msg.linear.x = 0.0
    twist_msg.linear.y = 0.0
    twist_msg.linear.z = 0.0
    twist_msg.angular.x = 0.0
    twist_msg.angular.y = 0.0
    twist_msg.angular.z = 0.0
    
    cmd_vel_pub.publish(twist_msg)
        

def rotate():
    # init node
    rospy.init_node('rotate_robot', anonymous=True)

    
    cmd_vel_pub = rospy.Publisher('/cmd_vel', Twist, queue_size=10)

    
    rate = rospy.Rate(10)  # 10Hz

    
    angular_speed = 1  
    rotate_time = 10.0  # rotate time

    
    twist = Twist()
    twist.angular.z = angular_speed

    start_time = rospy.Time.now().to_sec()
    while (rospy.Time.now().to_sec() - start_time) < rotate_time:
        cmd_vel_pub.publish(twist)
        rate.sleep()

    
    stay()


def straigtline():
    rospy.init_node('straight_robot',anonymous=True)
    
    cmd_vel_pub=rospy.Publisher('/cmd_vel',Twist,queue_size=10)

    rate=rospy.Rate(10)

    twist=Twist()

    # Forward moving
    twist.linear.x=0.5
    cmd_vel_pub.publish(twist)
    rospy.sleep(2)
    # Backward moving
    twist.linear.x=-0.5
    cmd_vel_pub.publish(twist)
    rospy.sleep(2)

    stay()


if __name__ == '__main__':
    parser = argparse.ArgumentParser()
    parser.add_argument("--type",type=int,default="0",
                        help="1:rotate,2:straight")
    input_parser=parser.parse_args()
    
    # start writing data
    # listener.run()

    # start sampling
    if not input_parser.type :
        try:
            stay()
        except rospy.ROSInterruptException:
            pass
    elif input_parser.type == 1:
        try:
            rotate()
        except rospy.ROSInterruptException:
            pass
    elif input_parser.type == 2:
        try:
            straigtline()
        except rospy.ROSInterruptException:
            pass