#!/bin/bash

WIDTH=$1
HEIGHT=$2
MONITOR=$3
ESLEEP=3

gtf_output=$(gtf $WIDTH $HEIGHT 59.9 | grep -i "modeline" | sed -e 's/\<Modeline\>//g')
# echo $gtf_output
modename=$(echo $gtf_output | grep -o  "\(\".*\"\)")
# echo $modename
modeexists=$(xrandr | grep -i $modename)

if [ "$modeexists" == "" ]
then
	echo "xrandr --newmode $gtf_output"
	xrandr --newmode $gtf_output
	#echo "xrandr --addmode $MONITOR $modename"
	#xrandr --addmode $MONITOR $modename
else
	echo "Hmmm... I think that mode already exists. Verify the xrandr output for me?"
	echo "Don't worry. I'll print it in $ESLEEP seconds..."
	sleep $ESLEEP
	xrandr
fi
