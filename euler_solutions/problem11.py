def makeMatrix(inputFileName):
	""" Reads the input file and creates a number matrix """
	inputFile = open(inputFileName, "r")

	for line in inputFile:

		# Split numbers and convert to int
		numbers = line.split(" ")
		numbers = [int(i) for i in numbers]
		# Add to matrix
		numberMatrix.append(numbers)

def solveProblem():
	""" loops through matrix and calculates the 4 number product in each 
		possible direction """

	maxProduct = 0

	# Row
	for i in range(0,len(numberMatrix)):
		# Column
		for j in range(0,len(numberMatrix)):
			## Conditionals for finding products

			# Up
			if(i > 2):
				product = numberMatrix[i][j]

				# multiply by 3 numbers above
				for n in range(1,4):
					product = product * numberMatrix[i-n][j]

				# If new max Product, replace old max
				if(product > maxProduct):
					maxProduct = product

			# Left
			if(j > 2):
				product = numberMatrix[i][j]

				# multiply by 3 numbers to left
				for n in range(1,4):
					product = product * numberMatrix[i][j-n]

				# If new max Product, replace old max
				if(product > maxProduct):
					maxProduct = product


			# Right
			if( j < (len(numberMatrix)-4)):
				product = numberMatrix[i][j]

				# multiply by 3 numbers to right
				for n in range(1,4):
					product = product * numberMatrix[i][j+n]

				if(product > maxProduct):
					maxProduct = product

			# Down
			if( i < (len(numberMatrix)-4)):
				product = numberMatrix[i][j]

				# Multiple by lower 3 numbers
				for n in range(1,4):
					product = product * numberMatrix[i+n][j]

				# If new max Product, replace old max
				if(product > maxProduct):
					maxProduct = product

			# UL Diag
			if(i > 2 and j > 2):
				product = numberMatrix[i][j]

				# multiply by 3 numbers on upper left diagonal
				for n in range(1,4):
					product = product * numberMatrix[i-n][j-n]

				# If new max Product, replace old max
				if(product > maxProduct):
					maxProduct = product

			# UR Diag
			if(i > 2 and j < (len(numberMatrix)-4)):
				product = numberMatrix[i][j]

				# multiply by 3 numbers on upper right diagonal
				for n in range(1,4):
					product = product * numberMatrix[i-n][j+n]

				# If new max Product, replace old max
				if(product > maxProduct):
					maxProduct = product

			# DL Diag
			if(i < (len(numberMatrix)-4) and j > 2):
				product = numberMatrix[i][j]

				# multiply by 3 numbers on lower left diagonal
				for n in range(1,4):
					product = product * numberMatrix[i+n][j-n]

				# If new max Product, replace old max
				if(product > maxProduct):
					maxProduct = product

			# DR Diag
			if(i < (len(numberMatrix)-4) and j < (len(numberMatrix)-4)):
				product = numberMatrix[i][j]

				# multiply by 3 numbers on lower right diagonal
				for n in range(1,4):
					product = product * numberMatrix[i+n][j+n]

				# If new max Product, replace old max
				if(product > maxProduct):
					maxProduct = product

	return(maxProduct)


## Execution Code
numberMatrix = []
makeMatrix("problem11Input.txt")
print("Answer: ", solveProblem())