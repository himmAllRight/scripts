-- Rock Paper Scissors game functions
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

-- Needs to be updated to fit new format
multiPlay :: [RPS] -> [RPS] -> Score -> Score
multiPlay [] b (sa,sb) = (sa,sb)
multiPlay a [] (sa,sb) = (sa, sb)
multiPlay (a:ax) (b:bx) (sa,sb) = multiPlay ax bx (play a b (sa,sb))

-- Helper Functions
num2RPS :: Int -> RPS
num2RPS x = rpsReturn
    where
    rpsReturn
      | x == 0    = Rock
      | x == 1    = Paper
      | otherwise = Scissors

numList2RPS :: [Int] -> [RPS]
numList2RPS n = map num2RPS n


-- Strategy Functions
buildMoveList :: Int -> ([RPS] -> [RPS] -> [RPS]) -> [RPS] -> ([RPS] -> [RPS] -> [RPS]) -> [RPS] -> [(RPS, RPS)]
buildMoveList  n fa a fb b = if n == 0 then zip a b else buildMoveList (n - 1) fa (fa a b) fb (fb b a)

-- Needs to be updated to fit new format
altThree :: Int -> Int -> [RPS]
altThree n s = (map (\x -> num2RPS (mod (x + s) 3)) [1..n])

oppLast :: [RPS] -> [RPS] -> [RPS]
oppLast _ []     = [Rock]
oppLast x (y:ys) = y : x


