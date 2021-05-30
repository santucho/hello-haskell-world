module BasicDataTypes where
    
import Data.Char ( isSpace )

awesome :: [[Char]]
awesome = ["Papuchon", "curry", ":)"]
alsoAwesome :: [[Char]]
alsoAwesome = ["Quake", "The Simons"]
allAwesome :: [[[Char]]]
allAwesome = [awesome, alsoAwesome]

-- 2. What are the results of the following expressions?
-- a) length [1, 2, 3, 4, 5] -> 5
-- b) length [(1, 2), (2, 3), (3, 4)] -> 3
-- c) length allAwesome -> 2
-- d) length (concat allAwesome) -> 5

a :: Int
a = length [1, 2, 3, 4, 5]
b :: Int
b = length [(1, 2), (2, 3), (3, 4)]
c :: Int
c = length allAwesome
d :: Int
d = length (concat allAwesome)

-- 8. Write a function that tells you whether or not a given String (orlist) is a palindrome. 
-- Here you’ll want to use a function called ’reverse,’ a predefined function that does just what it sounds like.
-- reverse :: [a] -> [a]
-- reverse "blah"
-- "halb"
isPalindrome :: (Eq a) => [a] -> Bool
isPalindrome a = a == reverse a

-- 9. Write a function to return the absolute value of a number using if-then-else
myAbs :: Integer -> Integer
myAbs x = if x < 0 then (-x) else x

-- 10. Fill in the definition of the following function, using fst and snd:
f :: (a, b) -> (c, d) -> ((b, d), (a, c))
f t1 t2 = ((snd t1, snd t2), (fst t1, fst t2))