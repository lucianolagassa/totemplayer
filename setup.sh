#!/bin/bash

## Validar Usuario
UserName=`whoami`
if [ "$UserName" = "root" ]
then
    echo "Error, No esta permitido ejecutar el script como usuario Root."
    exit 1
fi
##

## Linux
sudo apt-get update
sudo apt-get -y upgrade
sudo apt-get -y install vlc
##

## Custom MenuBar
sudo sed -i "s/autohide=.*/autohide=1/" /etc/xdg/lxpanel/LXDE-pi/panels/panel
sudo sed -i "s/heightwhenhidden=.*/heightwhenhidden=0/" /etc/xdg/lxpanel/LXDE-pi/panels/panel
##

## Auto Run
mkdir -p $HOME/.config/autostart
cp extras/autorun.txt $HOME/.config/autostart/player.desktop
chmod 755 $HOME/.config/autostart/player.desktop
chmod +x $HOME/.config/autostart/player.desktop
##

## Media Player
sudo cp extras/mediaplayer.sh /usr/bin/mediaplayer
sudo chmod 755 /usr/bin/mediaplayer
sudo chmod +x /usr/bin/mediaplayer
##

## Totem Player
sudo cp extras/totemplayer.sh /usr/bin/totemplayer
sudo chmod 755 /usr/bin/totemplayer
sudo chmod +x /usr/bin/totemplayer
##

## Custom Splash
sudo rm /usr/share/plymouth/themes/pix/splash.png
sudo cp images/splash.png /usr/share/plymouth/themes/pix/splash.png
sudo chmod 755 /usr/share/plymouth/themes/pix/splash.png
##

## Custom Wallpaper
cp images/wallpaper.png $HOME/.config/wallpaper.png
chmod 755 $HOME/.config/wallpaper.png
pcmanfm --set-wallpaper $HOME/.config/wallpaper.png
##

## Player Config
#echo "twitch.tv/trutecnica" > $HOME/player.txt
#echo "https://vivo.solumedia.com:19360/unimar/unimar.m3u8" > $HOME/player.txt
echo "rtmp://nodo7.arcast.live/unimar/unimar" > $HOME/player.txt
chmod 755 $HOME/player.txt
##
