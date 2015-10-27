#!/bin/bash
echo $(date) >> /Data1/syncLog.txt
rsync -avzh --progress --delete /Data1/ /Data2/
echo $(date) >> /Data1/syncLog.txt
echo >> /Data1/syncLog.txt
cp /Data1/syncLog.txt /Data2/
