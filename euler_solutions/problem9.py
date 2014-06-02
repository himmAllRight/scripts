def loop(startA,max):
	a = startA - 1
	b = 2
	c = max - (a+b)

	while( (a+1) < b):
		b = a + 1
		c = max - (a+b)
		while( (b+1) < c):
			#print(a,b,c,sep="\t")
			if((a**2 + b**2 == c**2) and (a+b+c)== 1000):
				return(a,b,c)
			else:
				b = b + 1
				c = max - (a+b)

		#print(a,b,c,sep="\t")
		a = a + 1
		#print(a,b,c,sep="\t")
	
	


## Execution Code ##
maxSum = 1000
startA = 1
fA, fB, fC = loop(startA,maxSum)
print(loop(startA,maxSum))
print(fA*fB*fC)

#A,B,C = loop(maxSum)