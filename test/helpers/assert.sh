#!/bin/zsh
assert_successes=0
assert_failures=0
color_green='\e[32m'
color_red='\e[31m'
color_reset='\e[m'

function assert_equals() {
  local actual=$1
  local expected=$2
  local message=$3

  if [ "$expected" = "$actual" ]; then
    printf "${color_green}.${color_green}"
    assert_successes=$(( assert_successes + 1 ))
  else
    echo "${color_red}${message:-expected '$expected', actual '$actual'}${color_reset}"
    assert_failures=$(( assert_failures + 1 ))
  fi
}

function assert_end() {
  assert_count=$(( $assert_successes + $assert_failures ))
  assert_message="$assert_count examples, $assert_failures failures"
  echo

  if [ $assert_failures -eq 0 ]; then
    echo "${color_green}${assert_message}${color_reset}"
    return 0
  else
    echo "${color_red}${assert_message}${color_reset}"
    return 1
  fi
}
