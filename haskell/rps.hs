-- Rock Paper Scissors game in haskell. Will use for more advanced stuff later.

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
