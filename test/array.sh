#!/bin/zsh
. $(dirname ${BASH_SOURCE:-$0})/helpers/assert.sh
# cf. [zsh の配列操作の基本から応用まで - Qiita](http://qiita.com/mollifier/items/f897b3fddd2d10369333)

# local array
local -a local_array1
typeset -a local_array2

# global array
# typeset -g -a global_array

array=(a b c)
empty_array=()
assert_equals "$empty_array" ''

assert_equals $array[1] 'a'
assert_equals $array[2] 'b'
assert_equals $array[3] 'c'

assert_equals $array[-1] 'c'
assert_equals $array[-2] 'b'
assert_equals $array[-3] 'a'

# slice

tmp="$array[2,3]"
assert_equals $tmp 'b c'
tmp="$array[2,-1]"
assert_equals $tmp 'b c'

# length

assert_equals $#array '3'

# shift/unshift/push/pop

array=(a b c)
array=(head $array)
assert_equals "$array" 'head a b c'

array=(a b c)
array=($array tail)
assert_equals "$array" 'a b c tail'

array=(a b c)
array+=(head)
assert_equals "$array" 'a b c head'

array=(a b c)
shift array
assert_equals "$array" 'b c'

array=(a b c)
array=($array[2,-1])
assert_equals "$array" 'b c'

array=(a b c)
array=($array[1,-2])
assert_equals "$array" 'a b'

array=(a 'b' 'c and d' "e and f")
assert_equals "$array[1]" 'a'
assert_equals "$array[2]" 'b'
assert_equals "$array[3]" 'c and d'
assert_equals "$array[4]" 'e and f'

# match

array=(eve even evening morning night)
tmp=${(M)array:#eve*};  assert_equals "$tmp" 'eve even evening'
tmp=${(M)array:#even*}; assert_equals "$tmp" 'even evening'
tmp=${(M)array:#even*}; assert_equals "$tmp" 'even evening'
tmp=${array:#eve*};     assert_equals "$tmp" 'morning night'
tmp=${array:#even*};    assert_equals "$tmp" 'eve morning night'

# search
tmp=${array[(r)eve*]};    assert_equals $tmp 'eve'
tmp=${array[(r)even*]};   assert_equals $tmp 'even'
tmp=${array[(i)even*]};   assert_equals $tmp '2'
tmp=${array[(i)nothing]}; assert_equals $tmp '6' # (6 == array.length + 1)

# search (reverse)
tmp=${array[(R)even*]};   assert_equals $tmp 'evening'
tmp=${array[(I)even*]};   assert_equals $tmp '3'
tmp=${array[(I)nothing]}; assert_equals $tmp '0'

# ${array[(I)condition]}で要素がなければ0なので
# if (( ${array[(I)even]} )); then
#   echo 'found'
# else
#   echo 'not found'
# fi
tmp=${array[(I)even]}; assert_equals $tmp 2
tmp=${array[(I)nothing]}; assert_equals $tmp 0

# 要素の変更
# '#pattern' => 先頭からパターンまでの部分にマッチ
# '%pattern' => 末尾からパターンまでの部分にマッチ
# (M) => マッチした部分だけを残す
# (R) (m) => マッチしなかった部分だけを残す

arr5=("aaa,111" "bbb,222" "ccc,333")

tmp=${(M)arr5#*,}; assert_equals $tmp 'aaa, bbb, ccc,'
tmp=${(M)arr5%,*}; assert_equals $tmp ',111 ,222 ,333'

tmp=${(R)arr5#*,}; assert_equals $tmp '111 222 333'
tmp=${(R)arr5%,*}; assert_equals $tmp 'aaa bbb ccc'
tmp=${(m)arr5#*,}; assert_equals $tmp '111 222 333'
tmp=${(m)arr5%,*}; assert_equals $tmp 'aaa bbb ccc'

assert_end
