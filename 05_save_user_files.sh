#!/usr/bin/env bash

if [ "$#" -ne 1 ]; then
  echo 	"Illegal number of parameters
Usage:	05_save_user_files.sh GP_USER_PATH"
  exit 1
fi

GP_USER_PATH="$1"

mkdir -p "$GP_USER_PATH"
docker cp gp6-01:/root/.ArobasMusic "$GP_USER_PATH"/home.ArobasMusic
docker cp gp6-01:/root/.config "$GP_USER_PATH"/home.config



