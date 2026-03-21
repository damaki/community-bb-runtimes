#!/bin/bash

set -e

ARGUMENT_LIST=(
  "version"
)

# read arguments
opts=$(getopt \
  --longoptions "$(printf "%s:," "${ARGUMENT_LIST[@]}")" \
  --name "$(basename "$0")" \
  --options "" \
  -- "$@"
)

eval set --$opts

while [[ $# -gt 0 ]]; do
  case "$1" in
    --version)
      version=$2
      shift 2
      ;;

    *)
      break
      ;;
  esac
done

if [[ -z $version ]]; then
    echo "error: --version is required"
    exit -1
fi

all_targets=(\
  "rp2040" \
  "rp2350" \
  "nrf52832" \
  "nrf52833" \
  "nrf52840" \
  "nrf54l_app" \
  "stm32f0xx" \
  "stm32g0xx" \
  "stm32g4xx" \
)

profiles=("light" "light-tasking" "embedded")

url="https://github.com/damaki/community-bb-runtimes/releases/download/v${version}"

for target in "${all_targets[@]}"; do
    for profile in "${profiles[@]}"; do
        alr publish --skip-submit ${url}/${profile}-${target}-${version}.tar.gz
    done
done
