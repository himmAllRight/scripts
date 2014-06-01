def isPalendrome(number):
	""" Reads an input and determines if it is a pallendrome """
	
	num = str(number)
	i 	= 0
	j 	= len(num) - 1
	mid = len(num) // 2

	print(mid)
	
	# While i and j are not in the middle
	while( i != mid and j != mid):
		print(i,j,sep="\t")
		print(num[i],num[j], sep="\t")
		if(num[i] != num[j]):
			return(False)
		else:
			i = i + 1
			j = j - 1

	return(True)



## Execution Code ##
print(isPalendrome(1991))