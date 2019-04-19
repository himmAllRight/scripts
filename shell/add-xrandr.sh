#!/bin/bash

WIDTH=$1
HEIGHT=$2
MONITOR=$3

gtf_output=$(gtf $WIDTH $HEIGHT 59.9 | grep -i "modeline" | sed -e 's/\<Modeline\>//g')
echo $gtf_output
modename=$(echo $gtf_output | grep -o  "\(\".*\"\)")
echo $modename

xrandr --newmode $gtf_output
xrandr --addmode $MONITOR "1920x1200_59.90"
