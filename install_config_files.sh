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


echo "Installing config for user '$Username'...


#// Copy files over to 'home' and 'root'
cp -r ./files/home/* /home/$SUDO_USER/
cp -r ./files/root/* /


#// Update username in lightdm-mini-greeter
sed -i -e "/user =/ s/= .*/= $Username/" /etc/lightdm/lightdm-mini-greeter.conf

#// Update font cache and permissions
chmod -R 664 /usr/share/fonts/MyFonts
fc-cache -f

