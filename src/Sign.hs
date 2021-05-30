-- Fix it
-- Won’t someone take pity on this poor broken code and fix it up? Be
-- sure to check carefully for things like capitalization, parentheses, and
-- indentation.
-- 1. module sing where
-- fstString :: [Char] ++ [Char]
-- fstString x = x ++ " in the rain"
-- sndString :: [Char] -> Char
-- sndString x = x ++ " over the rainbow"
-- sing = if (x > y) then fstString x or sndString y
-- where x = "Singin"
-- x = "Somewhere"

module Sign where

fstString :: [Char] -> [Char]
fstString x = x ++ " in the rain"

sndString :: [Char] -> [Char]
sndString x = x ++ " over the rainbow"

sing :: Ord x => x -> x -> String
sing a b = if a > b then fstString x else sndString y
    where x = "Singin"
          y = "Somewhere"