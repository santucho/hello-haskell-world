module MoreFunctionalPatterns where

{-
• Haskell functions are first-class entities that
• can be values in expressions, lists, or tuples;
• can be passed as arguments to a function;
• can be returned from a function as a result;
• make use of syntactic patterns.
-}

--a) Rewrite the f function in the where clause.
addOneIfOdd :: Integral p => p -> p
addOneIfOdd n = case odd n of
  True -> f n
  False -> n
  where f n = n + 1
  
addOneIfOdd' :: Integral p => p -> p
addOneIfOdd' n = case odd n of
  True -> f n
  False -> n
  where f = \x -> x + 1
  
--b) Rewrite the the following to use anonymous lambda syntax:
addFive :: (Num a, Ord a) => a -> a -> a
addFive x y = (if x > y then y else x) + 5
addFive' = \x -> \y -> (if x > y then y else x) + 5

--c) Rewrite the following so that it doesn’t use anonymouslambda syntax:
mflip :: (t1 -> t2 -> t3) -> t2 -> t1 -> t3
mflip f = \x -> \y -> f y x
mflip' f x y = f y x