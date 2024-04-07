#!/bin/bash

# Script to find current swaybg processes, launch new ones, wait a sec, then kill the old ones.
# This is so we can change wallpapers without a grey solid color in between changes because everything is terrible apparently

# Stuff we need
WALLPAPER_FOLDER="$HOME/Pictures/Wallpapers"
OUTPUTS=$(swaymsg -t get_outputs | grep name | sed 's/\"name\"://g' | sed 's/,//g' | sed 's/\"//g')

# Grab current wallpapers as a list
all_wallpapers=$(find $WALLPAPER_FOLDER -type f)

# Grab current swaybg pids
cur_swaybgs=$(pidof swaybg)

# Start new swaybg processes, changing to a random background per-output
for i in ${OUTPUTS}
do
    random_wallpaper=$(echo "$all_wallpapers" | shuf -n 1)
	all_wallpapers=$(echo "$all_wallpapers" | sed -e "s,$random_wallpaper,,g")
	all_wallpapers=$(echo "$all_wallpapers" | sed -e '/^$/d')
    swaybg -o $i -i $random_wallpaper -m fill &
done

# Wait a second
sleep 1s

# Kill the old ones
for i in ${cur_swaybgs}
do
    kill $i
done