module class_notes
import StdEnv

:: Person = {name :: String, age :: Int, isDead :: Bool, birthday :: (Int,Int) }

Evan = {name="Evan", age=1, isDead = True, birthday=(12,9) }
Hossam = {name = "Hossam", age = 100000, isDead = False, birthday=(1,1)}

newBirthday :: Person -> Person
//newBirthday s = {name = s.name, age = (s.age + 1), isDead=s.isDead, birthday=s.birthday}
newBirthday s = {s & age = (s.age + 1)}

samePerson :: Person Person -> Bool
samePerson a b = a.name == b.name && a.age == b.age && a.birthday == b.birthday

instance == Person where == a b = a.name == b.name && a.age == b.age && a.birthday == b.birthday
//Start = newBirthday {name="Evan", age= 1, isDead = True, birthday=(12,9) }
//Start = samePerson Evan Hossam

:: Vector2 a = {v0 :: a, v1 :: a}

newVect1 :: (Vector2 Int)
newVect1 = {v0 = 1, v1 = 4}

newVect3 :: (Vector2 Int)
newVect3 = {v0 = 5, v1 = -7}

newVect2 :: (Vector2 Bool)
newVect2 = {v0 = True, v1 = False}

//Start = newVect2

instance + (Vector2 a) | + a where + x y = {v0 = x.v0 + y.v0, v1 = x.v1 + y.v1 }
instance zero (Vector2 a) | zero a where zero   = {v0 = zero, v1 = zero}

//Start = newVect1 + newVect3
//Start = sum[newVect1,newVect3]

//sortBy  :: (a a -> Bool) !u:[a] -> u:[a]
Start = sortBy (\(a,b) (c,d) = a<c) [(2,"hi"),(27,"bye"),(1,"f")]