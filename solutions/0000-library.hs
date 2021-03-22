module Lib where

import Data.Numbers.Primes (wheelSieve)

fibonacciSequence :: [Integer]
fibonacciSequence =
  1 : 2 : zipWith (+) fibonacciSequence (tail fibonacciSequence)

numberAsList :: Integral a => [a] -> [a]
numberAsList (n:ns) =
  let list = quot n 10 : mod n 10 : ns
   in if head list > 10
        then numberAsList list
        else list

primeFactors :: Integer -> [Integer]
primeFactors n = factorize n [] primesSequence
  where
    factorize :: Integer -> [Integer] -> [Integer] -> [Integer]
    factorize 1 factors primes = factors
    factorize n factors primes =
      let currentPrime:remainingPrimes = primes
       in if mod n currentPrime == 0
            then factorize (quot n currentPrime) (currentPrime : factors) primes
            else factorize n factors remainingPrimes

primesSequence :: [Integer]
primesSequence = wheelSieve 8
