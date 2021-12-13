module ListExercises where

--Writing your own standard functions

-- direct recursion, using (&&)
myAnd :: [Bool] -> Bool
myAnd [] = True
myAnd (x:xs) = x && myAnd xs

--And now the fun begins:

--1. myOr returns True if any Bool in the list is True.
myOr :: [Bool] -> Bool
myOr [] = False 
myOr (x:xs) = x || myOr xs

--2. myAny returns True if a -> Bool applied to any of the values in the list returns True.
myAny :: (a -> Bool) -> [a] -> Bool
myAny _ [] = False
myAny f (x:xs) = f x || myAny f xs
--Example for validating myAny:
--Prelude> myAny even [1, 3, 5]
--False
--Prelude> myAny odd [1, 3, 5]
--True

--3. After you write the recursive myElem, write another version that uses any.
-- the built-in version of 'elem' in GHC 7.10
-- and newer has a type that uses Foldable
-- instead of the list type specifically. You
-- can ignore that and write the concrete
-- version that works only for list.
myElem :: Eq a => a -> [a] -> Bool
myElem _ [] = False
myElem a (x:xs) = a == x || myElem a xs

myElem2 :: Eq a => a -> [a] -> Bool
myElem2 _ [] = False
myElem2 a xs = myAny (==a) xs
--Prelude> myElem 1 [1..10]
--True
--Prelude> myElem 1 [2..10]
--False

--4. Implement myReverse.
myReverse :: [a] -> [a]
myReverse [] = []
myReverse (x:xs) = myReverse xs ++ [x]
--Prelude> myReverse "blah"
--"halb"
--Prelude> myReverse [1..5]
--[5,4,3,2,1]

--5. squish flattens a list of lists into a list
squish :: [[a]] -> [a]
squish [] = []
squish (l:ls) = l ++ squish ls

--6. squishMap maps a function over a list and concatenates the results.
squishMap :: (a -> [b]) -> [a] -> [b]
squishMap _ [] = []
squishMap fab (a:as) = fab a ++ squishMap fab as
--Prelude> squishMap (\x -> [1, x, 3]) [2]
--[1,2,3]
--Prelude> squishMap (\x -> "WO "++[x]++" HOO ") "123"
--"WO 1 HOO WO 2 HOO WO 3 HOO "

--7. squishAgain flattens a list of lists into a list. This time re-use the squishMap function.
squishAgain :: [[a]] -> [a]
squishAgain [] = []
squishAgain (x:xs) = x ++ squishMap (\x -> x) xs

--8. myMaximumBy takes a comparison function and a list and returns the greatest element
--of the list based on the last value that the comparison returned GT for.

-- If you import maximumBy from Data.List,
-- you'll see the type is
-- Foldable t => (a -> a -> Ordering) -> t a -> a
-- rather than
-- (a -> a -> Ordering) -> [a] -> a
-- if you have GHC 7.10 or newer. Seeing a pattern?

myMaximumBy :: (a -> a -> Ordering) -> [a] -> a
myMaximumBy _ [] = error "myMaximumBy: empty list"
myMaximumBy _ (x:[])= x
myMaximumBy f (x1:x2:xs) = if f x1 x2 == GT then myMaximumBy f (x1:xs) else myMaximumBy f (x2:xs)
--Prelude> myMaximumBy (\_ _ -> GT) [1..10]
--1
--Prelude> myMaximumBy (\_ _ -> LT) [1..10]
--10
--Prelude> myMaximumBy compare [1..10]
--10

--9. myMinimumBy takes a comparison function and a list and returns the least element
--of the list based on the last value that the comparison returned LT for.
myMinimumBy :: (a -> a -> Ordering) -> [a] -> a
myMinimumBy _ [] = error "myMinimumBy: empty list"
myMinimumBy _ (x:[])= x
myMinimumBy f (x1:x2:xs) = if f x1 x2 == LT then myMinimumBy f (x1:xs) else myMinimumBy f (x2:xs)
--Prelude> myMinimumBy (\_ _ -> GT) [1..10]
--10
--Prelude> myMinimumBy (\_ _ -> LT) [1..10]
--1
--Prelude> myMinimumBy compare [1..10]
--1

--Using the myMinimumBy and myMaximumBy functions, write your
--own versions of maximum and minimum. If you have GHC 7.10
--or newer, you’ll see a type constructor that wants a Foldable
--instance instead of a list as has been the case for many functions so far.
myMaximum :: (Ord a) => [a] -> a
myMaximum ls = myMaximumBy compare ls
myMinimum :: (Ord a) => [a] -> a
myMinimum ls = myMinimumBy compare ls