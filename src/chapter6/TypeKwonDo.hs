module TypeKwonDo where
--Type-Kwon-Do
{-
Round Two! Same rules apply — you’re trying to fill in terms (code)
which’ll fit the type. The idea with these exercises is that you’ll derive
the implementation from the type information. You’ll probably need
to use stuff from Prelude.-}

--1. 
chk :: Eq b => (a -> b) -> a -> b -> Bool
chk fab a b = fab a == b
--2. 
-- Hint: use some arithmetic operation to
-- combine values of type 'b'. Pick one.
arith :: Num b => (a -> b) -> Integer -> a -> b
arith fab int a = fab a + fromInteger int 