module Trivial where

data Trivial =
  Trivial

--Prelude> Trivial == Trivial
--No instance for (Eq Trivial) arising from a use of β==β
--In the expression: Trivial == Trivial
--In an equation for βitβ: it = Trivial == Trivial

instance Eq Trivial where
  (==) Trivial Trivial = True
  
--Prelude> Trivial == Trivial
--True