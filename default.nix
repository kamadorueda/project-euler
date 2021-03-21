let
  nixpkgsSource = (import <nixpkgs> { }).fetchzip {
    url = "https://github.com/nixos/nixpkgs/archive/932941b79c3dbbef2de9440e1631dfec43956261.tar.gz";
    sha256 = "F5+ESAMGMumeYuBx7qi9YnE9aeRhEE9JTjtvTb30lrQ=";
  };
  nixpkgs = import nixpkgsSource { };

  buildSolution = num: script: nixpkgs.stdenv.mkDerivation {
    name = "problem-${num}";
    builder = builtins.toFile "builder" ''
      source $stdenv/setup

      echo
      echo ===
      echo 'Problem: https://projecteuler.net/problem=${num}'
      echo 'Compiling...'
      ghc $lib $script -o main -v0
      echo 'Running...'
      timeout 60 ./main > $out
      echo ===
      echo
    '';
    buildInputs = [ nixpkgs.ghc ];
    lib = ./lib.hs;
    inherit num script;
  };
in
{
  problem-1 = buildSolution "1" ./0001.multiples-of-3-and-5.hs;
  problem-2 = buildSolution "2" ./0002.even-fibonacci-numbers.hs;
}
