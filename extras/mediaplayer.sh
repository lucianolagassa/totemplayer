#!/bin/bash

#cvlc --fullscreen --no-mouse-events --no-osd $*
cvlc --fullscreen --no-mouse-events --no-osd --one-instance $*
killall cvlc
killall vlc