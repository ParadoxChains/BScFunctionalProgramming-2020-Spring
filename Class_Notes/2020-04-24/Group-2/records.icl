module records
import StdEnv

/*
Records are a way to hold different types of data in an organized fashion. ⊂(´• ω •`⊂)
*/

myBirthdayTuple :: (Int, String, Int)
myBirthdayTuple = (2000,"April",01)

yourBirthdayTuple :: (String, Int, Int)
yourBirthdayTuple = ("April",01,2000)
//Start = snd3 myBirthdayTuple
//Start = snd3 yourBirthdayTuple

:: Date = {
            year :: Int,
            month :: Month,
            day :: Int
          }
evanBirthday :: Date
evanBirthday = { year = 2000, month = Apr, day = 1 }
//evanBirthday = {month = "April", day = 1, year = 2000}
//Start = evanBirthday //(Date 2000 "April" 1)
//Start = evanBirthday.month //"April"

:: Person = {
                name :: String,
                favoriteColor :: [String],
                birthday :: Date,
                isSingle :: Bool
            }
Evan :: Person
Evan = { isSingle = True, favoriteColor = ["Red","Blue","Green"], birthday = evanBirthday, name = "Evan" }

//Start = Evan //(Person "Evan" "Red" (Date 2000 "April" 1) True)

:: Point a = { x::a, y::a, z::a }
p1 :: (Point Int)
p1 = {x=0, y=2, z=3}
p2 :: (Point Real)
p2 = {x=1.234, y=2.456, z=3.1456}

// p3 = { x=True, y=False, z=True}

//Start = p1 //(Point 0 2 3)
//Start = p2 //(Point 1.234 2.456 3.1456)
//Start = p3 //(Point True False True)

// :: Random a b c = { x :: a, y :: b, z :: c, extra :: String, w :: (a,b)}
// Start = {x=4, y=True, z=754848.48485, extra = "Hello", w=(5,False)}

getSingleStatus :: Person -> Bool
//getSingleStatus p = p.isSingle
//getSingleStatus {name = n, favoriteColor = c, birthday = b, isSingle = s} = s
getSingleStatus p=:{isSingle = s} = s

//Start = getSingleStatus Evan //True

updateSingleStatus :: Person -> Person
//updateSingleStatus p = {name = p.name, favoriteColor = p.favoriteColor, birthday = p.birthday, isSingle = not p.isSingle}
//updateSingleStatus p = {p & isSingle = not p.isSingle}
updateSingleStatus p=:{isSingle = s} = {p & isSingle = not s}

//Start = updateSingleStatus Evan //(Person "Evan" "Red" (Date 2000 "April" 1) False)

newProfile :: Person -> Person
newProfile p=:{isSingle = s, favoriteColor = f}
| s = { p & isSingle = not s, favoriteColor = f ++ ["white"]}
= {p & favoriteColor = []}

//Start = newProfile Evan //(Person "Evan" ["Red","Blue","Green","white"] (Date 2000 Apr 1) False)
//Start = newProfile (updateSingleStatus Evan) //(Person "Evan" [] (Date 2000 "April" 1) False)

:: Month = Jan | Feb | Mar | Apr | May | Jun | Jul | Aug | Sep | Oct | Nov | Dec 


instance == Month
where
    (==) Jan Jan = True
    (==) Feb Feb = True
    (==) Mar Mar = True
    (==) Apr Apr = True
    (==) May May = True
    (==) _ _ = False 


//Start = Evan.birthday.month //Apr
//Start = Evan.birthday.month == Jul //Overloading error [records.icl,78,Start]: "==" no instance available of type Month

makeDate :: (Int, Month, Int) -> Date
makeDate (y,m,d)
| y <= 0 || d <= 0 = abort "Invalid input\n"
= {year = y, month = m, day = d}

makePerson :: (String,Int,Month,Int) -> Person
makePerson (n,y,m,d)
| n <> "" = {name = n, favoriteColor = [], isSingle = True, birthday = makeDate (y,m,d)}
= abort "Empty Name input\n"

//Start = makeDate (2000, Apr, 1)
//Start = makeDate (2000, Apr, -4)
//Start = makeDate (2000, Blahblah, 1)
//Start = makePerson ("Evan",2000,Apr,1) //(Person "Evan" [] (Date 2000 Apr 1) True)
//Start = makePerson ("Evan",2000,Apr,-1)

//[ {field1 = a+b, field2 = a-b} \\ {field1 = a, field2 = b}<-listOfRecords ]
//map (\p = {p & field1 = newvalue } ) listofRecords
