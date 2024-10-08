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

#// Copy over root files
section_header_with_output "Copying over root files..."
rsync -av ./files/x_specific/root/ /

#// Replace imgur-screenshot selection mode with 'maim'
sed -i -e 's/scrot -s/maim -so/g' /usr/bin/imgur-screenshot

#// Output at the end
echo ""
echo "---------------"
echo "+ Complete +"
echo "---------------"
echo "You're pretty much finished. If there are hardware-specific configs you want, run the corresponding '03_*' install script(s)."
