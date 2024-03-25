#include "ros/ros.h"
#include "turtlesim/Spawn.h"



int main(int argc, char *argv[])
{
    setlocale(LC_ALL,"");
    ros::init(argc,argv,"get_turtle_node");
    ros::NodeHandle nh;
    ros::ServiceClient client =nh.serviceClient<turtlesim::Spawn>("/spawn");
    ros::service::waitForService("/spawn");
    turtlesim::Spawn spawn;
    spawn.request.name = "sakula";
    spawn.request.theta = 0.3;
    spawn.request.x = 1;
    spawn.request.y = 2;
    bool flag;
    flag = client.call(spawn);
    if (flag==0)
    {
        ROS_INFO("生成失败！");
    }
    else if (flag==1)
    {
        ROS_INFO("生成成功！乌龟的名字是%s",spawn.response.name.c_str());
    }

    return 0;
}
