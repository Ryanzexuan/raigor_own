#!/usr/bin/env python

import rospy
from nav_msgs.msg import Odometry
from geometry_msgs.msg import Twist

def callback_sample(data):
    pos = data.pose.pose.position
    orientation = data.pose.pose.orientation
    linear_vel = data.twist.twist.linear
    angular_vel = data.twist.twist.angular

    with open('robot_data.txt', 'a') as file:
        file.write(f"output Position: {pos}\n")
        file.write(f"output Orientation: {orientation}\n")
        file.write(f"output Linear Velocity: {linear_vel}\n")
        file.write(f"output Angular Velocity: {angular_vel}\n")

def callback_input(data):
    input_linear_vel = data.twist.twist.linear
    input_angular_vel = data.twist.twist.angular

    with open('robot_data.txt', 'a') as file:
        file.write(f"input Linear Velocity: {input_linear_vel}\n")
        file.write(f"input Angular Velocity: {input_angular_vel}\n")

def listener():
    rospy.init_node('topic_listener', anonymous=True)

   
    rospy.Subscriber("/odom",Odometry, callback_sample)

    rospy.Subscribe("/cmd_vel",Twist,callback_input)

    rospy.spin()

def run():
    try:
        listener()
    except rospy.ROSInterruptException:
        pass
