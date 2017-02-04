#!/bin/bash -e

for file in ./test/*.sh; do
  name="$(basename "$file")"
  echo "Executing $name..."
  "./test/$name"
  echo
done
