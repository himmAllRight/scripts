def makeMatrix():
	inputFile = open("problem11Input.txt", "r")

	for line in inputFile:
		print(line)

		numbers = line.split(" ")

		numberMatrix.append(numbers)


## Execution Code
numberMatrix = []
makeMatrix()
print(numberMatrix[0][2])