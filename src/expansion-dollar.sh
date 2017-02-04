#!/bin/bash -e

echo '"$*"'
# shellcheck disable=SC2066
for value in "$*"; do
  echo "$value"
done

echo '"$@"'
for value in "$@"; do
  echo "$value"
done
