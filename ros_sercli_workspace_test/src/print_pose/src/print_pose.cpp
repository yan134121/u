#include "ros/ros.h"
#include "turtlesim/Pose.h"

void doPose(const turtlesim::Pose::ConstPtr& p){

    ROS_INFO("乌龟的位置是x=%.2f,y=%.2f,当前角度=%.2f,线速度=%.2f,角速度=%.2f",p->x,p->y,p->theta,p->linear_velocity,p->angular_velocity);
}



int main(int argc, char *argv[])
{
    ros::init(argc,argv,"print_pose");
    ros::NodeHandle nh;
    ros::Subscriber sub = nh.subscribe<turtlesim::Pose>("/turtle1/pose",1000,doPose);
    ros::spin();

    return 0;
}
