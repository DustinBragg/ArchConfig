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
mkdir -p /home/$Username/.config/dunst
mkdir -p /home/$Username/.config/fontconfig
mkdir -p /home/$Username/.config/gtk-3.0
mkdir -p /home/$Username/.config/i3
mkdir -p /home/$Username/.config/picom
mkdir -p /home/$Username/.config/qt5ct
mkdir -p /home/$Username/.config/ranger/colorschemes
mkdir -p /home/$Username/.config/rofi
mkdir -p /home/$Username/.icons
cp -R ./files/home/* /home/$Username/
mkdir -p /etc/lightdm
mkdir -p /etc/X11/xorg.conf.d
mkdir -p /usr/bin
mkdir -p /usr/share/fonts/MyFonts
cp -R ./files/root/* /


#// Update username in lightdm-mini-greeter
sed -i -e "/user =/ s/= .*/= $Username/" /etc/lightdm/lightdm-mini-greeter.conf

#// Update font cache and permissions
chmod -R 664 /usr/share/fonts/MyFonts
fc-cache -f

