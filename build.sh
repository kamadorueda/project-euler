#! /usr/bin/env bash

function main {
  cat $( \
    nix-build \
    --attr "problem-${1}" \
    --option sandbox true \
    --no-out-link \
    default.nix \
  )
}

main "${@}"
