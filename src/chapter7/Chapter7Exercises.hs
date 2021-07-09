module Chapter7Exercises where

--Let’s write code

--1. The following function returns the tens digit of an integral argument.
tensDigit :: Integral a => a -> a
tensDigit x = d
  where xLast = x `div` 10
        d = xLast `mod` 10
--a) First, rewrite it using divMod.
tensDigit' :: Integral b => b -> b
tensDigit' x = fst . divMod10 $ x
  where divMod10 = flip divMod 10
--b) Does the divMod version have the same type as the original version? Yes
--c) Next, let’s change it so that we’re getting the hundreds digit instead.
--You could start it like this (though that may not be the only possibility):
hunsD :: Integral a => a -> a
hunsD x = d2
  where d = x `div` 100
        d2 = d `mod` 100
  
--2. Implement the function of the type a -> a -> Bool -> a once each using a case expression and once with a guard.
foldBool :: a -> a -> Bool -> a
foldBool a1 a2 b
  | b         = a1
  | otherwise = a2
--The result is semantically similar to if-then-else expressions but syntactically quite different. 
--Here is the pattern matching version to get you started:
foldBool3 :: a -> a -> Bool -> a
foldBool3 x y True = x
foldBool3 x y False = y
--3. Fill in the definition. Note that the first argument to our function is also a function which can be applied to values. 
--Your second argument is a tuple, which can be used for pattern matching:
g :: (a -> b) -> (a, c) -> (b, c)
g fab (a, c) = (fab a, c) 


