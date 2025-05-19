#!/bin/bash

## Detectar Version Linux
LinuxName=`lsb_release -c -s | tr -d '\n'`
if [ "$LinuxName" = "bullseye" ]
then
    omxplayer -o both --timeout 0 --threshold 15 $*
else
    cvlc --fullscreen --no-mouse-events --no-osd $*
    #cvlc --fullscreen --no-mouse-events --no-osd --one-instance $*
fi

