def problem15(n,l):
	x = l[0]
	if(n <= 1):
		return(l[0])
	else:
		i = len(l)
		
		return(problem15(n - 1, ([int((2*x)*(1 +(i/ (i+ 1))))] + l)))

print(problem15(20, [2]))