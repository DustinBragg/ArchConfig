#!/bin/bash

#// Non-Root Check
if [[ $EUID == 0 ]]; then
	echo "This script must be run as a normal user."
	exit 1
fi

#// Make sure 'yay' is installed
which yay 2> /dev/null > /dev/null
if [ $? -eq 1 ]
then
	echo "ERROR: Couldn't find 'yay'. Did you forget to run the 'install_config.sh' script first?"
	exit
fi

#// Install packages from 'app_package_list.txt'
yay -S --noconfirm --sudoloop --needed - < app_package_list.txt