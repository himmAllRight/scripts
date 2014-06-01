
def loop(num):
	""" Loops through checks """
	while(True):
		i = 0
		check = checks[i]
		while( num % check == 0):
			i = i + 1

			if(i == len(checks)):
				return(num)
			else:
				check = checks[i]

		num = num + 1


# Execution Code

# Values to check
checks = [20,19,18,17,16,15,14,13,12,11]
#checks = [1,2,3,4,5,6,7,8,9,10]

# Starting Number
number = 2520



print(loop(number))