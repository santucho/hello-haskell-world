module HighOrderFunctions where

{-Higher-order functions
Higher-order functions (HOFs) are functions that accept functions as
arguments. Functions are just values — why couldn’t they be passed
around like any other values? This is an important component of
functional programming and gives us a way to combine functions
efficiently.-}

--Given the following definitions tell us what value results from further
--applications. When you’ve written down at least some of the answers
--and think you know what’s what, type the definitions into a file and
--load them in GHCi to test your answers.
-- Types not provided, try filling them in yourself.

dodgy :: (Num a) => a -> a -> a
dodgy x y = x + y * 10
oneIsOne :: (Num a) => a -> a
oneIsOne = dodgy 1
oneIsTwo :: (Num a) => a -> a
oneIsTwo = (flip dodgy) 2

--1. For example
--Prelude> dodgy 1 0
--1
--2. dodgy 1 1
--11
--3. dodgy 2 2
--22
--4. dodgy 1 2
--21
--5. dodgy 2 1
--12
--6. oneIsOne 1
--11
--7. oneIsOne 2
--21
--8. oneIsTwo 1
--21
--9. oneIsTwo 2
--22
--10. oneIsOne 3
--31
--11. oneIsTwo 3
--23