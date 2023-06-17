#!/bin/bash


#// Root Check
if [[ $EUID == 0 ]]; then
	echo "This script must be run as a normal user."
	exit 1
fi

#// Get user name
Username=$1
if [ -z "$1" ]
then
	Username=$SUDO_USER
fi

#// Install apps specific to this laptop config
sudo -u $Username yay -S --noconfirm --sudoloop --needed - < eluk_mag_15_additional_package_list.txt

#// Needed for backlight control
groupadd video
usermod -aG video $Username

#// Append new i3 config stuff (volume/brightness binds, among others)
#// This check makes this script idempotent
if [[ ! -f "/home/$Username/.config/i3/config_bak" ]]
then
	cp /home/$Username/.config/i3/config /home/$Username/.config/i3/config_bak
else
	rm /home/$Username/.config/i3/config
	cp /home/$Username/.config/i3/config_bak /home/$Username/.config/i3/config
fi

cat ./files_eluk_mag_15_additional/home/.config/i3/config_append >> /home/$Username/.config/i3/config