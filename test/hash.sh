#!/bin/zsh
. $(dirname ${BASH_SOURCE:-$0})/helpers/assert.sh
# 連想配列
# cf. [zsh の配列操作の基本から応用まで - Qiita](http://qiita.com/mollifier/items/f897b3fddd2d10369333)

typeset -A map
assert_equals ${(t)map} 'association'

map=(a 10 b 20)
assert_equals "$map" '10 20'
assert_equals $map[a] '10'
assert_equals "${(k)map}" 'a b'
assert_equals "${(v)map}" '10 20'

assert_end
