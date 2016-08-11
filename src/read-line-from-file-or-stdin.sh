#!/bin/sh
# cf. http://stackoverflow.com/questions/6980090/how-to-read-from-file-or-stdin-in-bash

while read line
do
  echo "$line"
done < "${1:-/dev/stdin}"
