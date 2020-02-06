module hw07Solutions
import StdEnv

:: Month = January | February | March | April | May | June | July | August | September | October | November | December
:: Gender = Male | Female | AttackHelicopter | Nghia
:: Date = {year::Int, month::Month, day::Int}
:: Person = {name::String, gender::Gender, age::Int, birthday::Date, isDead::Bool}
:: Account = {number::Int, owner::Person, balance::Real, dateCreated::Date}

Tringa :: Person
Tringa = {name = "Tringa", gender = Female, age = 42, birthday = {year = 1977, month = May, day = 12}, isDead = False}
Hossam :: Person
Hossam = {name = "Hossam", gender = AttackHelicopter, age = 69, birthday = {year = 1950, month = June, day = 27}, isDead = False}
Nicola :: Person
Nicola = {name = "Nicola", gender = Male, age = 9001, birthday = {year = -6982, month = January, day = 1}, isDead = True}
Zuka :: Person
Zuka = {name = "Zuka", gender = Male, age = 20, birthday = {year = 1999, month = February, day = 11}, isDead = False}
LeMinhNghia :: Person
LeMinhNghia = {name = "Nghia", gender = Nghia, age = 420, birthday = {year = 1599, month = February, day = 4}, isDead = True}

A00 :: Account
A00 = {number = 0, owner = Nicola, balance = 9000.01, dateCreated = {year = 1945, month = August, day = 6}}

A01 :: Account
A01 = {number = 1, owner = Hossam, balance = -1337.42, dateCreated = {year = 1900, month = December, day = 25}}

A02 :: Account
A02 = {number = 2, owner = Tringa, balance = 123.45, dateCreated = {year = 2010, month = May, day = 12}}

A03 :: Account
A03 = {number = 3, owner = Zuka, balance = 35.0, dateCreated = {year = 2019, month = November, day = 11}}

A420 :: Account
A420 = {number = 420, owner = LeMinhNghia, balance = 420.0, dateCreated = {year = 420, month = April, day = 20}}

SittBank :: {Account}
SittBank = {A00,A01,A02,A03}

/*
Write a function that takes a Real and an
array of Accounts updates each Account
in an array by adding the number to the balance.
*/
gimmeMoney :: {Account} Real-> {Account}
gimmeMoney x n= {{y & balance = y.balance+n}\\y<-:x}
//Start = gimmeMoney SittBank 1000000.0 //{(Account 0 (Person "Nicola" Male 9001 (Date -6982 January 1) True) 1009000.01 (Date 1945 August 6)),(Account 1 (Person "Hossam" AttackHelicopter 69 (Date 1950 June 27) False) 998662.58 (Date 1900 December 25)),(Account 2 (Person "Tringa" Female 42 (Date 1977 May 12) False) 1000123.45 (Date 2010 May 12)),(Account 3 (Person "Zuka" Male 20 (Date 1999 February 11) False) 1000035 (Date 2019 November 11))}
//Start = gimmeMoney SittBank -9999999999999999.9999999999
//{(Account 0 (Person "Nicola" Male 9001 (Date -6982 January 1) True) -9.999999999991e+15 (Date 1945 August 6)),(Account 1 (Person "Hossam" AttackHelicopter 69 (Date 1950 June 27) 
//False) -1.00000000000013e+16 (Date 1900 December 25)),(Account 2 (Person "Tringa" Female 42 (Date 1977 May 12) False) -9.99999999999988e+15 (Date 2010 May 12)),(Account 3 (Person "Zuka" Male 20 (Date 1999 February 11) False) -9.99999999999996e+15 (Date 2019 November 11))}

/*
Write a function that takes an array of Accounts
and returns the name of the owner with the
highest balance who is NOT dead.
*/
instance < Account where < a b = a.balance < b.balance
soRich :: {Account} -> String
soRich x = (maxList [y\\y<-:x | not y.owner.isDead]).owner.name
//Start = soRich {A01, A02, A03} //"Tringa"
//Start = soRich SittBank //"Tringa"

/*
Write a function that takes a tuple containing a
condition and two numbers, and an array of Accounts,
and returns an array containing all accounts
that match the condition, and that were created between
the two years (numbers provided).
*/
instance == Gender
where
    == Male Male = True
    == Female Female = True
    == AttackHelicopter AttackHelicopter = True
    == Nghia Nghia = True
    == _ _ = False
query :: ((Account -> Bool),Int,Int) {Account} -> {Account}
query (a,x,y) z = {n\\n<-:z|and[n.dateCreated.year>=x,n.dateCreated.year<=y,a n]}
//Start = query ((\x = x.owner.gender==Male),0,2000) SittBank //{(Account 0 (Person "Nicola" Male 9001 (Date -6982 January 1) True) 9000.01 (Date 1945 August 6))}
//Start = query ((\x = x.balance > 0.0),-9999,9999) SittBank //{(Account 0 (Person "Nicola" Male 9001 (Date -6982 January 1) True) 9000.01 (Date 1945 August 6)),(Account 2 (Person "Tringa" Female 42 (Date 1977 May 12) False) 123.45 (Date 2010 May 12)),(Account 3 (Person "Zuka" Male 20 (Date 1999 February 11) False) 35 (Date 2019 November 11))}
//Start = query ((\x = not x.owner.isDead && length[z\\z<-:x.owner.name]==6),0,2020) {A00,A01,A02,A03,A420} //{(Account 1 (Person "Hossam" AttackHelicopter 69 (Date 1950 June 27) False) -1337.42 (Date 1900 December 25)),(Account 2 (Person "Tringa" Female 42 (Date 1977 May 12) False) 123.45 (Date 2010 May 12))}
