module Arith4 where

--4. For this next exercise, you’ll experiment with writing pointfree versions of existing code. 
--This involves some new information, so read the following explanation carefully.
--Typeclasses are dispatched by type. Read is a typeclass like Show,  but it is the dual or “opposite” of Show. 
--In general, the Read typeclass isn’t something you should plan to use a lot, but this exercise
--is structured to teach you something about the interaction  between typeclasses and types.
--The function read in the Read typeclass has the type:
--read :: Read a => String -> a
--  Notice a pattern?
--read :: Read a => String -> a
--show :: Show a => a -> String

--Write the following code into a source file. 
--Then load it and -run it in GHCi to make sure you understand why the evaluation results in the answers you see.
--id :: a -> a
--id x = x
  
roundTrip :: (Show a, Read a) => a -> a
roundTrip a = read (show a)

main = do
  print (roundTrip 4)
  print (id 4)

--5. Next, write a pointfree version of roundTrip.
roundTrip' :: (Show a, Read a) => a -> a
roundTrip' = read . show
--6. We will continue to use the code in module Arith4 for this exercise as well.

