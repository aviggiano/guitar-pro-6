#!/usr/bin/env bash

xhost +local:root

GP_USER_PATH="$1"
DROPBOX_PATH="$2"
GP_DATA_PATH="$3"

docker run --rm \
	--name gppro \
	-e DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix/ \
	--device /dev/snd \
	-v /run/user/1000/pulse:/run/pulse:ro \
	-v "$GP_USER_PATH"/home.config:/root/.config \
	-v "$GP_USER_PATH"/home.ArobasMusic:/root/.ArobasMusic \
	-v "$DROPBOX_PATH":/root/dropbox \
	-v "$GP_DATA_PATH":/opt/GuitarPro6/Data:ro \
	aviggiano/guitar-pro-6

