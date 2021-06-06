module DayOfWeek where

data DayOfWeek =
  Mon | Tue | Weds | Thu | Fri | Sat | Sun
  deriving (Ord, Show)

-- day of week and numerical day of month
data Date =
  Date DayOfWeek Int

instance Eq DayOfWeek where
  (==) Mon Mon = True
  (==) Tue Tue = True
  (==) Weds Weds = True
  (==) Thu Thu = True
  (==) Fri Fri = True
  (==) Sat Sat = True
  (==) Sun Sun = True
  (==) _ _ = False

instance Eq Date where
  (==) (Date weekday dayOfMonth)
       (Date weekday' dayOfMonth') =
    weekday == weekday' && dayOfMonth == dayOfMonth'
    
{-
deriving (Ord, Show)
We only derived Ord and Show there because you should still have
the Eq instance we wrote for this datatype in scope.
Values to the left are “less than” values to the right, as if they were
placed on a number line:
But if we wanted to express that Friday is always the best day, we can
write our own Ord instance to express that:
-}
instance Ord DayOfWeek where
  compare Fri Fri = EQ
  compare Fri _ = GT
  compare _ Fri = LT
  compare _ _ = EQ
  
{-A few things to keep in mind about writing Ord instances: 
First, it is wise to ensure that your Ord instances agree with your Eq instances,
whether the Eq instances are derived or manually written. 
If x == y, then compare x y should return EQ. 
Also, you want your Ord instances to define a sensible total order. 
You ensure this in part by covering all cases and not writing partial instances, 
as we noted above with Eq. In general, your Ord instance should be written such that,
when compare x y returns LT, then compare y x returns GT.-}
