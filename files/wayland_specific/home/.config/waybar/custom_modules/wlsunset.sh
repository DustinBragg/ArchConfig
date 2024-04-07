#!/bin/bash

sleep 0.25s
cur_wlsunset=$(pidof wlsunset)
if [ $? == 0 ]; then
	echo Light 
	echo "Night Light ON"
else
	echo Light 
	echo "Night Light OFF"
fi