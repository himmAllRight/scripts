#!/bin/bash
echo $(date) >> /run/media/ryan/External/sync_log.txt
rsync -avzh --progress --delete /Data1 /run/media/ryan/External/Data1
echo $(date) >> /run/media/ryan/External/sync_log.txt
echo >> /run/media/ryan/External/sync_log.txt
