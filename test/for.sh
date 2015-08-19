#!/bin/zsh
. $(dirname ${BASH_SOURCE:-$0})/helpers/assert.sh
# cf. [for 文の使用方法 - UNIX & Linux コマンド・シェルスクリプト リファレンス](http://shellscript.sunone.me/for.html)

tmp=''
for name in foo bar baz 'hoge fuga' "a b"; do
  tmp="$tmp;$name"
done
assert_equals $tmp ';foo;bar;baz;hoge fuga;a b'

tmp=''
for i in `seq 1 10`; do
  tmp="$tmp;$i"
done
assert_equals $tmp ';1;2;3;4;5;6;7;8;9;10'

assert_end
