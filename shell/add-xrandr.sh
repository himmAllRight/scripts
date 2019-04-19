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


# A function to prompt the user if they want to switch to the new mode now.
switch_to_new_mode () {
	echo -n "Switch to new mode now? [y/n]: "
	read change
	if [ "$change" == "y" ]
	then
		echo "switching monitor..."
		xrandr --output $MONITOR --mode $modename
	else
		echo "Okay, no switch. Enjoy!"
	fi
}


if [ "$modeexists" == "" ]
then
	echo "Adding new mode: $gtf_output"
	xrandr --newmode $gtf_output
	echo "Adding new mode [$modename] to display [$MONITOR]"
	xrandr --addmode $MONITOR $modename
	echo "Done!"
	switch_to_new_mode
else
	echo "Hmmm... I think that mode already exists. Verify the xrandr output for me?"
	echo "Don't worry. I'll print it in $ESLEEP seconds..."
	sleep $ESLEEP
	xrandr
fi
