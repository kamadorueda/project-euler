let
  nixpkgsSource = (import <nixpkgs> { }).fetchzip {
    url = "https://github.com/nixos/nixpkgs/archive/932941b79c3dbbef2de9440e1631dfec43956261.tar.gz";
    sha256 = "F5+ESAMGMumeYuBx7qi9YnE9aeRhEE9JTjtvTb30lrQ=";
  };
  nixpkgs = import nixpkgsSource { };

  buildSolution = script: nixpkgs.stdenv.mkDerivation {
    name = "solution";
    builder = builtins.toFile "builder" ''
      source $stdenv/setup

      echo
      echo ===
      echo 'Compiling...'
      ghc $lib $script -o main -v0
      echo 'Running...'
      timeout 60 ./main > $out
      echo ===
      echo
    '';
    buildInputs = [
      (nixpkgs.ghc.withPackages (p: with p; [
        primes
      ]))
    ];
    lib = ./solutions/0000-library.hs;
    inherit script;
  };
in
builtins.mapAttrs (name: buildSolution) {
  solution-1 = ./solutions/0001-multiples-of-3-and-5.hs;
  solution-2 = ./solutions/0002-even-fibonacci-numbers.hs;
  solution-3 = ./solutions/0003-largest-prime-factor.hs;
  solution-4 = ./solutions/0004-largest-palindrome-product.hs;
  solution-5 = ./solutions/0005-smallest-multiple.hs;
  solution-6 = ./solutions/0006-sum-square-difference.hs;
}
