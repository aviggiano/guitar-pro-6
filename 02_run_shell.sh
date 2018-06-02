#!/usr/bin/env bash

xhost +local:root

USER_UID=$(id -u)

docker run -it \
	--name gp6-02 \
	-e DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix/ \
	--device /dev/snd \
	-v /run/user/$USER_UID/pulse:/run/pulse:ro \
	aviggiano/guitar-pro-6  bash


