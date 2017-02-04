#!/bin/bash -e

hello() {
  unset -f hello
  # source 'path/to/heavy/scripts'
  # 'path/to/heavy/scripts' "$@"
  echo 'Loading hello...'
  echo "$@"
}

echo 'before hello'
hello 'world (1)'
hello 'world (2)'
echo 'after hello'

nvm() {
  unset -f nvm
  echo 'Loading nvm...'
  nvm "$@"
}

node() {
  unset -f node
  echo 'Loading node...'
  node "$@"
}
