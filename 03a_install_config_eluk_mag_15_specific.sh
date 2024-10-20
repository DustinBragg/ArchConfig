#!/bin/bash

section_header () {
	echo ""
	echo "---------------"
	echo ""
	echo $1
}

section_header_with_output () {
	section_header "$1"
	echo "---"
}

#// Root Check
if [[ $EUID == 0 ]]; then
	echo "This script must be run as a normal user."
	exit 1
fi

#// Install apps specific to this laptop config
section_header_with_output "Installing packages..."
yay -S --noconfirm --sudoloop --needed - < config_package_list_eluk_mag_15_specific.txt

#// Append new i3 config stuff (volume/brightness binds, among others)
#// Copy the first config over to make this idempotent
section_header "Copying over config/dot files..."
rm $HOME/.config/i3/config
cp -p $HOME/ArchConfig/files/x_specific/home/.config/i3/config $HOME/.config/i3/config

cat ./files/eluk_mag_15_specific/home/.config/i3/config_append >> $HOME/.config/i3/config

#// Copy files over
cp -r ./files/eluk_mag_15_specific/home/.config/volumeicon $HOME/.config/
cp -p ./files/eluk_mag_15_specific/home/.config/i3/brightness_ctl.sh $HOME/.config/i3/

#// Output at the end
echo ""
echo "---------------"
echo "+ Complete +"
echo "---------------"
echo "Run '03b_install_config_eluk_mag_15_specific_sudo.sh' as root to continue."
