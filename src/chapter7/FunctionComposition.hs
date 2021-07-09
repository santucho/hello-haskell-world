module FunctionComposition where

{-Function composition
Function composition is a type of higher-order function that allows
us to combine functions such that the result of applying one function
gets passed to the next function as an argument. It is a very concise
style, in keeping with the terse functional style Haskell is known for.-}

-- (.) :: (b -> c) -> (a -> b) -> a -> c