#!/bin/bash

## Validar Usuario
UserName=`whoami`
if [ "$UserName" = "root" ]
then
    echo "Error, No esta permitido ejecutar el script como usuario Root."
    exit 1
fi
##

## Display
export DISPLAY=:0.0
##

## Setup (Admin)
sudo apt-get update
sudo apt-get -y upgrade
sudo apt-get -y install vlc
##

## Custom Panel (Admin)
sudo sed -i "s/autohide=.*/autohide=1/" /etc/xdg/lxpanel/LXDE-pi/panels/panel
sudo sed -i "s/height=.*/height=0/" /etc/xdg/lxpanel/LXDE-pi/panels/panel
sudo sed -i "s/heightwhenhidden=.*/heightwhenhidden=0/" /etc/xdg/lxpanel/LXDE-pi/panels/panel
sudo sed -i '/^[^#].*wfrespawn wf-panel-pi/ s/^/# /' /etc/wayfire/defaults.ini
##

## Media Player (Admin)
sudo cp extras/mediaplayer.sh /usr/bin/mediaplayer
sudo chmod 755 /usr/bin/mediaplayer
sudo chmod +x /usr/bin/mediaplayer
##

## Totem Player (Admin)
sudo cp extras/totemplayer.sh /usr/bin/totemplayer
sudo chmod 755 /usr/bin/totemplayer
sudo chmod +x /usr/bin/totemplayer
##

## Player Config (TRU)
#echo "twitch.tv/trutecnica" > $HOME/player.txt
#echo "https://vivo.solumedia.com:19360/unimar/unimar.m3u8" > $HOME/player.txt
echo "rtmp://nodo7.arcast.live/unimar/unimar" > $HOME/player.txt
chmod 755 $HOME/player.txt
##

## Custom Splash (Admin)
##sudo echo "disable_splash=1" >> /boot/firmware/config.txt
###sudo echo -n " logo.nologo" >> /boot/firmware/cmdline.txt
##sudo sed -i 's/console=tty1/console=tty3/' /boot/firmware/cmdline.txt
##sudo sed -i 's/splash/logo.nologo/' /boot/firmware/cmdline.txt
#sudo sed -i 's/exit 0/dmesg --console-off/' /etc/rc.local
#sudo echo "exit 0" >> /etc/rc.local
#sudo rm /usr/share/plymouth/themes/pix/splash.png
#sudo cp images/splash.png /usr/share/plymouth/themes/pix/splash.png
#sudo chmod -rw-r--r-- /usr/share/plymouth/themes/pix/splash.png
#sudo cp /usr/share/plymouth/themes/pix/splash.png /usr/share/plymouth/themes/pix/splash_back.png
#sudo cat splash.png > /usr/share/plymouth/themes/pix/splash.png
##

## Autostart
mkdir -p $HOME/.config/autostart
cp extras/autorun.txt $HOME/.config/autostart/player.desktop
chmod 755 $HOME/.config/autostart/player.desktop
chmod +x $HOME/.config/autostart/player.desktop
##

## Custom Panel
##pipanel taskbar
sed -i 's/launcher_/#launcher_/' $HOME/.config/wf-panel-pi.ini
echo "notify_enable=false" >> $HOME/.config/wf-panel-pi.ini
echo "notify_timeout=1" >> $HOME/.config/wf-panel-pi.ini
echo "position=top" >> $HOME/.config/wf-panel-pi.ini
echo "icon_size=1" >> $HOME/.config/wf-panel-pi.ini
echo "autohide=true" >> $HOME/.config/wf-panel-pi.ini
echo "minimal_height=0" >> $HOME/.config/wf-panel-pi.ini
echo "autohide_duration=300" >> $HOME/.config/wf-panel-pi.ini
mkdir -p $HOME/.config/lxpanel/LXDE-pi/panels
cat  extras/panel.conf > $HOME/.config/lxpanel/LXDE-pi/panels/panel
pkill wf-panel-pi
##

## Custom Desktop
mkdir -p $HOME/.config
cp images/wallpaper.png $HOME/.config/wallpaper.png
chmod 755 $HOME/.config/wallpaper.png
pcmanfm --set-wallpaper $HOME/.config/wallpaper.png
echo "Esperando 3 segundos para aplicar el fondo de pantalla..."
#sleep 3
#desktop_config="$HOME/.config/pcmanfm/LXDE-pi/desktop-items-*.conf"
#desktop_config="$HOME/.config/pcmanfm/LXDE-pi/desktop-items-HDMI-A-1.conf"
#desktop_config="$HOME/.config/pcmanfm/LXDE-pi/desktop-items-NOOP-1.conf"
sed -i 's/desktop_bg/#desktop_bg/' $HOME/.config/pcmanfm/LXDE-pi/desktop-items-*.conf
sed -i 's/desktop_fg/#desktop_fg/' $HOME/.config/pcmanfm/LXDE-pi/desktop-items-*.conf
sed -i 's/desktop_shadow/#desktop_shadow/' $HOME/.config/pcmanfm/LXDE-pi/desktop-items-*.conf
sed -i 's/show_documents/#show_documents/' $HOME/.config/pcmanfm/LXDE-pi/desktop-items-*.conf
sed -i 's/show_trash/#show_trash/' $HOME/.config/pcmanfm/LXDE-pi/desktop-items-*.conf
sed -i 's/show_mounts/#show_mounts/' $HOME/.config/pcmanfm/LXDE-pi/desktop-items-*.conf
echo "desktop_bg=#FFFFFF" >> $HOME/.config/pcmanfm/LXDE-pi/desktop-items-*.conf
echo "desktop_fg=#FFFFFF" >> $HOME/.config/pcmanfm/LXDE-pi/desktop-items-*.conf
echo "desktop_shadow=#FFFFFF" >> $HOME/.config/pcmanfm/LXDE-pi/desktop-items-*.conf
echo "show_documents=0" >> $HOME/.config/pcmanfm/LXDE-pi/desktop-items-*.conf
echo "show_trash=0" >> $HOME/.config/pcmanfm/LXDE-pi/desktop-items-*.conf
echo "show_mounts=0" >> $HOME/.config/pcmanfm/LXDE-pi/desktop-items-*.conf
pkill pcmanfm
##
