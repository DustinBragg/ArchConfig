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
		makepkg -si --noconfirm
	popd

popd


# install packages from config_package_list.txt
yay -S --noconfirm --sudoloop --needed - < config_package_list.txt


# install configuration files

# TODO: How to do this? Separate script you run as root?
# TODO: Can I prompt for root here and do it reliably?

	# TODO: Maybe do this in another script, need to pass username to a couple files:
		.bash_profile
		.gtkrc-2.0
		lightdm-mini-greeter.conf

# TODO: commands
	~/.icons/default symlink
	chmod 664 /usr/share/fonts/MyFonts
	fc-cache -f

# TODO: install_apps, pull other things from DebianConfig
# TODO: install_apps, can I pull down 4coder reliably? Then include my config and a shortcut

ranger --copy-config all