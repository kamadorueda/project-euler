-- The prime factors of 13195 are 5, 7, 13 and 29.
-- What is the largest prime factor of the number 600851475143 ?
import Lib

main :: IO ()
main =
  print
    (last
       [ p
       | p <- takeWhile (\n -> n * n < target) primesSequence
       , mod target p == 0
       ])

target :: Integer
target = 600851475143
