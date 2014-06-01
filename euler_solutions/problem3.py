def isprime(x):
  """ Checks a number to see if it is prime or not """
  # 1 and 0 are not primes
  if( x < 2):
    return False
  if( x == 2):
    return True
  # All evens are not prime
  if (x % 2 == 0):
    return False

  # check others, up x / 2
  else:
    for y in range(3, int(x**(0.5)+1), 2):
      ##print(y)
      if( x % y == 0):
        return False
    return True


def findPrimeFactors(num):
  """ Recursive function to get prime factors """

  # Base case. If num is true, return it
  if( isprime(num) == True):
    primeFactors.append(num)
    return(num)

  # Other wise, try to divide it with increasing i.
  else:
    i = 2
    while( (num % i) != 0):
      i = i + 1

    num = num / i
    primeFactors.append(i)
    findPrimeFactors(num)


  



## Execution Code ##
number = 600851475143
primeFactors = []
answer = findPrimeFactors(number)
print("The largest Prime Factor of ", number, " is ", max(primeFactors), ".")
print(primeFactors)