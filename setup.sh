#!/bin/bash

## Validar Usuario
UserName=`whoami`
if [ "$UserName" = "root" ]
then
    echo "Error, No esta permitido ejecutar el script como usuario Root."
    exit 1
fi
##

## Instalacion de Dependencias
sudo apt-get update
sudo apt-get -y upgrade
sudo apt-get -y install vlc
##

## Custom MenuBar
sudo sed -i "s/autohide=.*/autohide=1/" /etc/xdg/lxpanel/LXDE-pi/panels/panel
sudo sed -i "s/height=.*/height=0/" /etc/xdg/lxpanel/LXDE-pi/panels/panel
sudo sed -i "s/heightwhenhidden=.*/heightwhenhidden=0/" /etc/xdg/lxpanel/LXDE-pi/panels/panel
sudo sed -i '/^[^#].*wfrespawn wf-panel-pi/ s/^/# /' /etc/wayfire/defaults.ini
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

## Custom Panel
sed -i 's/launcher_/#launcher_/' $HOME/.config/wf-panel-pi.ini
echo "notify_enable=false" >> $HOME/.config/wf-panel-pi.ini
echo "notify_timeout=1" >> $HOME/.config/wf-panel-pi.ini
echo "position=top" >> $HOME/.config/wf-panel-pi.ini
echo "icon_size=1" >> $HOME/.config/wf-panel-pi.ini
echo "autohide=true" >> $HOME/.config/wf-panel-pi.ini
echo "minimal_height=0" >> $HOME/.config/wf-panel-pi.ini
echo "autohide_duration=300" >> $HOME/.config/wf-panel-pi.ini
pkill wf-panel-pi
##

## Custom Desktop
desktop_config=`ls $HOME/.config/pcmanfm/LXDE-pi/desktop-items*.conf`
sed -i 's/desktop_bg/#desktop_bg/' $desktop_config
sed -i 's/desktop_fg/#desktop_fg/' $desktop_config
sed -i 's/desktop_shadow/#desktop_shadow/' $desktop_config
echo "desktop_bg=#FFFFFF" >> $desktop_config
echo "desktop_fg=#FFFFFF" >> $desktop_config
echo "desktop_shadow=#FFFFFF" >> $desktop_config
echo "show_documents=0" >> $desktop_config
echo "show_trash=0" >> $desktop_config
echo "show_mounts=0" >> $desktop_config
pkill pcmanfm
##

## Custom Wallpaper (Universal)
#cp images/wallpaper.png $HOME/.config/wallpaper.png
#chmod 755 $HOME/.config/wallpaper.png
#pcmanfm --set-wallpaper $HOME/.config/wallpaper.png
##

## Custom Wallpaper (TRU)
cp images/wallpaper_tru.png $HOME/.config/wallpaper.png
chmod 755 $HOME/.config/wallpaper.png
pcmanfm --set-wallpaper $HOME/.config/wallpaper.png
##

## Player Config (TRU)
#echo "twitch.tv/trutecnica" > $HOME/player.txt
#echo "https://vivo.solumedia.com:19360/unimar/unimar.m3u8" > $HOME/player.txt
echo "rtmp://nodo7.arcast.live/unimar/unimar" > $HOME/player.txt
chmod 755 $HOME/player.txt
##
