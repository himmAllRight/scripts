-- The Evalutating e^x HackerRank Challenge, in Haskell

solve :: Double -> Double
solve x = sum (calcTerms x 10)

main :: IO ()
main = getContents >>= mapM_ print. map solve. map (read::String->Double). tail. words

-- Simple Factorial code for the denominator part
factorial :: Int -> Int
factorial 0 = 1
factorial n = n * (factorial (n - 1))

-- Calculates the next term of the serries
nextTerm :: Double -> Int -> Double
nextTerm _ 0 = 1
nextTerm x i = (x^i) / (fromIntegral (factorial i))

-- Calculage a range of terms in the serries
calcTerms :: Double -> Int -> [Double]
calcTerms x i = map (nextTerm x) [0..(i -1)]


