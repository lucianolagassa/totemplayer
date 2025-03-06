#!/bin/bash

## Validar Usuario
UserName=`whoami`
if [ "$UserName" == "root" ]
then
    echo "Error, No esta permitido ejecutar el script como usuario Root."
    exit 1
fi

## Linux
sudo apt-get update
sudo apt-get -y upgrade
sudo apt-get -y install vlc
sudo apt-get -y install python3-pip
sudo apt-get -y install python3-full3.10.4
sudo apt-get -y install steamlink
sudo apt-get -y install virtualenv

## Python (streamlink)
sudo pip3 install streamlink --break-system-packages
sudo pip3 install livestreamer --break-system-packages
sudo pip3 uninstall web3 --break-system-packages

## Media Player
sudo cp mediaplayer.sh /usr/bin/mediaplayer
sudo chmod 755 /usr/bin/mediaplayer
sudo chmod +x /usr/bin/mediaplayer

## Totem Player
sudo cp totemplayer.sh /usr/bin/totemplayer
sudo chmod 755 /usr/bin/totemplayer
sudo chmod +x /usr/bin/totemplayer

## Custom Splash
sudo mv /usr/share/plymouth/themes/pix/splash.png /usr/share/plymouth/themes/pix/splash2.png
sduo cp splash.png /usr/share/plymouth/themes/pix/splash.png
sudo chmod 755 /usr/share/plymouth/themes/pix/splash.png

## Custom MenuBar
sudo sed -i "s/autohide=.*/autohide=1/" /etc/xdg/lxpanel/LXDE-pi/panels/panel
sudo sed -i "s/heightwhenhidden=.*/heightwhenhidden=0/" /etc/xdg/lxpanel/LXDE-pi/panels/panel

## Custom Wallpaper
cp wallpaper.png $HOME/.config/wallpaper.png
chmod 755 $HOME/.config/wallpaper.png
pcmanfm --set-wallpaper $HOME/.config/wallpaper.png

## Player Config
echo "twitch.tv/trutecnica" > $HOME/player.txt
chmod 755 $HOME/player.txt

## Auto Run
mkdir -p $HOME/.config/autostart
cp autorun.txt $HOME/.config/autostart/player.desktop
chmod 755 $HOME/.config/autostart/player.desktop
chmod +x $HOME/.config/autostart/player.desktop

## LiveStreamer
virtualenv $HOME/.config/pyenv
source $HOME/.config/pyenv/bin/activate
pip install livestreamer
livestreamer
deactivate