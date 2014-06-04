class Game:	
	def makeMaze(self,inputFileName):
		""" Reads the input file and creates a number matrix """
		inputFile = open(inputFileName, "r")

		for line in inputFile:
			line = line.strip("\n")
			# Add to matrix
			self.maze.append(line)

	def findStart(self):
		i = 0
		for row in range(0,len(self.maze)):
			j = 0
			for cell in self.maze[row]:
				if(cell == "S"):
					return(i,j)
			
				j = j + 1

			i = i + 1

	def __init__(self):
		self.maze = []
		self.makeMaze("maze165_EasyInput.txt")
		startX, startY = self.findStart()

class Board:
	def __init__(self, prevBoard, posX, posY):
		self.tempBoard = prevBoard
		self.x = posX
		self.y = posY
		self.options = []

	def findOptions(self):
		## If Down open
		if(tempBoard[self.x + 1][self.y] == " "):
			self.options.append(1)

		## If Right open
		if(tempBoard[self.x][self.y + 1] == " "):
			self.options.append(2)

		## If Left open
		if(tempBoard[self.x][self.y - 1] == " "):
			self.options.append(3)

		## If Up open
		if(tempBoard[self.x - 1][self.y] == " "):
			self.options.append(4)

	def makeMove(self):
		# Trapped
		if(len(self.options) < 1):
			return()

		else:
			if(options[0] == 1):
				self.tempBoard[self.x][self.y] = "*"
				Board(tempBoard, self.x + 1, self.y)

## Execution Code ##
Game()