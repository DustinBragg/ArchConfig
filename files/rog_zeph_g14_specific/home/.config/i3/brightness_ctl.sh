
#!/bin/bash

DIRECTION=$1
CUR=$(light -G)

Err() {
	echo "Must pass either + or -"
}

Notify() {
	notify-send -r 2023 -t 1000 -u low -a "" "Brightness: $(light -G)%"
}

if [ -z $DIRECTION ]
then
	Err
	exit
fi

if [ $DIRECTION == "+" ]
then
    if [ $CUR -le 11 ]
    then
	light -A 0.5
    else
	light -A 5
    fi

	Notify
fi

if [ $DIRECTION == "-" ]
then
    if [ $CUR -le 11 ]
    then
	light -U 0.5
    else
	light -U 5
    fi

    Notify
else
    Err
fi
