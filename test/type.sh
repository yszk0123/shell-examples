#!/bin/zsh
. $(dirname ${BASH_SOURCE:-$0})/helpers/assert.sh
# cf. [zsh の配列操作の基本から応用まで - Qiita](http://qiita.com/mollifier/items/f897b3fddd2d10369333)

scalar='a'
assert_equals "${(t)scalar}" 'scalar'

typeset -a array
assert_equals "${(t)array}" 'array'

typeset -A map
assert_equals "${(t)map}" 'association'

assert_end
