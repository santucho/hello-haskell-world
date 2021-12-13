module ListComprehension where

--List comprehensions are a means of generating a new list from a list or lists.
--[ x^2   |   x <- [1..10]]
--  [1]  [2]    [   3   ]
--1. This is the output function that will apply to the members of the list we indicate.
--2. The pipe here designates the separation between the out put function and the input.
--3. This is the input set: a list and a variable that represents the elements that will be drawn from that list.
--This says, “from a list of numbers from 1-10, take (<-) each element as an input to the output function.”

--Prelude> [x^2 | x <- [1..10], rem x 2 == 0]
--[4,16,36,64,100]

--Prelude> [x^y | x <- [1..5], y <- [2, 3]]
--[1,1,4,8,9,27,16,64,25,125]

--let mySqr = [x^2 | x <- [1..5]]

--Intermission: Exercises

--Take a look at the following functions, figure what you think the output lists will be,
--and then run them in your REPL to verify (note that you will need the mySqr list from above in scope to do this):
-- Prelude> mySqr
-- [1,4,9,16,25]

--[x | x <- mySqr, rem x 2 == 0]
-- [4,16]

--[(x, y) | x <- mySqr, y <- mySqr, x < 50, y > 50]
-- []

--take 5 [ (x, y) | x <- mySqr, y <- mySqr, x < 50, y > 50 ]
-- []

--List comprehensions with Strings
--It’s worth remembering that strings are lists, so list comprehensions can also be used with strings.

--Prelude> :t elem
--elem :: Eq a => a -> [a] -> Bool
--Prelude> elem 'a' "abracadabra"
--True

--Prelude> [x | x <- "Three Letter Acronym", elem x ['A'..'Z']]
--"TLA"

--Prelude> let mySqr = [x^2 | x <- [1..5]]
--Prelude> let myCube = [y^3 | y <- [1..5]]
--1. First write an expression that will make tuples of the outputs of mySqr and myCube.
-- [(x,y) | x <- mySqr, y <- myCube]
--2. Now alter that function so that it only uses the x and y values that are less than 50.
-- [(x,y) | x <- mySqr, y <- myCube, x < 50, y < 50]
--3. Now apply another function to that list comprehension to determine how many tuples inhabit your output list.
-- length [(x,y) | x <- mySqr, y <- myCube, x < 50, y < 50]