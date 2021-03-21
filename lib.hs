module Lib where

fibonacciSequence = 1 : 2 : zipWith (+) fibonacciSequence (tail fibonacciSequence)
