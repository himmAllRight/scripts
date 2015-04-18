-- Get devisors of a num
devisors n = [x | x <- [1..n2], n `mod` x == 0]
	 where n2 = n `div` 2 + 1

-- Add up all pairs of numbers in a list
addNums [] = []
addNums (x:xs) = (map (+ x) (x:xs)) ++ addNums xs

-- Find the abundant sums
aNums = [ x | x <- [10..28123], sum (devisors x) > x]

-- Add up all the abundant numbers
sumAnums = addNums aNums

-- Sum up the numbers that cannot be written as the sum of two abundant numbers
answer = sum (map (\x -> if x `elem` sumAnums then 0 else x) [1..28123])

main = print answer
