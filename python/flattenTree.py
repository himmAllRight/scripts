import os
import sys


# The main loop, flattens the files for each sub directory
def mainLoop(rootDir):
    for curr in os.listdir(rootDir):
        subDir = rootDir + '/' + curr
        if(os.path.isdir(subDir)):
            print(curr)
            relocateFiles(subDir)

# Recurses through the sub directories and returns a list of pairs
# containing the file's relative path and file name
def buildFileList(inDir, fileList= []):
    for dirName in os.listdir(inDir):
        nextDir = inDir + '/' + dirName
        if(os.path.isfile(nextDir)):
            fileList.append((nextDir, dirName))
        elif(os.path.isdir(nextDir)):
            fileList = fileList + buildFileList(nextDir)
    return(fileList)

# Recursively moves all files down the tree starting at inDir, and
# moves them to inDir.
def relocateFiles(inDir):
    for file in buildFileList(inDir):
        if(os.path.isfile(file[0])):
            print('Moving %s to %s.' % (file[0], inDir + '/' + file[1]))
            os.rename(file[0], inDir + '/' + file[1])
    for curr in os.listdir(inDir):
        deleteDir = inDir + '/' + curr
        if(os.path.isdir(deleteDir)):
           print('Removing %s' % curr)
           os.system('rm -r "%s"' % deleteDir)
            

# Execution Code
mainLoop('./testing')
