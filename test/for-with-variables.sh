#!/bin/zsh
. $(dirname ${BASH_SOURCE:-$0})/helpers/assert.sh

s1='a b c'
s2='d e f'
tmp=''
for v in $s1 $s2; do
  tmp="$tmp;$v"
done
assert_equals $tmp ';a b c;d e f'

tmp=''
for v in "$s1" "$s2"; do
  tmp="$tmp;$v"
done
assert_equals $tmp ';a b c;d e f'

assert_end
