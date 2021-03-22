#! /usr/bin/env bash

function main {
  cat $( \
    nix-build \
    --attr "solution-${1}" \
    --no-out-link \
    --option sandbox true \
    --show-trace \
    default.nix \
  )
}

main "${@}"
