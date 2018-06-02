#!/usr/bin/env bash

if [ "$#" -ne 1 ]; then
  echo 	"Illegal number of parameters
Usage:	03_run_with_user_files.sh GP_USER_PATH"
  exit 1
fi

xhost +local:root

GP_USER_PATH="$1"

USER_UID=$(id -u)

docker run --rm \
	--name gppro6 \
	-e DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix/ \
	--device /dev/snd \
	-v /run/user/$USER_UID/pulse:/run/pulse:ro \
	-v "$GP_USER_PATH"/home.config:/root/.config \
	-v "$GP_USER_PATH"/home.ArobasMusic:/root/.ArobasMusic \
	aviggiano/guitar-pro-6

