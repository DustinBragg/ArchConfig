#!/bin/bash


. ./helpers.sh


# must be root
RootCheck


# get path to user's home directory
USER_HOME=$(getent passwd $SUDO_USER | cut -d: -f6)


# make home directories
sudo -u $SUDO_USER mkdir -p "$USER_HOME/Downloads"
sudo -u $SUDO_USER mkdir -p "$USER_HOME/Games"
sudo -u $SUDO_USER mkdir -p "$USER_HOME/Pictures"
sudo -u $SUDO_USER mkdir -p "$USER_HOME/Scratch"
sudo -u $SUDO_USER mkdir -p "$USER_HOME/Shortcuts"
sudo -u $SUDO_USER mkdir -p "$USER_HOME/Software"
chmod a+w "$USER_HOME/Downloads"
chmod a+w "$USER_HOME/Games"
chmod a+w "$USER_HOME/Pictures"
chmod a+w "$USER_HOME/Scratch"
chmod a+w "$USER_HOME/Shortcuts"
chmod a+w "$USER_HOME/Software"


# install git and base-devel
pacman -S --noconfirm --needed git base-devel


# operate from within our Scratch directory
pushd "$USER_HOME/Scratch"


	# install yay (AUR helper)
	git clone https://aur.archlinux.org/yay-bin.git
	chmod a+w yay-bin
	pushd yay-bin
		sudo -u $SUDO_USER makepkg -si --noconfirm
	popd


	# install xterm, xrdb, and bash-completion
	yay -S --noconfirm xterm xrdb bash-completion


	# install i3, i3blocks, and rofi
	yay -S --noconfirm i3 i3blocks rofi


	# install fonts
	yay -S --noconfirm ttf-dejavu ttf-google-fonts ttf-ms-fonts ttf-mac-fonts


popd