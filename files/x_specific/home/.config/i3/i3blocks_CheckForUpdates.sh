#!/bin/bash

#// Query pending updates and capture it as a number
NumUpdates=$(checkupdates | wc -l)

Color="#feca88"
#Color="#aac474"
#Color="#c55555"
PluralOrNot="updates"
if [ $NumUpdates -eq 1 ]; then
PluralOrNot="updates"
fi

if [ $NumUpdates -gt 8 ]; then
Color="#aac474"
fi
if [ $NumUpdates -gt 15 ]; then
Color="#c55555"
fi

if [ $NumUpdates -ge 0 ]; then
echo " ${NumUpdates} ${PluralOrNot} available"
echo 
echo "${Color}"
else
echo 
fi