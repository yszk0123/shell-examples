#!/bin/bash -e

echo '"$*"'
for value in "$*"; do
  echo $value
done

echo '"$@"'
for value in "$@"; do
  echo $value
done
