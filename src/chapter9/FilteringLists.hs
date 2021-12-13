module FilteringLists where

import Data.String (words)  

--
--We used a function called filter that takes a list as input and returns
--a new list consisting solely of the values in the input list that meet a
--certain condition, as in this example which finds the even numbers of
--a list and returns a new list of just those values:
--
--Prelude> filter even [1..10]
--[2,4,6,8,10]
--
--Let’s now take a closer look at filter. filter has the following definition:
--filter :: (a -> Bool) -> [a] -> [a]
--filter _ [] = []
--filter pred (x:xs)
--  | pred x = x : filter pred xs
--  | otherwise = filter pred xs

--Prelude> filter (\x -> elem x "aeiou") "abracadabra"
--"aaaaa"
--Prelude> [x | x <- "abracadabra", elem x "aeiou"]
--"aaaaa"

--Intermission: Exercises
--1. Given the above, how might we write a filter function that would
--give us all the multiples of 3 out of a list from 1-30?
multiplesOf3 = filter (\x -> mod x 3 == 0) [1..30]
--2. Recalling what we learned about function composition, how
--could we compose the above function with the length function
--to tell us *how many* multiples of 3 there are between 1 and 30?
howManyMultiplesOf3 = length $ multiplesOf3
--3. Next we’re going to work on removing all articles (’the’, ’a’, and ’an’) from sentences. 
--You want to get to something that workslike this:
--
--Prelude> myFilter "the brown dog was a goof"
--["brown","dog","was","goof"]
--
--You may recall that earlier in this chapter we asked you to write a
--function that separates a string into a list of strings by separating
--them at spaces. That is a standard library function called words.
--You may consider starting this exercise by using words (or your
--version, of course).
withoutArticles :: String -> [String]
withoutArticles s = filter (`notElem` articles) $ words s
  where articles = ["the", "a", "an"]