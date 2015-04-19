#!/bin/bash
echo $(date) >> /Data/alakazam_syncLog.txt
rsync -avzh --progress --delete /Data/ryan/ ryan@charmander:/Data1/ryan/
echo $(date) >> /Data/alakazam_syncLog.txt
echo >> /Data/alakazam_syncLog.txt
scp /Data/alakazam_syncLog.txt ryan@charmander:/Data1/alakazam_syncLog.txt
