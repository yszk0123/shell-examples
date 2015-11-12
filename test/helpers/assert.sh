#!/bin/zsh
assert_successes=0
assert_failures=0
color_green='\e[32m'
color_red='\e[31m'
color_reset='\e[m'

function _assert_inc_successes() {
  printf "${color_green}.${color_green}"
  assert_successes=$(( assert_successes + 1 ))
}

function _assert_inc_failures() {
  echo "${color_red}$1${color_reset}"
  assert_failures=$(( assert_failures + 1 ))
}

function assert_equals() {
  local actual=$1
  local expected=$2
  local message=$3

  if [ "$expected" = "$actual" ]; then
    _assert_inc_successes
  else
    _assert_inc_failures ${message:-expected '$expected', actual '$actual'}
  fi
}

function assert_ok() {
  local expression=$1
  local message=$2

  if [ $1 -ne 0 ]; then
    _assert_inc_successes
  else
    _assert_inc_failures ${message:-not ok}
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
