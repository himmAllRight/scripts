-- Rock Paper Scissors game in haskell. Will use for more advanced stuff later.
import Data.Time
import System.Random
data RPS = Rock | Paper | Scissors deriving (Eq, Show, Read)
type Score = (Int, Int)

beats :: RPS -> RPS -> Bool
beats Rock Scissors = True
beats Paper Rock    = True
beats Scissors Paper = True
beats _ _ = False

play :: RPS -> RPS -> Score -> Score
play a b (sa, sb)
    | a `beats` b = (sa+1, sb)
    | b `beats` a = (sa, sb+1)
    | otherwise   = (sa, sb)

multiPlay :: [RPS] -> [RPS] -> Score -> Score
multiPlay [] b (sa,sb) = (sa,sb)
multiPlay a [] (sa,sb) = (sa, sb)
multiPlay (a:ax) (b:bx) (sa,sb) = multiPlay ax bx (play a b (sa,sb))

num2RPS :: Int -> RPS
num2RPS x = rpsReturn
    where
    rpsReturn
      | x == 0    = Rock
      | x == 1    = Paper
      | otherwise = Scissors

numList2RPS :: [Int] -> [RPS]
numList2RPS n = map num2RPS n

