-- Sets an infinite fib sequence
fib = 0 : 1 : zipWith (+) fib (tail fib)

-- Checks a number to see if it has 3 didgets or more
kDidgets :: Integer -> Bool
kDidgets n = (quot n (10 ^ 999)) >= 1
  
-- Runs through fib list until number with 1000 didgets is found, then returned
prob25 :: [Integer] -> Int
prob25 l = if (kDidgets (last l)) then (length l) else prob25 (l ++ [((last l) + (last (init l)))])

-- Executes answer
answer = prob25 [1,1]
