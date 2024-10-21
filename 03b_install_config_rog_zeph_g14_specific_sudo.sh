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
if [[ $EUID != 0 ]]; then
    echo "This script must be run as root."
    exit 1
fi

#// Increase lightdm-mini-greeter font size
sed -i 's/font-size = 1em/font-size = 1.2em/g' /etc/lightdm/lightdm-mini-greeter.conf

#// Copy over root files
section_header_with_output "Copying over root files..."
rsync -av ./files/rog_zeph_g14_specific/root/ /

#// Output at the end
echo ""
echo "---------------"
echo "+ Complete +"
echo "---------------"
echo "You're pretty much finished. The last step is to check out and follow the guides on 'https://asus-linux.org/' to complete setup and enable GPU/power/keyboard-backlight management among other things."
echo "If there are additional hardware-specific configs you want, run the corresponding '03_*' install script(s)."