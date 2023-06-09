#!/bin/bash

#// Non-Root Check
if [[ $EUID == 0 ]]; then
	echo "This script must be run as a normal user."
	exit 1
fi

#// Get path to user's home directory
USER_HOME=$HOME

#// Make home directories
mkdir -p "$USER_HOME/Downloads"
mkdir -p "$USER_HOME/Games"
mkdir -p "$USER_HOME/Pictures"
mkdir -p "$USER_HOME/Scratch"
mkdir -p "$USER_HOME/Shortcuts"
mkdir -p "$USER_HOME/Software"


#// Operate from within our Scratch directory
pushd "$USER_HOME/Scratch"

	# install yay (AUR helper)
	git clone https://aur.archlinux.org/yay-bin.git
	chmod a+w yay-bin
	pushd yay-bin
		makepkg -si --noconfirm
	popd

	rm -rf "$USER_HOME/Scratch/yay-bin"

popd


#// Install packages from 'config_package_list.txt'
yay -S --noconfirm --sudoloop --needed - < config_package_list.txt

#// Remove some packages that cause slow startup for some apps
yay -R --noconfirm malcontent flatpak xdg-desktop-portal


ranger --copy-config all
