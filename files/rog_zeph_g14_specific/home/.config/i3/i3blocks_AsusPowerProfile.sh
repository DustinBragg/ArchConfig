#!/bin/bash

if [ $BLOCK_BUTTON ]; then
    i3-msg exec -q "rofi -modes \"Select Power Profile:~/Scripts/rofi/asus_power_profile.sh\" -show \"Select Power Profile\""
fi

CurrentMode=$(asusctl profile -p | awk 'END { print $NF }')

if [ "$CurrentMode" = "Balanced" ]; then
    echo " Balanced"
    echo ""
    echo "#88FF88"
fi

if [ "$CurrentMode" = "Performance" ]; then
    echo " Performance"
    echo ""
    echo "#FECA88"
fi

if [ "$CurrentMode" = "Quiet" ]; then
    echo " Quiet"
    echo ""
    echo "#5588CC"
fi
