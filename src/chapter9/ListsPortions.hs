module ListsPortions where

--The take function takes the specified number of elements out of a
--list and returns a list containing just those elements. As you can see it
--takes one argument that is an Int and applies that to a list argument.
--take :: Int -> [a] -> [a]

--The drop function is similar to take but drops the specified number
--of elements off the beginning of the list. Again, we can use it with
--ranges or list-building functions:
--drop :: Int -> [a] -> [a]

--The splitAt function takes an Int argument, applies it to a list, cuts
--the list into two parts at the element specified by the Int and makes a
--tuple of two lists:
--splitAt :: Int -> [a] -> ([a], [a])

--The higher-order functions takeWhile and dropWhile are a bit different, as you can see from the type signatures:
--So these take and drop items out of a list that meet some condition, as we can see from the presence of Bool.
--takeWhile :: (a -> Bool) -> [a] -> [a]
--dropWhile :: (a -> Bool) -> [a] -> [a]

--1. Using takeWhile and dropWhile, write a function that takes a
--string and returns a list of strings, using spaces to separate the
--elements of the string into words, as in the following sample:
--Main> myWords "all i wanna do is have some fun"
--["all","i","wanna","do","is","have","some","fun"]

myWords :: String -> [String]
myWords "" = []
myWords " " = []
myWords s = (:[]) (takeWhile (/= ' ') s) ++ myWords (tailOrEmpty $ dropWhile (/= ' ') s)
  where tailOrEmpty [] = []
        tailOrEmpty (_:xs) = xs
        
--3. Now let’s look at what those two functions have in common.
--Try writing a new function that parameterizes the character
--you’re breaking the string argument on and rewrite myWords andmyLines using it.

split :: String -> Char -> [String]
split "" _ = []
split (x:[]) c = if x == c then (:[]) $ (:[]) x else []
split s c = (:[]) (takeWhile (/= c) s) ++ split (tailOrEmpty $ dropWhile (/= c) s) c
  where tailOrEmpty [] = []
        tailOrEmpty (_:xs) = xs