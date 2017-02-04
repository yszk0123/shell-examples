#!/bin/bash -e
# cf. http://stackoverflow.com/questions/6980090/how-to-read-from-file-or-stdin-in-bash

while read -r line
do
  echo "$line"
done < "${1:-/dev/stdin}"
