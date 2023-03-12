#!/bin/bash


. ./helpers.sh


# get path to user's home directory
USER_HOME=$HOME
echo $USER_HOME

# make home directories
mkdir -p "$USER_HOME/Downloads"
mkdir -p "$USER_HOME/Games"
mkdir -p "$USER_HOME/Pictures"
mkdir -p "$USER_HOME/Scratch"
mkdir -p "$USER_HOME/Shortcuts"
mkdir -p "$USER_HOME/Software"
chmod a+w "$USER_HOME/Downloads"
chmod a+w "$USER_HOME/Games"
chmod a+w "$USER_HOME/Pictures"
chmod a+w "$USER_HOME/Scratch"
chmod a+w "$USER_HOME/Shortcuts"
chmod a+w "$USER_HOME/Software"


# operate from within our Scratch directory
pushd "$USER_HOME/Scratch"

	# install yay (AUR helper)
	git clone https://aur.archlinux.org/yay-bin.git
	chmod a+w yay-bin
	pushd yay-bin
		sudo -u $SUDO_USER makepkg -si --noconfirm
	popd

popd


# install packages from config_package_list.txt
yay -S --noconfirm --sudoloop --needed - < config_package_list.txt


# install configuration files

ranger --copy-config all