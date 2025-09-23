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
yay -S --noconfirm --sudoloop --needed - < config_package_list_rog_zeph_g14_specific.txt

#// Append new i3 config stuff (volume/brightness binds, among others)
#// Copy the first config over to make this idempotent
section_header "Copying over config/dot files..."
rm $HOME/.config/i3/config
cp -p $HOME/ArchConfig/files/x_specific/home/.config/i3/config $HOME/.config/i3/config

cat ./files/rog_zeph_g14_specific/home/.config/i3/config_append >> $HOME/.config/i3/config
sed -i -e '17r ./files/rog_zeph_g14_specific/home/.config/i3/i3blocks.conf_append' $HOME/.config/i3/i3blocks.conf

#// Append new .Xresources stuff
sed -i 's/Xcursor.size: 16/Xcursor.size: 48/g' $HOME/.Xresources
cat ./files/rog_zeph_g14_specific/home/.Xresources_append >> $HOME/.Xresources

#// Increase Alacritty font size
sed -i 's/size = 14/size = 18/g' $HOME/.config/alacritty/alacritty.toml

#// Increase Rofi font size
sed -i 's/Bold 12/Bold 18/g' $HOME/.config/rofi/config.rasi

#// Copy files over
cp -r ./files/rog_zeph_g14_specific/home/.config/volumeicon $HOME/.config/
cp -r ./files/rog_zeph_g14_specific/home/Scripts/rofi $HOME/Scripts
cp -p ./files/rog_zeph_g14_specific/home/.config/i3/brightness_ctl.sh $HOME/.config/i3/
cp -p ./files/rog_zeph_g14_specific/home/.config/i3/i3blocks_AsusPowerProfile.sh $HOME/.config/i3/
cp -p ./files/rog_zeph_g14_specific/home/.config/i3/xrandr_auto.sh $HOME/.config/i3/

#// Output at the end
echo ""
echo "---------------"
echo "+ Complete +"
echo "---------------"
echo "Run '03b_install_config_rog_zeph_g14_specific_sudo.sh' as root to continue."
