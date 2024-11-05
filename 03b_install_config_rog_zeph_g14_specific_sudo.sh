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

#// Get user name
Username=$SUDO_USER

#// Add your user to 'video' group, to control 'light'
usermod -aG video $Username

#// Increase lightdm-mini-greeter font size
sed -i 's/font-size = 1em/font-size = 1.2em/g' /etc/lightdm/lightdm-mini-greeter.conf

#// Copy over root files
section_header_with_output "Copying over root files..."
rsync -av ./files/rog_zeph_g14_specific/root/ /

#// Install asus-linux tools
pacman-key --recv-keys 8F654886F17D497FEFE3DB448B15A6B0E9A3FA35
pacman-key --finger 8F654886F17D497FEFE3DB448B15A6B0E9A3FA35
pacman-key --lsign-key 8F654886F17D497FEFE3DB448B15A6B0E9A3FA35
pacman-key --finger 8F654886F17D497FEFE3DB448B15A6B0E9A3FA35

wget "https://keyserver.ubuntu.com/pks/lookup?op=get&search=0x8b15a6b0e9a3fa35" -O g14.sec
pacman-key -a g14.sec

cat ./files/rog_zeph_g14_specific/root/etc/pacman.conf.append >> /etc/pacman.conf

pacman -Syu
pacman -S --noconfirm --needed asusctl power-profiles-daemon supergfxctl switcheroo-control

systemctl enable --now power-profiles-daemon.service
systemctl enable --now supergfxd
systemctl enable --now switcheroo-control

pacman -S --noconfirm --needed rog-control-center

#// Fix dGPU waking on resume-from-sleep
sed -i 's/\"vfio_enable\": false/\"vfio_enable\": true/g' /etc/supergfxd.conf
systemctl enable --now dgpu_toggle_forceoff.service

#// Change GRUB menu text size
sed -i 's/#GRUB_GFXMODE/GRUB_GFXMODE/g' /etc/default/grub
sed -i 's/GRUB_GFXMODE=auto/GRUB_GFXMODE=1280x720/g' /etc/default/grub
sed -i 's/gfxmode=auto/gfxmode=1280x720/g' /boot/grub/grub.cfg

#// Output at the end
echo ""
echo "---------------"
echo "+ Complete +"
echo "---------------"
echo "You're pretty much finished. The last step is to check out and follow the guides on 'https://asus-linux.org/' to complete setup and enable GPU/power/keyboard-backlight management among other things."
echo "If there are additional hardware-specific configs you want, run the corresponding '03_*' install script(s)."
