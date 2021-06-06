module Trivial where

data Trivial =
  Trivial

--Prelude> Trivial == Trivial
--No instance for (Eq Trivial) arising from a use of ‘==’
--In the expression: Trivial == Trivial
--In an equation for ‘it’: it = Trivial == Trivial

instance Eq Trivial where
  (==) Trivial Trivial = True
  
--Prelude> Trivial == Trivial
--True