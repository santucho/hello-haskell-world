module ListsRanges where
  
{-Write your own enumFromTo definitions for the types provided. Do
not use range syntax to do so. It should return the same results as if
you did [start..stop].-}

eftBool :: Bool -> Bool -> [Bool]
eftBool False True = [False, True]
eftBool _ _        = []

eftOrd :: Ordering -> Ordering -> [Ordering]
eftOrd LT EQ = [LT, EQ]
eftOrd LT GT = [LT, EQ, GT]
eftOrd EQ GT = [EQ, GT]
eftOrd _ _   = []

eftInt :: Int -> Int -> [Int]
eftInt i1 i2 
  | i1 <= i2 = [i1] ++ eftInt (succ i1) i2
  | otherwise = []

eftChar :: Char -> Char -> [Char]
eftChar c1 c2 
  | c1 <= c2 = [c1] ++ eftChar (succ c1) c2
  | otherwise = []

-- eftInt and eftChar could be generalized in eftOrd
