#!/bin/bash

cur_wlsunset=$(pidof wlsunset)
if [ $? == 0 ]; then
#	// Kill it if it's running
	kill $cur_wlsunset
else
#	// Start it if it's off
	wlsunset -l 37.6 -L -97.3 &
fi

#pkill -RTMIN+52 waybar