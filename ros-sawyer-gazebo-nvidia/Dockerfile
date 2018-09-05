FROM ros-sawyer-nvidia

RUN apt-get update && apt-get install --no-install-recommends -y \
    ros-kinetic-qt-build \
    ros-kinetic-gazebo-* \
    ros-kinetic-ros-control \
    ros-kinetic-control-toolbox \
    ros-kinetic-realtime-tools \
    ros-kinetic-ros-controllers \
    ros-kinetic-xacro \
    ros-kinetic-tf-conversions \
    ros-kinetic-kdl-parser \
    ros-kinetic-sns-ik-lib \
  && rm -rf /var/lib/apt/lists/*