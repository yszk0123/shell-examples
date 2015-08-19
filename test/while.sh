#!/bin/zsh
. $(dirname ${BASH_SOURCE:-$0})/helpers/assert.sh
# [while 文の使用方法 - UNIX & Linux コマンド・シェルスクリプト リファレンス](http://shellscript.sunone.me/while.html#while-3)

tmp=''
i=0
while [ $i -lt 4 ]; do
  tmp="$tmp;$i"
  i=$(( i + 1 ))
done
assert_equals $tmp ';0;1;2;3'

tmp=''
i=0
while [ $i -lt 2 ]; do
  j=0
  while [ $j -lt 3 ]; do
    tmp="$tmp;$i,$j"
    j=$(( j + 1 ))
  done
  i=$(( i + 1 ))
done
assert_equals $tmp ';0,0;0,1;0,2;1,0;1,1;1,2'

tmp='ok'
i=0
while :; do
  while :; do
    [ $i -gt 2 ] && break 2
    i=$(( i + 1 ))
  done
  tmp='never be executed'
done
assert_equals $tmp 'ok'

assert_end
