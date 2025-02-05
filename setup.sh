## Linux
sudo apt-get update
sudo apt-get -y upgrade
sudo apt-get -y install vlc
sudo apt-get -y install python3-pip
sudo apt-get -y install python3-full
sudo apt-get -y install steamlink

## Python (streamlink)
sudo pip3 install streamlink --break-system-packages

## Media Player
sudo wget https://raw.githubusercontent.com/lucianolagassa/totemplayer/refs/heads/main/mediaplayer.sh -O /usr/bin/mediaplayer
sudo chmod 755 /usr/bin/mediaplayer
sudo chmod +x /usr/bin/mediaplayer

## Totem Player
sudo wget https://raw.githubusercontent.com/lucianolagassa/totemplayer/refs/heads/main/totemplayer.sh -O /usr/bin/totemplayer
sudo chmod 755 /usr/bin/totemplayer
sudo chmod +x /usr/bin/totemplayer

## Player Config
echo "twitch.tv/trutecnica" > $HOME/player.txt
chmod 755 $HOME/player.txt

## Auto Start
wget https://raw.githubusercontent.com/lucianolagassa/totemplayer/refs/heads/main/autorun.txt -O $HOME/.config/autostart/player.desktop
mkdir -p $HOME/.config/autostart
chmod 755 $HOME/.config/autostart/player.desktop
chmod +x $HOME/.config/autostart/player.desktop
