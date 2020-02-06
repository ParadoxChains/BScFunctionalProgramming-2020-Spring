module class_notes
import StdEnv

:: Fraction = { num :: Int, den :: Int}

addFraction :: Fraction Fraction -> Fraction
addFraction p q = {num = (a*d + b*c), den = (b*d)}
    where
    a = p.num
    b = p.den
    c = q.num
    d = q.den

// a/b + c/d = (a*d + b*c)/(b*d)

half :: Fraction
half = {num = 1, den = 2}
third :: Fraction
third = {num = 1, den = 3}

//Start = addFraction half third

:: Vector2 a = {v0 :: a, v1 :: a}

instance == (Vector2 a) | == a where == vector0 vector1 = vector0.v0 == vector1.v0 && vector0.v1 == vector1.v1
instance + (Vector2 a)

myV1 :: (Vector2 Int)
myV1 = {v0 = 1, v0 = 3}
myV2 :: (Vector2 Int)
myV2 = {v0 = 2, v0 = -5}

equalVect :: (Vector2 a) (Vector2 a) -> Bool
equalVect vector0 vector1 = vector0.v0 == vector1.v0 && vector0.v1 == vector1.v1