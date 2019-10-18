#!/bin/bash 
xhost +local:root

docker run --rm -it \
--volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" \
--device=/dev/dri:/dev/dri \
--env="DISPLAY"  \
--env="QT_X11_NO_MITSHM=1"  \
--workdir="$PWD" \
--volume="/home/$USER:/home/$USER" \
--user $UID:$GID \
--volume="/etc/group:/etc/group:ro" \
--volume="/etc/passwd:/etc/passwd:ro" \
--volume="/etc/shadow:/etc/shadow:ro" \
--volume="/etc/sudoers.d:/etc/sudoers.d:ro" \
--name='ros' ros-sawyer-full-intel:latest bash

xhost -local:root