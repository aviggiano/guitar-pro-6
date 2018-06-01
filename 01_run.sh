#!/usr/bin/env bash

xhost +local:root

docker run -d \
	--name gppro-01 \
	-e DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix/ \
	--device /dev/snd \
	-v /run/user/1000/pulse:/run/pulse:ro \
	aviggiano/guitar-pro-6

