#!/bin/bash

# variables
SITEDIR=~/Network/ryanhimmelwright/

SCREENDIR=$SITEDIR/my_screen/
SCREENNAME=screenshot.png

TEMPLATELOC=$SITEDIR/_templates/blank_screen_content.md
SCREENCONTENTNAME=my_screen.md

## Take Screenshot and save in jekyll folder
scrot $SCREENDIR$SCREENNAME


## Copy markdown template
cp $TEMPLATELOC $SITEDIR/$SCREENCONTENTNAME

echo -e "Screenshot taken at: <i>`date` </i> from host: <i>`hostname`</i>\n\n" >> $SITEDIR/$SCREENCONTENTNAME

read -r -p "Would you like to add a note? " response

if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]
	then
	read -r -p "Enter Message: " message
	echo -e "Note:\n\n$message" >> $SITEDIR/$SCREENCONTENTNAME
fi
