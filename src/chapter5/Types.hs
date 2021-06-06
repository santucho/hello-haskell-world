module Types where
-- we can query types in the REPL by use of the :type or :t command.

-- 1. Functions:
-- a) not :: Bool -> Bool
-- b) length :: [a] -> Int
-- c) concat :: [[a]] -> [a]
-- d) head :: [a] -> a
-- e) (<) :: Ord a => a -> a -> Bool

-- Currying
-- As stated earlier, arguments (plural) is a shorthand for the truth in Haskell. 
-- All functions in Haskell take one argument and return one result. 

-- t: curry
-- curry :: ((a,b) -> c) -> a -> b -> c
-- Ej.: curry fst 1 2 will return 1

--t: uncurry
-- uncurry :: (a -> b -> c) -> (a, b) -> c
-- Ej.: uncurry (+) (1, 2) will return 3

-- 1. -- Type signature of general function
-- (++) :: [a] -> [a] -> [a]
-- How might that change when we apply it to the following value?
myConcat :: [Char] -> [Char]
myConcat x = x ++ " yo"
-- 2. -- General function
-- (*) :: Num a => a -> a -> a
-- Applied to a value
myMult :: Fractional a => a -> a
myMult x = (x / 3) * 5
-- 3. take :: Int -> [a] -> [a]
myTake :: Int -> [Char]
myTake x = take x "hey you"
-- 4. (>) :: Ord a => a -> a -> Bool
myCom :: Int -> Bool
myCom x = x > length [1..10]
-- 5. (<) :: Ord a => a -> a -> Bool
myAlph :: Char -> Bool
myAlph x = x < 'z'


-- Write a type signature
-- For the following expressions, please add a type signature.
-- You shouldbe able to rely on GHCi type inference to check your work, 
-- althoughyou might not have precisely the same answer as GHCi gives (due to polymorphism, etc).
-- 1.
functionH :: [x] -> x
functionH (x:_) = x
-- 2.
functionC :: Ord a => a -> a -> Bool
functionC x y = if (x > y) then True else False
-- 3. 
functionS :: (t1, t2) -> t2
functionS (x, y) = y

-- Given a type, write the function: 
-- You will be shown a type and a function that needs to be written. Use the information the type provides to determine
-- what the function should do. We’ll also tell you how many ways there are to write the function. 
-- (Syntactically different but semantically equivalent implementations are not counted as being different).
-- 1. There is only one implementation that typechecks.
i :: a -> a
i = id
-- 2. There is only one version that works.
c :: a -> b -> a
c = curry fst
-- 3. Given alpha equivalence are c” and c (see above) the same thing?
c'' :: b -> a -> b
c'' = c
-- 4. Only one version that works.
c' :: a -> b -> b
c' = curry snd
-- 5. There are multiple possibilities, at least two of which you’ve seen in previous chapters.
r :: [a] -> [a]
r = init
-- r = last
-- 6. Only one version that will typecheck.
-- (g.f)(x) --> g(f(x))
co :: (b -> c) -> (a -> b) -> (a -> c)
co = (.)
-- 7. One version will typecheck.
a :: (a -> c) -> a -> a
a = undefined
-- 8. One version will typecheck.
a' :: (a -> b) -> a -> b
a' = ($)

