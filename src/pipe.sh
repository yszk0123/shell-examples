#!/bin/zsh

if [ -p /dev/stdin ]; then
# if [ -p "$(dirname ${BASH_SOURCE:-$0})/../tmp/a.txt" ]; then
  echo '<pipe>'
  cat -
fi
