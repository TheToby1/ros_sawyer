Run all commands from the root of this repository.
If you can't run any scripts just
$ chmod +x ./<scriptName>

First run install_docker.sh as sudo
$ sudo ./install_docker.sh

Log out and back in, in order to update docker permissions

Now that docker is working we can build our images.
The build_full script will build all of the sawyer sdk including moveit and gazebo.
$ ./build_full.sh
This will take some time as it pulls down and installs all dependencies within docker containers.
No packages will be installed on your native version of Ubuntu.

Launch the docker image with the launch_full script
$ ./launch_full.sh
This will now set this terminal to run within the docker container.

As a quick test try running gazebo
$ gazebo

Once you are happy it's working run the sdk setup script
This will create a ros workspace with the sdk inside
$ ./setup_sawyer_sdk_full.sh
This will pull down all components of the sdk and build them using catkin.

Next we need to set our ros version, run:
$ cd ros_ws
$ cp src/intera_sdk/intera.sh ./
Using your preferred text editor change the line ros_version="indigo" to ros_version="kinetic"
You made need to do this with root privileges 

Now the sdk can be run using
$ ./intera.sh sim
To start the simulation in gazebo run
$ roslaunch sawyer_gazebo sawyer_world.launch
Gazebo should start with a model of the sawyer

Next run another terminal and cd to this directory
You can now connect this terminal to your running docker container by getting its id
$ docker ps
and running
$ docker exec -it <container-id> bash

Then cd into the ros_ws
Again run 
$ ./intera.sh sim
And now
$ rosrun intera_examples joint_torque_springs.py
Run an example piece of code which causes the gazebo robot move to its home position.

All other examples should also run.
These websites show how to use some of the basics.

http://sdk.rethinkrobotics.com/intera/Workstation_Setup#Install_Intera_SDK_Dependencies
http://sdk.rethinkrobotics.com/intera/MoveIt_Tutorial#Installation.2FPrerequisites
http://sdk.rethinkrobotics.com/intera/Gazebo_Tutorial
