-- A Function that returns the factorial of a number n
factorial 0 = 1
factorial n = n * factorial (n - 1)

-- A function that returns a list l, of the didgets of a number, n.
didgetL :: Int -> [Int] -> [Int]
didgetL n l
  | quot n 10 <= 0	= reverse(l ++ [n])
  | otherwise	 	= didgetL (quot n 10) (l ++ [n `mod` 10])