def isprime(x):
  """ Checks a number to see if it is prime or not 
    * Borrowed from problem 3 solution * """
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


def buildPrimesList(top):
  for x in range(1,top+1):
    if(isprime(x)):
      primesList.append(x)
  


## execution code ##
top        = 2000000
primesList = []

buildPrimesList(top)

print(sum(primesList))