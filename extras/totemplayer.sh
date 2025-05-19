#!/bin/bash
export DISPLAY=:0.0

Player_Config="$HOME/player.txt"

# Cargar Config
if [ -f "$Player_Config" ]
then
        Media_URL=`cat $Player_Config`
        while true; do
                mediaplayer $Media_URL
        done
else
    echo "Error, Archivo de Configuración No Existe."
    exit 1
fi
