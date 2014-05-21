#!/bin/bash

# A script that makes a power hour

INPUTFILE=$1
TIMEWINDOW=$2
lineCount=1

echo -e "Will load from file $1, and make clips at $2 seconds"

# Make clips folder
mkdir .tempClips

# get and make clips
while read line
do
let evenCheck=$"(($lineCount%2)"

if [ evenCheck -eq 0 ]
  # If Even (sec start)
  then
    echo $line   
 
  # If Odd (video link)
  else
    URL=$line

    # Download video clip
    youtube-dl --output=".tempClips/clip$lineCount.mp4" --format=18 "$URL"

    # Chop video
    
    
fi

done < $INPUTFILE


# Remove temp clips folder

#rm -R .tempClips
