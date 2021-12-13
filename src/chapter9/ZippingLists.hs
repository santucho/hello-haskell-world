module ZippingLists where

--Zipping lists together is a means of combining values from multiple
--lists into a single list. Related functions like zipWith allow you to use
--combining function to produce a list of results from two lists.
--
--First let’s look at zip:
--Prelude> :t zip
--zip :: [a] -> [b] -> [(a, b)]
--
--Prelude> zip [1, 2, 3] [4, 5, 6]
--[(1,4),(2,5),(3,6)]

--One thing to note is that zip stops as soon as one of the lists runs out of values!

--We can use unzip to recover the lists as they were before they werezipped:
--Prelude> zip [1, 2, 3] [4, 5, 6]
--[(1,4),(2,5),(3,6)]
--
--Prelude> unzip $ zip [1, 2, 3] [4, 5, 6]
--([1,2,3],[4,5,6])

--We can also use zipWith to apply a function to the values of two lists in parallel:
--zipWith :: (a -> b -> c) -> [a] -> [b] -> [c]

--Zipping exercises
--1. Write your own version of zip :: [a] -> [b] -> [(a, b)] and ensure it behaves the same as the original.
myZip :: [a] -> [b] -> [(a,b)]
myZip [] _ = []
myZip _ [] = []
myZip (a:as) (b:bs) = (a,b) : myZip as bs
--2. Do what you did for zip, but now for zipWith :: (a -> b -> c) -> [a] -> [b] -> [c]
myZipWith :: (a -> b -> c) -> [a] -> [b] -> [c]
myZipWith _ [] _ = []
myZipWith _ _ [] = []
myZipWith f (a:as) (b:bs) = f a b : myZipWith f as bs
--3. Rewrite your zip in terms of the zipWith you wrote.
myZip2 :: [a] -> [b] -> [(a,b)]
myZip2 [] _ = []
myZip2 _ [] = []
myZip2 (a:as) (b:bs) = (a,b) : myZipWith (\x y -> (x,y)) as bs