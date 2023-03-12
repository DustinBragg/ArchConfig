#!/bin/bash


. ./helpers.sh


# must be root
RootCheck


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


# install yay (AUR helper)
pushd "$USER_HOME/Scratch"

git clone https://aur.archlinux.org/yay-bin.git
chmod a+w yay-bin
pushd yay-bin
sudo -u $SUDO_USER makepkg -si --noconfirm
popd

popd