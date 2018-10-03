#!/bin/bash

cwd=$( pwd )

docker run \
       --rm=true \
       -v "$cwd":/work \
       -v /tmp/.X11-unix:/tmp/.X11-unix \
       -e DISPLAY=$DISPLAY \
       sdaps \
       "$@"
