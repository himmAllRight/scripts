class Account:
	""" Bank Account Class """
	def __init__(self, accountName):
		self.name 	      = accountName
		self.balance      = 0
		self.transactions = []

	def newDeposit(self, name, amount):
		""" Adds a new deposit to account. """
		self.balance = self.balance + amount

		# Adds new Deposit to Account
		self.transactions.append(Transaction(name, "D", amount))

	def newWithdrawl(self, name, amount):
		""" Takes a new new Withdrawl from the account """
		self.balance = self.balance - amount
		self.transactions.append(Transaction(name, "W", amount*(-1)))

	def printAccountInfo(self):
		""" Prints out the account information """
		print("Account Name: ", self.name)
		print("Account Balance: $", self.balance, "\n")

		print("Transactions:", "\n---------------",)

		i = 1
		for tranaction in self.transactions:
			print(i, tranaction.type, tranaction.name, tranaction.amount, sep="\t")
			i = i + 1


class Transaction:
	""" Transaction for accounts """
	def __init__(self, tranactionName, tranactionType, tranactionAmount):
		self.name 	= tranactionName
		self.type	= tranactionType
		self.amount	= tranactionAmount

class __main__:
	""" The Main Class """
	print("Main Class")

	## Test Execution Code ##
	account = Account("Checking")
	account.newDeposit("Income", 500)
	account.newDeposit("Gift", 50)
	account.newDeposit("Income2", 613)
	account.newWithdrawl("Bills", 63)
	account.printAccountInfo()