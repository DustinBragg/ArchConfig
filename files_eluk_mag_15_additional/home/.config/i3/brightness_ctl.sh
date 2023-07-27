#!/bin/bash

DIRECTION=$1
CUR=$(xbacklight -get)

Err() {
	echo "Must pass either + or -"
}

Notify() {
	notify-send -r 2023 -t 1000 -u low -a "" "Brightness: $(xbacklight -get)%"
}

if [ -z $DIRECTION ]
then
	Err
	exit
fi

if [ $DIRECTION == "+" ]
then
	if [ $CUR -ge 100 ]
	then
		xbacklight -set 100
	else
		if [ $CUR -lt 10 ]
		then
			if [ $CUR -eq 1 ]
			then
				xbacklight -fps 5 -inc 1
			else
				xbacklight -fps 10 -inc 2
			fi
		else
			xbacklight -fps 20 -inc 10
		fi
	fi

	Notify
fi

if [ $DIRECTION == "-" ]
then
	if [ $CUR -le 1 ]
	then
		xbacklight -fps 5 -set 1
	else
		if [ $CUR -le 10 ]
		then
			if [ $CUR -eq 2 ]
			then
				xbacklight -fps 10 -inc -1
			else
				xbacklight -fps 20 -inc -2
			fi
		else
			xbacklight -inc -10
		fi
	fi

	Notify
else
	Err
fi
