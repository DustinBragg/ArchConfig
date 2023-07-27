#!/bin/bash


#// Root Check
if [[ $EUID == 0 ]]; then
	echo "This script must be run as a normal user."
	exit 1
fi

#// Install apps specific to this laptop config
yay -S --noconfirm --sudoloop --needed - < eluk_mag_15_additional_package_list.txt

#// Append new i3 config stuff (volume/brightness binds, among others)
#// This check makes this script idempotent
if [[ ! -f "$HOME/.config/i3/config_bak" ]]
then
	cp $HOME/.config/i3/config $HOME/.config/i3/config_bak
else
	rm $HOME/.config/i3/config
	cp $HOME/.config/i3/config_bak $HOME/.config/i3/config
fi

cat ./files_eluk_mag_15_additional/home/.config/i3/config_append >> $HOME/.config/i3/config

#// Copy files over
cp -r ./files_eluk_mag_15_additional/home/.config/volumeicon $HOME/.config/
cp -p ./files_eluk_mag_15_additional/home/.config/i3/brightness_ctl.sh $HOME/.config/i3/
