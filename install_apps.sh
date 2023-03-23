#!/bin/bash


#// Make sure 'yay' is installed
which yay 2> /dev/null > /dev/null
if [ $? -eq 1 ]
then
	echo "ERROR: Couldn't find 'yay'. Did you forget to run the 'install_config.sh' script first?"
	exit
fi

// Install packages from 'app_package_list.txt'
yay -S --noconfirm --sudoloop --needed - < app_package_list.txt