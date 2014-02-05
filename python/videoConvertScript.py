import os
import sys

def f(string):
    return string.strip()

inputFile=  open("/usr/home/ryan/Desktop/convertList.txt", "r")
scriptFile= open("/usr/home/ryan/Desktop/.convertScript", "w")
songName = ""
songLink = ""
count = 0
for line in inputFile:
    count = count + 1
    if(count % 2 == 0):
        songLink =f(line)
        print(songName + " " + songLink)
        printString= 'youtube2mp3 "' +songLink+ '" "' +songName+'.mp3"'
#        outfile = open("convertScript.sh", "w")
        print(printString, file= scriptFile)
        print(count)
        print("--")
    else:
        songName = f(line)
        
inputFile.close()
scriptFile.close()
os.system('chmod +x .convertScript')
os.system('./.convertScript')
os.system('rm .convertScript')

















