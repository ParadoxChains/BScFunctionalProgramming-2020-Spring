module records
import StdEnv

/*
Records are a way to hold different types of data in an organized fashion. ⊂(´• ω •`⊂)
*/

myBirthday :: (Int, String, Int)
myBirthday = (2000, "April", 01)
//Start = snd3 myBirthday //"April"
yourBirthday :: (String, Int, Int)
yourBirthday = ("April",01,2000)
//Start = snd3 yourBirthday //1

:: Date = {
            year :: Int,
            month :: Month,
            day :: Int
          }
evanBDay :: Date
evanBDay = {year=2000, month=Apr, day=1}
//evanBDay = {month="April",day=1,year=2000}
//Start = evanBDay //(Date 2000 "April" 1)
//Start = evanBDay.month //"April"

//Start = {year = 2000} //compile error

:: Person = {
                name :: String,
                favoriteColors :: [String],
                birthday :: Date,
                isSingle :: Bool
            }

Evan :: Person
Evan = {birthday = evanBDay, favoriteColors = ["Red","Blue","Green"], name = "Evan", isSingle = True}

Jack :: Person
Jack = {isSingle = False, birthday = {month = Jan, day = 24, year = 1999}, favoriteColors = [], name = "Jack"}

//Start = Evan //(Person "Evan" ["Red","Blue","Green"] (Date 2000 "April" 1) True)
//Start = Evan.birthday.month //"April"
//Start = hd Evan.favoriteColors //"Red"

:: Point a = {x::a,y::a,z::a}

p1 :: (Point Int)
p1 = {x=1,y=2,z=3}
//Start = p1 //(Point 1 2 3)
p2 :: (Point Real)
p2 = {x=1.234, y=2.345, z=3.456}
//Start = p2 //(Point 1.234 2.345 3.456)
p3 = {x=True,y=False,z=True}
//Start = p3

// :: WeirdRecord a b c d e f = {x::(a,b),y::[c],z::e, s::a, r::Bool}
// wr = {x=("Evan",41.343),y=[3,5,6,3,5],z="Hello",s="Bye",r=True}

//Start = wr //(WeirdRecord ("Evan",41.343) [3,5,6,3,5] "Hello" "Bye" True)
// :: Person = {
//                 name :: String,
//                 favoriteColors :: [String],
//                 birthday :: Date,
//                 isSingle :: Bool
//             }
// :: Date = {
//             year :: Int,
//             month :: String,
//             day :: Int
//           }
// getBirthMonth :: Person -> String
// //getBirthMonth p = p.birthday.month
// //getBirthMonth {name = n, favoriteColors = f, birthday = b, isSingle = s} = b.month
// getBirthMonth p=:{birthday = {month = m}}
// | p.isSingle = m
// = "blah"

//Start = getBirthMonth Evan //"April"

updateSingleStatus :: Person -> Person
//updateSingleStatus p = {isSingle = not p.isSingle, name = p.name, favoriteColors = p.favoriteColors, birthday = p.birthday}
//updateSingleStatus p = {p & isSingle = not p.isSingle }
updateSingleStatus p=:{isSingle = s} = {p& isSingle = not s}

//Start = updateSingleStatus Evan //(Person "Evan" ["Red","Blue","Green"] (Date 2000 "April" 1) False)

updateColors :: Person -> Person
updateColors p=:{isSingle = s, favoriteColors = f}
// | p.isSingle = {p & isSingle = not p.isSingle, favoriteColors = p.favoriteColors ++ ["White"]}
// = {p& isSingle = not p.isSingle, favoriteColors = []}
| s = {p & isSingle = not s, favoriteColors = f ++ ["White"]}
= {p& isSingle = not s, favoriteColors = []}

//Start = updateColors (updateSingleStatus Evan)

:: Month = Jan | Feb | Mar | Apr | May | Jun | Jul | Aug | Sep | Oct | Nov | Dec

//Start = Evan.birthday.month == Apr //Overloading error [records.icl,95,Start]: "==" no instance available of type Month

instance == Person
where
//    (==) p1 p2 = p1.name == p2.name && p1.isSingle == p2.isSingle
    (==) {name=n1, birthday=b1} {name=n2, birthday=b2} = n1 == n2 && b1==b2
//operator overloading <- THIS IS NOT WHAT IT IS CALLED IN FUNCTIONAL 
instance == Date where (==) {day=d1, year = y1, month = m1} {day=d2, year = y2, month=m2} = d1==d2 && y1==y2 && m1==m2

instance == Month
where
    (==) Jan Jan = True
    (==) Feb Feb = True
    (==) Mar Mar = True
    (==) Apr Apr = True
    (==) May May = True
    (==) _ _ = False

//Start = Evan == Jack 

instance < Person 
where
    (<) {birthday={year=y1}} {birthday={year=y2}} = y1 < y2

//Start = Evan < Jack

:: Gender = Male | Female | AttackHelicopter

listPeople = [Evan, Jack]
//Start = isMember Evan listPeople
//Start = sort listPeople