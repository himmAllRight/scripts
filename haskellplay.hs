-- A Function that returns the factorial of a number n
factorial 0 = 1
factorial n = n * factorial (n - 1)

-- A function that returns a list l, of the didgets of a number, n.
didgetL :: Int -> [Int] -> [Int]
didgetL n l
  | quot n 10 <= 0	= reverse(l ++ [n])
  | otherwise	 	= didgetL (quot n 10) (l ++ [n `mod` 10])
  
-- A function that returns the summed factorials of a Int list
sumFactList :: [Int] -> Int
sumFactList l = sum (map factorial l)

-- A function that returns the sum-factorial chain of a number
returnChain :: [Int] -> [Int]
returnChain l = if head l `elem` tail l then l else returnChain ([sumFactList (didgetL (head l) [] )] ++ l)

-- Checks if a number is a certain number
isNum :: Int -> Int
isNum 60 = 1
isNum  n = 0


