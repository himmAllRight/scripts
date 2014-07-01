#!/bin/bash
echo $(date) >> /Data1/syncLog.txt
rsync -avzh --progress --delete /Data1/ryan/ /Data2/ryan/
echo $(date) >> /Data1/syncLog.txt
echo >> /Data1/syncLog.txt
cp /Data1/syncLog.txt /Data2/
cp /Data1/syncLog.txt /Data1/ryan/Dropbox/
