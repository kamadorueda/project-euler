module Lib where

import Data.List.Ordered

fibonacciSequence :: [Integer]
fibonacciSequence =
  1 : 2 : zipWith (+) fibonacciSequence (tail fibonacciSequence)

primesSequence :: [Integer]
primes =
  2 :
  3 :
  minus
    [5,7 ..]
    (unionAll [[p * p,p * p + 2 * p ..] | p <- tail primesSequence])
