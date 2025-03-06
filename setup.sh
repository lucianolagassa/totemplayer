#!/bin/bash

## Validar Usuario
UserName=`whoami`
if [ "$UserName" = "root" ]
then
    echo "Error, No esta permitido ejecutar el script como usuario Root."
    exit 1
fi

## Detectar Version
LinuxName=`lsb_release -c -s | tr -d '\n'`
if [ "$LinuxName" = "bullseye" ]
then
    echo "Linux Name: Bullseye"
    ## Linux
    sudo apt-get update
    sudo apt-get -y upgrade
    sudo apt-get -y install python3-pip
    #sudo apt-get -y install python3-full
    sudo apt-get -y install steamlink
    sudo apt-get -y install libavcodec
    sudo apt-get -y install libavutil
    sudo apt-get -y install libswresample
    sudo apt-get -y install libavformat
    ##
    ## Install Omxplayer
    wget --no-check-certificate -w 4 -O omxplayer_armhf.deb http://archive.raspberrypi.org/debian/pool/main/o/omxplayer/omxplayer_20190723+gitf543a0d-1+bullseye_armhf.deb
    sudo dpkg -i omxplayer_armhf.deb
    rm omxplayer_armhf.deb
    sudo apt-get -f install
    ##
    ## Python (streamlink)
    sudo pip3 install streamlink
    sudo pip3 uninstall web3
    ##
    ## Auto Start
    sudo sed -i "s/exit 0/## Auto Start Totem Player/" /etc/rc.local
    sudo echo "/usr/bin/totemplayer" >> /etc/rc.local
    sudo echo "" >> /etc/rc.local
    sudo echo "exit 0" >> /etc/rc.local
    ##
else
    echo "Linux Name: Otros"
    ## Linux
    sudo apt-get update
    sudo apt-get -y upgrade
    sudo apt-get -y install vlc
    sudo apt-get -y install python3-pip
    sudo apt-get -y install python3-full
    sudo apt-get -y install steamlink
    sudo apt-get -y install virtualenv
    ##
    ## Python (streamlink)
    sudo pip3 install streamlink --break-system-packages
    sudo pip3 install livestreamer --break-system-packages
    sudo pip3 uninstall web3 --break-system-packages
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
fi

## Media Player
sudo cp extras/mediaplayer.sh /usr/bin/mediaplayer
sudo chmod 755 /usr/bin/mediaplayer
sudo chmod +x /usr/bin/mediaplayer

## Totem Player
sudo cp extras/totemplayer.sh /usr/bin/totemplayer
sudo chmod 755 /usr/bin/totemplayer
sudo chmod +x /usr/bin/totemplayer

## Custom Splash
sudo rm /usr/share/plymouth/themes/pix/splash.png
sduo cp images/splash.png /usr/share/plymouth/themes/pix/splash.png
sudo chmod 755 /usr/share/plymouth/themes/pix/splash.png

## Custom Wallpaper
cp images/wallpaper.png $HOME/.config/wallpaper.png
chmod 755 $HOME/.config/wallpaper.png
pcmanfm --set-wallpaper $HOME/.config/wallpaper.png

## Player Config
echo "twitch.tv/trutecnica" > $HOME/player.txt
chmod 755 $HOME/player.txt
