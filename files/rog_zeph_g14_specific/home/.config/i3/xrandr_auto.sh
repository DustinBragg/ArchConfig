#!/bin/bash

Mode=$(supergfxctl -g)
if [[ $Mode == "AsusMuxDgpu" ]];
then
    xrandr --output DP-2 --primary --mode 2880x1800 --rate 120 --dpi 144
else
    xrandr --output eDP --primary --mode 2880x1800 --rate 120 --dpi 144
fi
