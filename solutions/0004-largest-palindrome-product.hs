-- A palindromic number reads the same both ways.
-- The largest palindrome made from the product of two 2-digit numbers is
-- 9009 = 91 × 99.
-- Find the largest palindrome made from the product of two 3-digit numbers.
import Lib

main :: IO ()
main =
  print
    (maximum
       [ a * b
       | a <- nDigitNumbers 3
       , b <- nDigitNumbers 3
       , isPalindrome (a * b)
       ])

nDigitNumbers :: Integer -> [Integer]
nDigitNumbers n = [10 ^ (n - 1) .. 10 ^ n - 1]

isPalindrome :: Integral a => a -> Bool
isPalindrome n =
  let digits = numberAsList [n]
   in digits == reverse digits
