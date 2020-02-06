module staircase
import StdEnv

climbStairs n = climb_stairs 0 n

climb_stairs i n
| i > n = 0
| i == n = 1
= (climb_stairs (i+1) n) + (climb_stairs (i+2) n)

Start = climbStairs 5