#!/bin/bash
export DISPLAY=:0.0

Player_Config="$HOME/player.txt"

# Cargar Config
if [ -f "$Player_Config" ]
then
        Media_URL=`cat $Player_Config`
        while true; do
                mediaplayer $Media_URL
                ## Detectar Version Linux
                #LinuxName=`lsb_release -c -s | tr -d '\n'`
                #if [ "$LinuxName" = "bullseye" ]
                #then
                #    streamlink $Media_URL best --player-fifo --player "omxplayer -o both --timeout 0 --threshold 15"
                #else
                #    streamlink $Media_URL best --player-fifo --player "cvlc --fullscreen --no-mouse-events --no-osd"
                #fi
        done
else
    echo "Error, Archivo de Configuración No Existe."
    exit 1
fi
