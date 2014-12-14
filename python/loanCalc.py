
# size the size of the data list, and n is the number of items to be divided amung them.
def allParamsSets(size, n):

	solutions = []

	for i in range(0, size - 1):
		l    = [0] * size
		l[i] = n
		solutions.append(l[:])

		j = size - 2
		while l[-1] != n:
			if(l[j] > 0):
				l[j]   = l[j] - 1
				l[j+1] = l[j+1] +1
				solutions.append(l[:])
				j = size - 2

			else:
				j = j - 1

	return(solutions)


f = allParamsSets(3, 10)
for i in f:
	print(i)

print(len(f))