#!/bin/bash

# This script generates the runtime sources.
#
# It takes an optional --version argument which is set as the version field
# in the generated alire.toml files.
#
# By default, this script generates the runtimes for all supported targets.
# To generate the runtimes for a single target, use --target.
#
# Note that any existing "install" folder should be deleted before calling
# this script, otherwise the runtime generation will fail (bb-runtimes will
# refuse to overwrite existing runtimes).
#
# Examples:
# ./generate-runtimes.sh
# ./generate-runtimes.sh --version 1.2.3
# ./generate-runtimes.sh --target rp2040

set -e

ARGUMENT_LIST=(
  "version"
  "target"
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

    --target)
      target=$2
      shift 2
      ;;

    *)
      break
      ;;
  esac
done

all_targets=(\
  "rp2040" \
  "rp2350" \
  "nrf52832" \
  "nrf52833" \
  "nrf52840" \
  "nrf54l" \
  "stm32f0xx" \
  "stm32g0xx" \
  "stm32g4xx" \
)

if [[ -z $target ]]; then
    targets=("${all_targets[@]}")
else
    targets=($target)
fi

profiles=("light" "light-tasking" "embedded")

echo "Generating runtimes"

python build-rts.py \
    --rts-src-descriptor=bb-runtimes/gnat_rts_sources/lib/gnat/rts-sources.json \
    ${targets[@]}

for target in "${targets[@]}"; do
    for profile in "${profiles[@]}"; do
        echo "Patching runtime ${profile}-${target}"

        if [[ -z $version ]]; then
            python patch-runtime.py \
                --runtime-dir=install/${profile}-${target,,} \
                --profile=${profile} \
                --target=${target}
        else
            python patch-runtime.py \
                --runtime-dir=install/${profile}-${target,,} \
                --profile=${profile} \
                --target=${target} \
                --version=$version
        fi
    done
done