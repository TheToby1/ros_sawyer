#!/bin/bash 
xhost +local:root

nvidia-docker run --rm -it \
--env="DISPLAY"  \
--env="QT_X11_NO_MITSHM=1"  \
--volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" \
--workdir="$PWD" \
--volume="/home/$USER:/home/$USER" \
--volume="/etc/group:/etc/group:ro" \
--volume="/etc/passwd:/etc/passwd:ro" \
--volume="/etc/shadow:/etc/shadow:ro" \
--volume="/etc/sudoers.d:/etc/sudoers.d:ro" \
-e LOCAL_USER_ID=`id -u $USER` \
-e LOCAL_GROUP_ID=`id -g $USER` \
-e LOCAL_GROUP_NAME=`id -gn $USER` \
--name='ros' ros-sawyer-full-nvidia:latest bash

xhost -local:root