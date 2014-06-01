def isPalendrome(number):
	""" Reads an input and determines if it is a pallendrome """
	
	num = str(number)
	i 	= 0
	j 	= len(num) - 1
	mid = len(num) // 2

	#print(mid)
	
	# While i and j are not in the middle
	while( i != mid):
		#print(i,j,sep="\t")
		#print(num[i],num[j], sep="\t")
		if(num[i] != num[j]):
			return(False)
		else:
			i = i + 1
			j = j - 1

	return(True)

def numberCombos():
	min  = 100
	max  = 999

	for num1 in range(min, max+1):


		for num2 in range(min, max+1):
			product = num1 * num2
			if(isPalendrome(product)):
				pallendromes.append(product)



## Execution Code ##
pallendromes = []
print(isPalendrome(""))
numberCombos()
print(pallendromes)
print(max(pallendromes))