#!/bin/bash -e

# shellcheck disable=SC1090
. "$(dirname "${BASH_SOURCE:-$0}")/helpers/assert.sh"

sum=0
for i in 1 2 3 4 5; do
  sum=$((sum + i))
done

assert_equals $sum 15
assert_end
