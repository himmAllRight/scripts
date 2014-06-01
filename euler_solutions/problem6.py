def getFirstNumber(didg):
	""" Returns the square of sums """
	value = 0

	for x in range(1,didg + 1):
		value = value + x

	return(value**2)

def getSecondNumber(didg):
	""" Returns the sum of squares """
	value = 0

	for x in range(1, didg + 1):
		value = value + (x**2)

	return(value)



## Execution Code ##
didget = 100

n1 = getFirstNumber(didget)
n2 = getSecondNumber(didget)

# Print Answer
print(n1 - n2)