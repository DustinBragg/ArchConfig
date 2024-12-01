#!/bin/bash

#// Query pending updates and capture it as a number
NumUpdates=$(checkupdates | wc -l)

Color="#aac474"
PluralOrNot="updates"
if [ $NumUpdates -eq 1 ]; then
PluralOrNot="update"
fi

if [ $NumUpdates -gt 10 ]; then
Color="#feca88"
fi
if [ $NumUpdates -gt 20 ]; then
Color="#c55555"
fi

if [ $NumUpdates -gt 0 ]; then
echo " ${NumUpdates} ${PluralOrNot} available "
echo 
echo "${Color}"
else
echo 
fi
