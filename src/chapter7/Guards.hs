module Guards where

{-Writing guard blocks
Guard syntax allows us to write compact functions that allow for two
or more possible outcomes depending on the truth of the conditions.-}
myAbs :: Integer -> Integer
myAbs x
  | x < 0 = (-x)
  | otherwise = x
--Notice that each guard has its own equals sign.

{-
Guards always evaluate sequentially, so your guards should be
ordered from the case that is most restrictive to the case that is least
restrictive.-}

avgGrade :: (Fractional a, Ord a) => a -> a -> Char
avgGrade q a
  | g >= 0.9 = 'A'
  | g >= 0.8 = 'B'
  | g >= 0.7 = 'C'
  | g >= 0.59 = 'D'
  | g < 0.59 = 'F'
  where g = a / q
{-Also notice we left out the otherwise; we could have used it for the
final case but chose instead to use less than. That is fine because in
our guards we’ve handled all possible values. It is important to note
that GHCi cannot always tell you when you haven’t accounted for all
possible cases, and it can be very difficult to reason about it, so it is
wise to use otherwise in your final guard.-}

--Intermission: Exercises

--1. It is probably clear to you why you wouldn’t put an otherwise in your top-most guard, 
--but try it with avgGrade anyway and see what happens. 
--It’ll be more clear if you rewrite it as an actual otherwise match: | otherwise = 'F'. 
--What happens now if you pass a 90 as an argument? 75? 60?
avgGrade' :: (Fractional a, Ord a) => a -> a -> Char
avgGrade' q a
  | g >= 0.9 = 'A'
  | g >= 0.8 = 'B'
  | g >= 0.7 = 'C'
  | g >= 0.59 = 'D'
  | otherwise = 'F'
  where g = a / q
  
--2. What happens if you take avgGrade as it is written and reorder the guards? Does it still typecheck and work the same? 
--Try moving | y >= 0.7 = 'C' and passing it the argument 90, which
--should be an ‘A.’ Does it return an ‘A’?

--3. The following function returns
pal xs
  | xs == reverse xs = True
  | otherwise = False
--True when xs is a palindrome

--4. What types of arguments can pal take?
--An array of things deriving Eq

--5. What is the type of the function pal?
pal :: Eq a => [a] -> Bool

--6. The following function returns

numbers x
  | x < 0 = -1
  | x == 0 = 0
  | x > 0 = 1
--an indication of whether its argument is a positive or negative number or zero

--7. What types of arguments can numbers take?
--Any value deriving Num and Ord

--8. What is the type of the function numbers?
numbers :: (Num a, Ord a, Num p) => a -> p