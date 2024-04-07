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

#// Root check
if [[ $EUID != 0 ]]; then
    echo "This script must be run as root."
    exit 1
fi

if [ "$1" != "-s" ]; then
   echo "-*************-"
   echo "Make sure you ran the normal 'install_config.sh' file first. Things will not work properly if you haven't run that script first."
   echo "-*************-"
   read -p "Press Ctrl+C to stop or ENTER to proceed "
fi

#// Get user name
Username=$SUDO_USER

#// Copy over root files
section_header_with_output "Copying over root files..."
rsync -av ./files/generic/root/ /

#// Install fonts
section_header "Installing fonts..."
sudo -u $Username fc-cache -f

#// Update username in lightdm-mini-greeter and enable lightdm
sed -i -e "/user =/ s/= .*/= $Username/" /etc/lightdm/lightdm-mini-greeter.conf
sudo systemctl enable lightdm.service -f

#// Output at the end
echo ""
echo "---------------"
echo "+ Complete +"
echo "---------------"
echo "The next step is to run the '02_install_*' script for either X11 (i3) or Wayland (sway) depending on which you want to use."