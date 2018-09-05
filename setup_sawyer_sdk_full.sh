#!/bin/bash

mkdir -p ros_ws/src
source /opt/ros/kinetic/setup.bash
cd ros_ws/src

wstool init .
git clone https://github.com/RethinkRobotics/sawyer_robot.git
wstool merge sawyer_robot/sawyer_robot.rosinstall
wstool update

source /opt/ros/kinetic/setup.bash

git clone https://github.com/RethinkRobotics/sawyer_simulator.git
wstool merge sawyer_simulator/sawyer_simulator.rosinstall
wstool update

wstool merge https://raw.githubusercontent.com/RethinkRobotics/sawyer_moveit/master/sawyer_moveit.rosinstall
wstool update

cd ..
catkin_make