#!/usr/bin/env bash

xhost +local:root

GP_USER_PATH="$1"

mkdir -p "$GP_USER_PATH"
docker cp gppro-01:/root/.ArobasMusic "$GP_USER_PATH"/home.ArobasMusic
docker cp gppro-01:/root/.config "$GP_USER_PATH"/home.config



