module Lib where

import Data.Numbers.Primes (wheelSieve)

fibonacciSequence :: [Integer]
fibonacciSequence =
  1 : 2 : zipWith (+) fibonacciSequence (tail fibonacciSequence)

primesSequence :: [Integer]
primesSequence = wheelSieve 8
