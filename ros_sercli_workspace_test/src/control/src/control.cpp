#include "ros/ros.h"
#include "geometry_msgs/Twist.h"
/*
需求：发布速度消息
已知话题:/turtle1/cmd_vel
话题中消息：geometry_msgs/Twist



*/




int main(int argc, char *argv[])
{
    ros::init(argc,argv,"user_control");
    ros::NodeHandle nh;
    ros::Publisher pub = nh.advertise<geometry_msgs::Twist>("/turtle1/cmd_vel",10);
    ros::Rate rate(10);
    geometry_msgs::Twist twist;
    twist.angular.x=0;
    twist.angular.y=0;
    twist.angular.z=2;
    twist.linear.x=1;
    twist.linear.y=0;
    twist.linear.z=0;
    while (ros::ok())
    {
        pub.publish(twist);
        rate.sleep();
        ros::spinOnce();
    }
    

    return 0;
}
