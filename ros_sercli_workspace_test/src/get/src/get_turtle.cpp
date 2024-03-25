#include "ros/ros.h"
#include "turtlesim/Spawn.h"


int main(int argc, char *argv[])
{
    setlocale(LC_ALL,"");
    ros::init(argc,argv,"get_turtle");
    ros::NodeHandle nh;
    ros::ServiceClient Client = nh.serviceClient<turtlesim::Spawn>("/spawn");
    ros::service::waitForService("/spawn");
    // 6.发送请求
    turtlesim::Spawn spawn;
    spawn.request.x = 1.0;
    spawn.request.y = 2.0;
    spawn.request.theta = 1.57;
    spawn.request.name = "sakula";
    bool flag = Client.call(spawn);
    // 7.处理响应结果
    if (flag)
    {
        ROS_INFO("新的乌龟生成,名字:%s",spawn.response.name.c_str());
    } else {
        ROS_INFO("乌龟生成失败！！！");
    }


    return 0;
}
