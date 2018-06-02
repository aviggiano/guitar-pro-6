#!/usr/bin/env bash

xhost +local:root

USER_UID=$(id -u)

docker run -d \
	--name gp6-01 \
	-e DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix/ \
	--device /dev/snd \
	-v /run/user/$USER_UID/pulse:/run/pulse:ro \
	aviggiano/guitar-pro-6

