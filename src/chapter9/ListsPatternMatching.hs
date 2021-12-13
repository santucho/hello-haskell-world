module ListsPatternMatching where

myHead :: [a] -> Maybe a
myHead []      = Nothing
myHead (x : _) = Just x 

--ListsPatternMatching> (fmap $ (+1)) . myHead $ [1,2,3]
--Just 2

myTail :: [a] -> Maybe [a]
myTail []       = Nothing
myTail [_]      = Nothing -- [_] represents a List with one element, it's like (_ : [])
myTail (_ : xs) = Just xs

--ListsPatternMatching> (fmap $ map (+1)) . myTail $ [1,2,3]
--Just [3,4]
