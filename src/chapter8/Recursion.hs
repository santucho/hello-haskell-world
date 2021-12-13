module Recursion where
  
{-Recursion is defining a function in terms of itself via self-referential
expressions. It means that the function will continue to call itself
and repeat its behavior until some condition is met to return a result.
It’s an important concept in Haskell and in mathematics because it
gives us a means of expressing indefinite or incremental computation
without forcing us to explicitly repeat ourselves and allowing the data
we are processing to decide when we are done computing.-}

fourFactorial :: Integer
fourFactorial = 4 * 3 * 2 * 1

-- This won't work. It never stops.
brokenFact1 :: Integer -> Integer
brokenFact1 n = n * brokenFact1 (n - 1)

factorial :: Integer -> Integer
factorial 0 = 1
factorial 1 = 1
factorial n = n * factorial (n - 1)

applyTimes :: (Eq a, Num a) => a -> (b -> b) -> b -> b
applyTimes 0 f b = b
applyTimes n f b = f (applyTimes (n-1) f b)

applyTimes' :: (Eq a, Num a) =>a -> (b -> b) -> b -> b
applyTimes' 0 f b = b
applyTimes' n f b = f . applyTimes (n-1) f $ b

--Intermission: Exercise
--Write out the evaluation of the following. 
--It might be a little less noisy if you do so with the form that didn’t use (.).
--applyTimes 5 (+1) 5 = (+1) (applyTimes (4) (+1) 5)
--                    = (+1) ((+1) (applyTimes (3) (+1) 5))
--                    = (+1) ((+1) ((+1) (applyTimes (2) (+1) 5)))
--                    = (+1) ((+1) ((+1) ((+1) (applyTimes (1) (+1) 5))))
--                    = (+1) ((+1) ((+1) ((+1) ((+1) (applyTimes (0) (+1) 5)))))
--                    = (+1) ((+1) ((+1) ((+1) ((+1) 5))))
--                    = (+1) ((+1) ((+1) ((+1) 6)))
--                    = (+1) ((+1) ((+1) 7))
--                    = (+1) ((+1) 8)
--                    = (+1) 9
--                    = 10

fibonacci :: Integral a => a -> a
fibonacci 0 = 0
fibonacci 1 = 1
fibonacci x = fibonacci (x - 1) + fibonacci (x - 2)