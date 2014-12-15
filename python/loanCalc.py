import csv

# Calcuates the interest added to a loan over a period.
def calcInterest(princ, percent, t, interest = 0):
	newInterest = interest + (princ * (percent/36500))
	if(t <= 0):
		return(newInterest)
	else:
		return(calcInterest(princ, percent , t-1, interest = newInterest))


# size the size of the data list, and n is the
# number of items to be divided across size.
def allParamsSets(size, n):
	solutions = []

	# Moving the start across the size
	for i in range(0, size - 1):
		l    = [0] * size
		l[i] = n
		solutions.append(l[:])

		# Trickle values down to the end
		j = size - 2
		while l[-1] != n:
			if(l[j] > 0):
				l[j]   = l[j] - 1
				l[j+1] = l[j+1] +1
				solutions.append(l[:])
				j = size - 2

			else:
				j = j - 1

	return(solutions)

# Run Main, NOTE: princeList is the principle values AFTER the min payment for month
# is already factored in.
def runAlgs(princList, percentList, amount, minAmount, t):
	# Get params List
	startParams = allParamsSets(len(princList), int(amount/minAmount))
	results     = []

	for paramSet in startParams:
		startVals      = list(map(lambda a, b: a - (b * minAmount), princList, paramSet))
		interestVals   = list(map(lambda a, b: calcInterest(a, b, t), startVals, percentList))
		
		results.append([sum(interestVals)] + list(map(lambda a: a * minAmount, paramSet)))

	# Sort results
	results.sort(key= lambda x: x[0])

	# Return top 10 Results, if available, otherwise, print all results
	if(len(results) >= 10):
		return(results[:10])
	else:
		return(results)
		

# Simple function to load in data from file.
def loadFile(inFilePath):
	inFile = open(inFilePath, "r", newline= "")
	names = []
	princ = []
	inter = []

	# Try to open save file
	try:
		# For each line, load and add new gear item.
		with open(inFilePath, 'r+', newline='') as data:
			reader = csv.reader(data, delimiter= ",")

			# For each line if file, load gear item.
			i = 1
			for line in reader:
				if(i == 1):
					names = line
				if(i == 2):
					princ = list(map(float, line))
				if(i == 3):
					inter = list(map(float, line))
				i = i + 1
				print(line)

	except IOError:
		# If IO error, make file.
		f = open(inFilePath, "w+")
		f.close()

	return([names, princ, inter])

# Function to nicely print out results


inData = loadFile("/home/ryan/owncloud/Rebecca_Share/testLoans.csv")

print(runAlgs(inData[1], inData[2], 200, 10, 30))