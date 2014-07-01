#!/bin/bash
echo $(date) >> /Data1/syncLog.txt
rsync -avzh --progress --delete /Data1/ryan/ ryan@192.168.1.2:/mnt/himmelwrightData/ryan/Desktop
echo $(date) >> /Data1/syncLog.txt
echo >> /Data1/syncLog.txt
cp /Data1/syncLog.txt /Data2/
cp /Data1/syncLog.txt /Data1/ryan/Dropbox/

# Clear mem cache after sync
sudo sh -c "sync; echo 3 > /proc/sys/vm/drop_caches"
