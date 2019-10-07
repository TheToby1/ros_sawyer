FROM ubuntu:16.04

# install packages
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -q -y --no-install-recommends \
    mesa-utils \
    libgl1-mesa-glx \
    libgl1-mesa-dri \
    libgl1-mesa-dri \
    x11-xserver-utils \
    x11vnc \
    xinit \
    xserver-xorg-video-dummy \
    xserver-xorg-input-void \
    dirmngr \
    gnupg2 \
    lsb-release  && \
    rm -rf /var/lib/apt/lists/*

# setup keys
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654

# setup sources.list
RUN echo "deb http://packages.ros.org/ros/ubuntu `lsb_release -sc` main" > /etc/apt/sources.list.d/ros-latest.list

# install bootstrap tools
RUN apt-get update && apt-get install --no-install-recommends -y \
    python-rosdep \
    python-rosinstall \
    python-vcstools \
    && rm -rf /var/lib/apt/lists/*

# setup environment
ENV LANG C.UTF-8
ENV LC_ALL C.UTF-8

# bootstrap rosdep
RUN rosdep init \
    && rosdep update

# install ros packages
ENV ROS_DISTRO kinetic
RUN apt-get update && apt-get install -y \
    ros-kinetic-desktop-full \
    && rm -rf /var/lib/apt/lists/*

# setup entrypoint
COPY ./ros_entrypoint.sh /

RUN bash -c "chmod +x /ros_entrypoint.sh"

ENTRYPOINT ["/ros_entrypoint.sh"]
