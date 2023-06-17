#!/bin/bash


#// Root Check
if [[ $EUID -ne 0 ]]; then
	echo "This script must be run as root."
	exit 1
fi


#// Get user name
Username=$1
if [ -z "$1" ]
then
	Username=$SUDO_USER
fi


echo "Installing config for user '$Username'..."

#// Copy files over to 'home' and 'root'
sudo -u $Username mkdir -p /home/$Username/.config/dunst
sudo -u $Username mkdir -p /home/$Username/.config/fontconfig
sudo -u $Username mkdir -p /home/$Username/.config/gtk-3.0
sudo -u $Username mkdir -p /home/$Username/.config/i3
sudo -u $Username mkdir -p /home/$Username/.config/picom
sudo -u $Username mkdir -p /home/$Username/.config/qt5ct
sudo -u $Username mkdir -p /home/$Username/.config/ranger/colorschemes
sudo -u $Username mkdir -p /home/$Username/.config/rofi
sudo -u $Username chmod -R 777 /home/$Username/.config
sudo -u $Username mkdir -p /home/$Username/.icons
sudo -u $Username chmod -R 777 /home/$Username/.icons
sudo -u $Username cp -ra ./files/home/. /home/$Username/
mkdir -p /etc/lightdm
mkdir -p /etc/X11/xorg.conf.d
mkdir -p /usr/bin
mkdir -p /usr/share/fonts/MyFonts
cp -ra ./files/root/. /


#// Update username in lightdm-mini-greeter and enable lightdm
sed -i -e "/user =/ s/= .*/= $Username/" /etc/lightdm/lightdm-mini-greeter.conf
sudo systemctl enable lightdm.service -f

#// Update font cache and permissions
chmod -R 777 /usr/share/fonts/MyFonts
sudo -u $Username fc-cache -f
