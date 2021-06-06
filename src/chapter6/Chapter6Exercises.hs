module Chapter6Exercises where
import Data.List (sort)

--1. Does the following code typecheck? If not, why not?
data Person = Person Bool
printPerson :: Person -> IO ()
printPerson person = putStrLn (show person)
--Missing instance of Show
instance Show Person where
  show (Person b) = "Person" ++ show b
  
--2. Does the following typecheck? If not, why not?
data Mood = 
  Blah | Woot 
  deriving Show
settleDown :: Mood -> Mood
settleDown x = if x == Woot
  then Blah
  else x
-- Missing instance of Eq
instance Eq Mood where
  (/=) Blah Woot = True
  (/=) _ _ = False
  
--4. Does the following typecheck? If not, why not?
type Subject = String
type Verb = String
type Object = String
data Sentence =
  Sentence Subject Verb Object
  deriving (Eq, Show)
s1 = Sentence "dogs" "drool"
s2 = Sentence "Julie" "loves" "dogs"
-- Yes
-- s1 :: Object -> Sentence
-- s2 :: Sentence

--Given a datatype declaration, what can we do?
--Given the following datatype definitions:
data Rocks =
  Rocks String deriving (Eq, Show)
data Yeah =
  Yeah Bool deriving (Eq, Show)
data Papu =
  Papu Rocks Yeah
  deriving (Eq, Show)
  
--Which of the following will typecheck? For the ones that don’t typecheck, why don’t they?
--1. Don't work, missing Rocks and Yeah constructors
--phew = Papu "chases" True
--2. Works fine
truth :: Papu
truth = Papu (Rocks "chomskydoz")
  (Yeah True)
--3. Works fine because there is an instance of (Eq Papu)
equalityForall :: Papu -> Papu -> Bool
equalityForall p p' = p == p'
--4. Don't work, missing instance of (Ord Papu)
--comparePapus :: Papu -> Papu -> Bool
--comparePapus p p' = p > p'

{-
Match the types
We’re going to give you two types and their implementations. Then
we’re going to ask you if you can substitute the second type for the
first. You can test this by typing the first declaration and its type into
a file and editing in the new one, loading to see if it fails. Don’t just
guess, test all your answers!-}

--1. For the following definition.
--a) 
i :: Num a => a
i = 1
--b) Try replacing the type signature with the following:
--i :: a
--After you’ve formulated your own answer, then tested that
--answer and believe you understand why you were right or
--wrong, make sure to use GHCi to check what type GHC infers
--for the definitions we provide without a type assigned. For
--example, for this one, you’d type in:
--Prelude> let i = 1
--Prelude> :t i
-- Result elided intentionally.
-- No instance for (Num a) after replace the type signature

--2. a) 
f :: Float
f = 1.0
--b) f :: Num a => a
-- Won't work because "1.0" declaration requires a (Fractional a)

--3. a) 
--f' :: Float
--b) Works fine
f' :: Fractional a => a
f' = 1.0
-- 
--c) Works fine too, because RealFrac has Frac as constraint
f'' :: RealFrac a => a
f'' = 1.0

--5. a) 
freud :: a -> a
freud x = x
--b) It will work, but it's an unnecessary type constraint
--freud :: Ord a => a -> a

--9. a) You’ll need to import sort from Data.List.
jung :: Ord a => [a] -> a
--b) It will work because :t sort is sort :: Ord a => [a] -> [a] and Int have an instance of Ord
--jung :: [Int] -> Int
jung xs = head (sort xs)

--11. a) 
mySort :: [Char] -> [Char]
mySort = sort
signifier :: [Char] -> Char
--b) signifier :: [Char] -> Char
-- It will work, but signifier type will be restricted by mySort type definition as signifier :: [Char] -> Char
--Chapter6Exercises Data.List> :t signifier
--signifier :: [Char] -> Char
signifier xs = head (mySort xs)
