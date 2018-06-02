#!/usr/bin/env bash

if [ "$#" -ne 1 ]; then
  echo 	"Illegal number of parameters
Usage:	04_run_with_soundbanks.sh GP_DATA_PATH "
  exit 1
fi

xhost +local:root

GP_DATA_PATH="$1"

USER_UID=$(id -u)

docker run -d \
	--name gp6-04 \
	-e DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix/ \
	--device /dev/snd \
	-v /run/user/$USER_UID/pulse:/run/pulse:ro \
	-v "$GP_DATA_PATH":/opt/GuitarPro6/Data:ro \
	aviggiano/guitar-pro-6

