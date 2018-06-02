#!/usr/bin/env bash

if [ "$#" -ne 3 ]; then
  echo 	"Illegal number of parameters
Usage:	07_run_full.sh GP_USER_PATH DRIVE_PATH GP_DATA_PATH "
  exit 1
fi

xhost +local:root

GP_USER_PATH="$1"
DRIVE_PATH="$2"
GP_DATA_PATH="$3"

USER_UID=$(id -u)

docker run --rm \
	--name gp6-07 \
	-e DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix/ \
	--device /dev/snd \
	-v /run/user/$USER_UID/pulse:/run/pulse:ro \
	-v "$GP_USER_PATH"/home.config:/root/.config \
	-v "$GP_USER_PATH"/home.ArobasMusic:/root/.ArobasMusic \
	-v "$DRIVE_PATH":/root/drive \
	-v "$GP_DATA_PATH":/opt/GuitarPro6/Data:ro \
	aviggiano/guitar-pro-6

