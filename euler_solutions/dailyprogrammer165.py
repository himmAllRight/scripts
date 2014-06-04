class Game:	
	def makeMaze(self,inputFileName):
		""" Reads the input file and creates a number matrix """
		inputFile = open(inputFileName, "r")

		for line in inputFile:
			line = line.strip("\n")
			# Add to matrix
			self.maze.append(list(line))

	def findStart(self):
		i = 0
		for row in range(0,len(self.maze)):
			j = 0
			for cell in self.maze[row]:
				if(cell == "S"):
					return(i,j)
			
				j = j + 1

			i = i + 1




	def __init__(self, inputFileName):
		self.maze = []
		self.makeMaze(inputFileName)
		self.startX, self.startY = self.findStart()

		# Run Solver
		solvedBoard = Board(self.maze, self.startX, self.startY)

		# Replace Starts
		solvedBoard.board[self.startX][self.startY] = "S"
		solvedBoard.printBoard()
		

class Board:
	def __init__(self, prevBoard, posX, posY):
		self.board = prevBoard
		self.Complete  = False
		self.x 		   = posX
		self.y 		   = posY
		self.options   = []

		self.findOptions()
		self.makeMove()

	def printBoard(self):
		maze = self.board

		for line in maze:
			line = ' '.join(line)
			print(line)

	def findOptions(self):
		## If Down open
		if(self.board[self.x + 1][self.y] == " "):
			self.options.append(1)
		elif(self.board[self.x + 1][self.y] == "E"):
			self.board[self.x][self.y] = "*"
			self.Complete = True
			return(self)

		## If Right open
		if(self.board[self.x][self.y + 1] == " "):
			self.options.append(2)
		elif(self.board[self.x][self.y + 1] == "E"):
			self.board[self.x][self.y] = "*"
			self.Complete = True
			return(self)

		## If Left open
		if(self.board[self.x][self.y - 1] == " "):
			self.options.append(3)
		elif(self.board[self.x][self.y - 1] == "E"):
			self.board[self.x][self.y] = "*"
			self.Complete = True
			return(self)

		## If Up open
		if(self.board[self.x - 1][self.y] == " "):
			self.options.append(4)
		elif(self.board[self.x - 1][self.y] == "E"):
			self.board[self.x][self.y] = "*"
			self.Complete = True
			return(self)

	def makeMove(self):
		
		while(self.Complete == False):
			# Trapped
			if(len(self.options) < 1):
				return(self.board)

			else:
				self.board[self.x][self.y] = "*"

				if(self.options[0] == 1):
					self.options.pop(0)
					self.Complete = self.moveDown().Complete

				elif(self.options[0] == 2):
					self.options.pop(0)
					self.Complete = self.moveRight().Complete

				elif(self.options[0] == 3):
					self.options.pop(0)
					self.Complete = self.moveLeft().Complete
			
				elif(self.options[0] == 4):
					self.options.pop(0)
					self.Complete = self.moveUp().Complete



	def moveDown(self):				
		# Runs recursion of next board
		self.nextBoard = Board(self.board, self.x + 1, self.y)
		return(self)
		if(self.nextBoard.Complete == True):
			return(self.nextBoard)
		else:
			return(self)

	def moveRight(self):				
		# Runs recursion of next board
		self.nextBoard = Board(self.board, self.x, self.y + 1)
		if(self.nextBoard.Complete == True):
			return(self.nextBoard)
		else:
			return(self)

	def moveLeft(self):				
		# Runs recursion of next board
		self.nextBoard = Board(self.board, self.x, self.y - 1)
		if(self.nextBoard.Complete == True):
			return(self.nextBoard)
		else:
			return(self)

	def moveUp(self):				
		# Runs recursion of next board
		self.nextBoard = Board(self.board, self.x - 1, self.y)
		if(self.nextBoard.Complete == True):
			return(self.nextBoard)
		else:
			return(self)

## Execution Code ##
Game("maze165_EasyInput.txt")