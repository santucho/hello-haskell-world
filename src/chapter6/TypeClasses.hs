module TypeClasses where

{- Intermission: Exercises Look at the types given for quotRem and
divMod. What do you think those functions do? Test your hypotheses
by playing with them in the REPL. We’ve given you a sample to start
with below:
Prelude> let ones x = snd (divMod x 10) -}

-- :t divMod
-- divMod :: Integral a => a -> a -> (a, a)
-- divMod 9 3 
-- (3,0)
-- divMod 9 3 
-- (2,1)
-- divMod returns a tuple where fst is the quotient and snd is the remainder

-- divMod 9 (-2)
-- (-5,-1) 
-- divMod 10 (-3)
-- (-4,-2)
-- divMod rounds down every negative quotient

-- quotRem 9 (-2)
-- (-4,1)
-- quotRem does not allow negative remainder


{- Intermission: Exercises
Next, take a look at the following code examples and try to decide
if they will work, what result they will return if they do, and why or
why not (be sure, as always, to test them in your REPL once you have
decided on your answer):
1. max (length [1, 2, 3]) (length [8, 9, 10, 11, 12]) --> 5
2. compare (3 * 4) (3 * 5) --> LT
3. compare "Julie" True --> Error
4. (5 + 3) > (3 + 6) --> False
-}

{-
• a typeclass defines a set of functions and/or values
• types have instances of that typeclass
• the instances specify the ways that type uses the functions of the typeclass
-}
class Numberish a where
  fromNumber :: Integer -> a
  toNumber :: a -> Integer
  -- This is even worse. Don't use typeclasses to define default values.
  defaultNumber :: a
-- pretend newtype is data for now
-- https://stackoverflow.com/questions/5889696/difference-between-data-and-newtype-in-haskell
newtype Age =
  Age Integer
  deriving (Eq, Show)
  
instance Numberish Age where
  fromNumber n = Age n
  toNumber (Age n) = n
  defaultNumber = Age 65
    
newtype Year =
  Year Integer
  deriving (Eq, Show)
    
instance Numberish Year where
  fromNumber n = Year n
  toNumber (Year n) = n
  defaultNumber = Year 1998
    
sumNumberish :: Numberish a => a -> a -> a
sumNumberish a a' = fromNumber summed
    where integerOfA = toNumber a
          integerOfAPrime = toNumber a'
          summed = integerOfA + integerOfAPrime
          
{-
Now let us think about this for a moment. The class definition of Numberish doesn’t define 
any terms or actual code we can compile and execute, only types. 
The code actually lives in the instances for Age and Year. 
So how does Haskell know where to find code?

Prelude> sumNumberish (Age 10) (Age 10)
Age 20

Prelude> sumNumberish (Year 1810) (Age 100)
Year 1910

Prelude> sumNumberish (Age 10) (Year 2000)
Error
-}

{-Prelude> defaultNumber
Error
Prelude> defaultNumber :: Age
Age 65
Prelude> defaultNumber :: Year
Year 1988-}

{-
Why not write a typeclass like this?
For reasons we’ll explain when we talk about Monoid, it’s important
that your typeclasses have laws and rules about how they work. Numberish
is a bit arbitrary, and there are better ways to express what it
does in Haskell than a typeclass. Functions and values alone suffice
here.-}


{-Intermission: Exercises
Write the Eq instance for the datatype provided.-}
--1. It’s not a typo, we’re just being cute with the name.
data TisAnInteger =
  TisAn Integer
instance Eq TisAnInteger where
  (==) (TisAn a) (TisAn a') = a == a'
--2. 
data TwoIntegers =
  Two Integer Integer
instance Eq TwoIntegers where
  (==) (Two a b) (Two a' b') = 
    a == a' && b == b'
--3. 
data StringOrInt =
    TisAnInt Int
  | TisAString String
instance Eq StringOrInt where
  (==) (TisAnInt i) (TisAnInt i') = i == i'
  (==) (TisAString s) (TisAString s') = s ==s'
  (==) _ _ = False
--4.
data Pair a =
  Pair a a
instance (Eq a) => Eq (Pair a) where
  (==) (Pair a1 a2) (Pair a1' a2') = 
    a1 == a1' && a2 == a2'
--5.
data Tuple a b =
  Tuple a b
instance (Eq a, Eq b) => Eq (Tuple a b) where
  (==) (Tuple a b) (Tuple a' b') =
    a == a' && b == b'
--6. 
data Which a =
    ThisOne a
  | ThatOne a
instance (Eq a) => Eq (Which a) where
  (==) (ThisOne a) (ThisOne a') = a == a'
  (==) (ThatOne a) (ThatOne a') = a == a'
  (==) _ _ = False
--7.
data EitherOr a b =
    Hello a
  | Goodbye b
instance (Eq a, Eq b) => Eq (EitherOr a b) where
  (==) (Hello a) (Hello a') = a == a'
  (==) (Goodbye b) (Goodbye b') = b == b'
  (==) _ _ = False