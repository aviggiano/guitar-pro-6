#!/usr/bin/env bash

if [ "$#" -ne 1 ]; then
  echo 	"Illegal number of parameters
Usage:	03_save_soundbanks.sh GP_SAVE_PATH"
  exit 1
fi

GP_SAVE_PATH="$1"

mkdir -p "$GP_SAVE_PATH"
docker cp gp6-02:/opt/GuitarPro6/Data "$GP_SAVE_PATH"
