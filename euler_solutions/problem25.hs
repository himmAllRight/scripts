-- Sets an infinite fib sequence
fib = 0 : 1 : zipWith (+) fib (tail fib)
  
-- Runs through fib list until number with 1000 didgets is found, then returned
prob25 :: [Integer] -> Int
prob25 l = if (quot (last l) (10 ^ 999)) >= 1
           then (length l) 
           else prob25 (l ++ [((last l) + (last (init l)))])

-- Executes answer
answer = prob25 [1,1]
