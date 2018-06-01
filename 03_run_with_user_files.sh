#!/usr/bin/env bash

xhost +local:root

GP_USER_PATH="$1"

docker run --rm \
	--name gppro-02 \
	-e DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix/ \
	--device /dev/snd \
	-v /run/user/1000/pulse:/run/pulse:ro \
	-v "$GP_USER_PATH"/home.config:/root/.config \
	-v "$GP_USER_PATH"/home.ArobasMusic:/root/.ArobasMusic \
	aviggiano/guitar-pro-6

