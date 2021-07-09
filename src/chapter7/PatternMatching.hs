module PatternMatching where

isItTwo :: Integer -> Bool
isItTwo 2 = True
isItTwo _ = False
--Note the use of the underscore _ after the match against the value 2.
--This is a means of defining a universal pattern that never fails to match, a sort of “anything else” case.

--The order of pattern matches matters!
--The following version of the function will always return False
--because it will match the “anything else” case first – and match it to everything –
--so nothing will get through that to match with the pattern you do want to match:
isItTwo' :: Integer -> Bool
isItTwo' _ = False
isItTwo' 2 = True

--What happens if we forget to match a case in our pattern?
isItTwo'' :: Integer -> Bool
isItTwo'' 2 = True
--This is an incomplete pattern match because it can’t match any other data.
--This will throw an exception, which if unhandled, will make your program fail.

--Pattern matching against data constructors
newtype Username = Username String
newtype AccountNumber = AccountNumber Integer

data User = UnregisteredUser
          | RegisteredUser Username AccountNumber

printUser :: User -> IO ()
printUser UnregisteredUser = putStrLn "UnregisteredUser"
printUser (RegisteredUser (Username name) 
                          (AccountNumber acctNum)) = 
                            putStrLn $ name ++ " " ++ show acctNum
                            
data WherePenguinsLive =
    Galapagos
  | Antarctica
  | Australia
  | SouthAfrica
  | SouthAmerica
  deriving (Eq, Show)
  
data Penguin = Peng WherePenguinsLive
  deriving (Eq, Show)
  
isSouthAfrica' :: WherePenguinsLive -> Bool
isSouthAfrica' SouthAfrica = True
isSouthAfrica' _ = False

gimmeWhereTheyLive :: Penguin -> WherePenguinsLive
gimmeWhereTheyLive (Peng whereitlives) = whereitlives

humboldt = Peng SouthAmerica
gentoo = Peng Antarctica
macaroni = Peng Antarctica
little = Peng Australia
galapagos = Peng Galapagos

galapagosPenguin :: Penguin -> Bool
galapagosPenguin (Peng Galapagos) = True
galapagosPenguin _ = False

antarcticPenguin :: Penguin -> Bool
antarcticPenguin (Peng Antarctica) = True
antarcticPenguin _ = False

antarcticOrGalapagos :: Penguin -> Bool
antarcticOrGalapagos p =
  (galapagosPenguin p) || (antarcticPenguin p)
  
--Intermission: Exercises
--  1. Given the following declarations
k (x, y) = x
k1 = k ((4-1), 10)
k2 = k ("three", (1 + 2))
k3 = k (3, True)
--  a) What is the type of k? k :: (a,b) -> a
--  b) What is the type of k2? Is it the same type as k1 or k3? k2 :: [Char]. It's not the same type as k1 or k3 which is Integer
--  c) Of k1, k2, k3, which will return the number 3 as the result? k3 

--  2. Fill in the definition of the following function:
-- Remember: Tuples have the same syntax for their type constructors and their data constructors.
f :: (a, b, c) -> (d, e, f) -> ((a, d), (c, f))
f (a, _, c) (d, _, f)= ((a, d), (c, f))