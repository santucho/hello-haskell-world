module TransformingLists where

import Data.Bool (bool)

--For example, one common thing you would want to do is return a
--list with a function applied uniformly to all values within the list. To
--do so, you need a function that is inherently recursive and can apply
--that function to each member of the list. For this purpose we can
--use either the map or fmap functions. map can only be used with [].
--fmap is defined in a typeclass named Functor and can be applied to
--data other than lists.

--The types of map and fmap respectively are:
--map :: (a -> b) -> [a] -> [b]
--fmap :: Functor f => (a -> b) -> f a -> f b

--Prelude> map (+1) [1, 2, 3, 4]
--[2,3,4,5]
--Prelude> map (1-) [1, 2, 3, 4]
--[0,-1,-2,-3]
--Prelude> fmap (+1) [1, 2, 3, 4]
--[2,3,4,5]

--Intermission: Exercises
--As always, we encourage you to try figuring out the answers before
--you enter them into your REPL.

--1. Will the following expression return a value or be ⊥?
--take 1 $ map (+1) [undefined, 2, 3]
--Prelude> Error

--2. Will the following expression return a value?
--take 1 $ map (+1) [1, undefined, 3]
--Prelude> 2

--3. take 2 $ map (+1) [1, undefined, 3]
--Prelude> Error

--4. What does the following mystery function do? What is its type?
--Describe it (to yourself or a loved one) in standard English and
--then test it out in the REPL to make sure you were correct.
--itIsMystery xs = map (\x -> elem x "aeiou") xs
--Transform a String into a List[Bool], with True values for vowels and False values for consonants

--5. What will be the result of the following functions:
--a) map (^2) [1..10]
--Prelude> [1,4,9,16,25,36,49,64,81,100]
--b) map minimum [[1..10], [10..20], [20..30]]
---- n.b. `minimum` is not the same function
---- as the `min` that we used before
--Prelude> [1,10,20]
--c) map sum [[1..5], [1..5], [1..5]]
--Prelude> [6,6,6]

--6. Back in the Functions chapter, you wrote a function called fold-
--Bool. That function exists in a module known as Data.Bool and
--is called bool. Write a function that does the same (or similar, if
--you wish) as the map (if-then-else) function you saw above
--but uses bool instead of the if-then-else syntax. Your first
--step should be bringing the bool function into scope by typing
--import Data.Bool at your Prelude prompt.

f xs = map (\x -> bool x (-x) (x==3)) xs