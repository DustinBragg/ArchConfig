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
mkdir -p .config/dunst
mkdir -p .config/fontconfig
mkdir -p .config/gtk-3.0
mkdir -p .config/i3
mkdir -p .config/picom
mkdir -p .config/qt5ct
mkdir -p .config/ranger/colorschemes
mkdir -p .config/rofi
mkdir -p .icons
cp -r ./files/home/* /home/$SUDO_USER/
mkdir -p /etc/lightdm
mkdir -p /etc/X11/xorg.conf.d
mkdir -p /usr/bin
mkdir -p /usr/share/fonts/MyFonts
cp -r ./files/root/* /


#// Update username in lightdm-mini-greeter
sed -i -e "/user =/ s/= .*/= $Username/" /etc/lightdm/lightdm-mini-greeter.conf

#// Update font cache and permissions
chmod -R 664 /usr/share/fonts/MyFonts
fc-cache -f

