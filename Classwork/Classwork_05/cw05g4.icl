module cw05g4
import StdEnv

// Calculate Euler's totient function phi(m).
// Euler's so-called totient function phi(m) is defined as 
// the number of positive integers r (1 <= r < m) that are coprime to m.

// Use list compherension

// Start = euler 10 // 4
// Start = euler 100 // 40
// Start = euler 2500 // 1000
// Start = euler 1181 // 1180
// Start = euler 1021904 // 443904

// Generate the list of all possible (Day, Month) tuples in a given year.
// Make sure to take care of different number of days in different months.
    // January - 31 days
    // February - 28 days in a common year and 29 days in leap years
    // March - 31 days
    // April - 30 days
    // May - 31 days
    // June - 30 days
    // July - 31 days
    // August - 31 days
    // September - 30 days
    // October - 31 days
    // November - 30 days
    // December - 31 days
// Make sure to take care of leap years. 
// leap year: 
// if (year is not divisible by 4) then (it is a common year)
// else if (year is not divisible by 100) then (it is a leap year)
// else if (year is not divisible by 400) then (it is a common year)
// else (it is a leap year) 



// Start = dayMonth 2016


// You are given record representing set Q (rational numbers)
// Write function simplifyRational that takes rational number and brings it to normal form. 
// So 15/20 should be 3/4, 2/4 should be 1/2, ...

//:: Q = { num :: Int, denom :: Int }
// simplifyRational :: Q -> Q

// Start = simplifyRational { num = 15, denom = 20 } // (Q 3 4)
// Start = simplifyRational { num = 2, denom = 4 } // (Q 1 2)
// Start = simplifyRational { num = 1, denom = 3 } // (Q 1 3)
// Start = simplifyRational { num = 5, denom = 1 } // (Q 5 1)
// Start = simplifyRational { num = 15, denom = -20} // (Q -3 4)
