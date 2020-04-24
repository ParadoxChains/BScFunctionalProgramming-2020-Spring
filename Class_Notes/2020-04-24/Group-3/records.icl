module records

import StdEnv

// add :: Int Int -> Int 

// Start = fst("hossam", 19) //"hossam"
// Start = fst(19, "hossam") //19

// Start = fst3 (2020, 04, 24) //2020
// Start = fst3 (24, 04, 2020) //24

// Records

:: Date = {
            year :: Int,
            month :: String,
            day :: Int
          }

hossamBD = {year = 2000, day = 8, month = Month}
          
// Start = { day = 24, month = "April", year = 2020 } //(Date 2020 4 24)

// :: Point a b = { myx::a, myy::b }

// myAwesomePoint :: Point Real Int
// myAwesomePoint = {myx = 3.5, myy = 4} //(Point 3.5 4.4)

// Start = myAwesomePoint

// :: Person = {
//                 name :: String,
//                 age :: Int,
//                 birthday :: Date,
//                 martial_status :: Bool
//             }

// Hossam :: Person
// Hossam = { name = "Hossam", age = 20, birthday = hossamBD, martial_status = False } 

// Start =  Hossam //(Person "Hossam" 19 (Date 2000 "May" 8) False)

// Give me the age of hossam
// Start = Hossam.age //19

// Give me the age of Person
// getAge :: Person -> Int
// getAge { name = n, age = a, birthday = b, martial_status = m } = a
// getAge p = p.age

// Start = getAge Hossam //19

// martialStatusUpdator :: Person -> Person
// martialStatusUpdator p
// | p.age < 20 && not p.martial_status = p
// = {p&martial_status = True, age = 600}

// Start = martialStatusUpdator Hossam //(Person "Hossam" 20 (Date 2000 "May" 8) True)


// Given three Vectors in 2D, decide if their endpoint lie on a same line.
// Hint1: Points are on a same line, if area of triangle formed by these points is 0.
// Hint2: https://www.dummies.com/education/math/algebra/finding-the-area-of-a-triangle-using-its-coordinates/
:: Vector2 = {x :: Real, y :: Real}
getSlope :: Vector2 Vector2 -> Real
getSlope a b = (b.y - a.y)/(b.x - a.x)

collinear :: Vector2 Vector2 Vector2 -> Bool
collinear a b c = getSlope a b == getSlope a c && getSlope a b == getSlope b c

// Start = collinear {x = 0.0, y = 0.0} {x = 1.0, y = 0.0} {x = 3.0, y = 0.0} // True
// Start = collinear {x = 0.0, y = 0.0} {x = 1.0, y = 0.0} {x = 3.0, y = 1.0} // False
// Start = collinear {x = 0.0, y = -1.0} {x = 2.0, y = 0.0} {x = 3.0, y = 0.0} // False

// Given a list of distinct name and a list of grade. 2 lists have the same length
// Generate a list of Person corresponding to the name list
// the grades of all Person should be the average of the 2nd list.
// Hint: The record Person should contain at least `name` and `average grade`

myAvg :: [Int] -> Real
myAvg list = avg [toReal g \\ g <- list]

:: Person = { name :: String, gpa :: Real }

Generator :: [String] [Int] -> [Person]
Generator names grades = [{ name = n, gpa = myAvg grades } \\ n <- names]

// Start = Generator ["Evan", "Tringa"] [1, 4] // [(Person "Evan" 2.5), (Person "Tringa" 2.5)]
// Start = Generator ["Evan", "Tringa", "Viktoria"] [1, 4, 7] // [(Person "Evan" 4), (Person "Tringa" 4), (Person "Viktoria", 4)]


// Algebric data type

:: Month = Jan | Feb | Mar | Apr | May | Jun | July | Aug | Sep | Oct | Nov | Dec

instance == Month
where
    (==) Jan Jan = True
    (==) Feb Feb = True
    (==) Mar Mar = True
    (==) Apr Apr = True
    (==) _ _ = False

Start = Jan