import os
import sys

def f(string):
    return string.strip()

fileType      = "mp3"
inputFileLoc  = "/home/ryan/owncloud/convertList.txt"
scriptFileLoc = "/home/ryan/owncloud/.convertScript"
outputLoc     = "/home/ryan/Downloads/mps/"
inputFile     = open(inputFileLoc, "r")
scriptFile    = open(scriptFileLoc, "w")
songName      = ""
songLink      = ""
count = 0
for line in inputFile:
    count = count + 1
    if(count % 2 == 0):
        songLink =f(line)
        print(songName + " " + songLink)
        printString= 'youtube-dl ' +songLink+ ' -x --audio-format "' + fileType + '" -o "'  +songName+'.mp3"'
#        outfile = open("convertScript.sh", "w")
        print(printString, file= scriptFile)
        printString= 'mv "'+ songName+'.mp3" "' + outputLoc + songName + '.mp3"'
        print(printString, file= scriptFile)
        print(count)
        print("--")
    else:
        songName = f(line)
        
inputFile.close()
scriptFile.close()
cmd = "chmod +x " + scriptFileLoc
os.system(cmd)
os.system(scriptFileLoc)
#os.system('rm .convertScript')

















