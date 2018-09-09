FROM ros-kinetic-intel

RUN apt-get update && apt-get install --no-install-recommends -y \
    git-core \
    python-argparse \
    python-wstool \
    ros-kinetic-control-msgs \
    ros-kinetic-joystick-drivers \
    ros-kinetic-xacro \
    ros-kinetic-tf2-ros \
    ros-kinetic-rviz \
    ros-kinetic-cv-bridge \
    ros-kinetic-actionlib \
    ros-kinetic-actionlib-msgs \
    ros-kinetic-dynamic-reconfigure \
    ros-kinetic-trajectory-msgs \
    ros-kinetic-rospy-message-converter \
  && rm -rf /var/lib/apt/lists/*
