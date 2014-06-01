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

def loop():
  """ Loop through values adding primes to prime list """
  num = 1
  while(len(primes) < didget ):
    if(isprime(num) == True):
      primes.append(num)
      
    num = num + 1


## Execution Code ##
didget = 10001
primes = []

# loop function
loop()

# Print Answer
print(primes[didget - 1])