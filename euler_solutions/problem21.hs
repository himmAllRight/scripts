-- Get devisors of a num
divisors n = [x | x <- [1..n2], n `mod` x == 0]
         where n2 = n `div` 2 + 1

answer n = (sum (map (\x -> if x /= sum (divisors x) && x == sum (divisors (sum (divisors x))) then x else 0) [1..n]))