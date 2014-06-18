import time
import os

class Categories:
	""" A payment category """
	def __init__(self):
		self.list = []

	def addCategory(self, categoryName):
		## Adds new Category if it  does not exist
		if(self.list.count(categoryName) == 0):
			self.list.append(categoryName)
		else:
			print("Category ", categoryName, " already exists!", sep="")

	def containsCategory(self, searchName):
		""" Returns the index of a searched category, otherwise returns -1 """
		if(self.list.count(searchName) > 0):
			return(self.list.index(searchName))
		else:
			return(-1)

	def removeCategory(self, deleteName):
		if(self.list.count(deleteName) > 0):
			self.list.remove(deleteName)

	def printCategories(self):
		print("Categories:")
		id = 0
		for cat in self.list:
			print(id, ":", cat, "  ", end="")
			id = id + 1
		print("\n")

class Account:
	""" Bank Account Class """
	def __init__(self, accountName, catList):
		self.name 	      = accountName
		self.balance      = 0
		self.transactions = []
		self.categories   = catList

	def newDeposit(self, name, catInd, amount):
		""" Adds a new deposit to account. """
		self.balance = self.balance + amount

		# Adds new Deposit to Account
		self.transactions.append(Transaction(name, " DEP ", self.categories.list[catInd] ," _ ", amount, 
								 self.balance))

	def newWithdrawl(self, name, catInd, num, amount):
		""" Takes a new new Withdrawl from the account """
		self.balance = self.balance - amount
		self.transactions.append(Transaction(name, num, self.categories.list[catInd], " _ ", amount*(-1), 
								 self.balance))

	def printAccountInfo(self):
		""" Prints out the account information """
		print("Account Name: ", self.name)
		print("Account Balance: $", self.balance, "\n")

		print("Transactions:", "\n---------------",)

		print("Date", "Num", "Payee", "Category", "Cleared", "Amount", 
			  "Balance", sep="\t\t")
		
		for transaction in self.transactions:
			print(transaction.date, "\t\t", transaction.num, "\t\t", 
				  transaction.name, "\t\t", transaction.category ,"\t\t",
				  transaction.cleared, "\t\t", "$", transaction.amount,"\t\t",
				  "$", transaction.balance, 
				sep="")


class Transaction:
	""" Transaction for accounts """
	def __init__(self, transactionName, transactionNum, transactionCatigory,
				 transactionCleared, transactionAmount, newBalance):

		self.name 	  = transactionName
		self.date     = time.strftime("%d/%m/%Y")
		self.num	  = transactionNum
		self.category = transactionCatigory
		self.cleared  = transactionCleared
		self.amount	  = transactionAmount
		self.balance  = newBalance


class CLI:
	""" The command line User Run environment """

	def __init__(self):
		print("Hello! Welcome to ryMoney. \n")
		self.command = ""

		# Main Run Loop
		while(self.command != "q"):
			self.printOptions()
			self.command = input("input: ")

			# Test Creen Clearing
			if(self.command == "c"):
				os.system("clear")


		# Ask to save on logout.
		askSave = input("Would you like to save before quitting? (y/n): ")
		if(askSave == "y"):
			print("Saving file...")
			# Save command
			print("File Saved!")

		os.system("clear")
		print("Have a good day! Good-bye.")

	def printOptions(self):
		print("Please select what you would like to do:")
		print("c - Create New")
		print("l - Load Saved Account")

		print("\nh - help")

class __main__:
	""" The Main Class """
	print("Main Class")

	main = CLI()

	## Test Execution Code ##
	#deer = Categories()
	#deer.addCategory("Rent")
	#deer.addCategory("Pay")
	#deer.addCategory("Bills")
	#deer.addCategory("Other")


	#account = Account("Checking", deer)
	#deer.printCategories()

	#account.newDeposit("Income", 1, 500)
	#account.newDeposit("Gift", 3, 50)
	#account.newDeposit("Income2", 2, 613)
	#account.newWithdrawl("Bills", 2, "02132", 63)
	#account.printAccountInfo()
