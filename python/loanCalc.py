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

	for paramSet in startParams:
		startVals = list(map(lambda a, b: a - (b * minAmount), princList, paramSet))
		endVals   = list(map(lambda a, b: calcInterest(a, b, t), startVals, percentList))
		print(sum(endVals))




f = allParamsSets(3, 10)

l1 = [2000, 3000]
l2 = [4, 6]

runAlgs(l1, l2, 200, 10, 30)