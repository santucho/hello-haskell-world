module IO where
{-
The simplest way to think about the difference between a value
with a typical type like String and the same type but from IO such
as with IO String is that IO actions are formulas. When you have
a value of type IO String it’s more of a means of producing a String,
which may require performing side effects along the way before you
get your String value.-}

-- this is just a String value
myVal :: String
myVal = undefined
-- this value is a method or means of obtaining
-- a value of type String which
-- performs side effects aka IO
ioString :: IO String
ioString = undefined
{-
An IO action is performed when we run the main function of our
program, as we have seen. But we also perform an IO action when we
invoke print implicitly or explicitly.-}
