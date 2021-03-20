let
  nixpkgs = import <nixpkgs> { };

  buildSolution = num: script: nixpkgs.stdenv.mkDerivation {
    name = "problem-${num}";
    builder = builtins.toFile "builder" ''
      source $stdenv/setup

      echo
      echo ===
      echo "Problem statement: https://projecteuler.net/problem=${num}"
      echo ===
      timeout 60 ghci $script |& tee $out
      echo ===
      echo
    '';
    buildInputs = [ nixpkgs.ghc ];
    inherit num script;
  };
in
{
  problem1 = buildSolution "1" ./0001.multiples-of-3-and-5.hs;
}
