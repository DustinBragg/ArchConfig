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

#// Non-root check
if [[ $EUID == 0 ]]; then
    echo "This script must be run as a normal user, not root."
    echo "You will be prompted for sudo password during script execution for 'yay'."
    exit 1
fi

#// Install packages from the X-specific config package list
section_header_with_output "Installing packages..."
yay -S --noconfirm --sudoloop --needed - < config_package_list_wayland_specific.txt

#// Copy over user config/dot files
section_header_with_output "Copying over config/dot files..."
rsync -av ./files/wayland_specific/home/ $USER_HOME/

#// Output at the end
echo ""
echo "---------------"
echo "+ Complete +"
echo "---------------"
echo "Run '02b_install_config_wayland_specific_sudo.sh' as root to continue."