#!/bin/zsh
. $(dirname ${BASH_SOURCE:-$0})/helpers/assert.sh

# and
tmp=0; [ 1 -a 2 ] && tmp=1; assert_ok $tmp

# or
tmp=0; [ 0 -o 1 ] && tmp=1; assert_ok $tmp

tmp=0; [ -z "" ] && tmp=1; assert_ok $tmp
tmp=0; [ -n "a" ] && tmp=1; assert_ok $tmp

# 文字列用の比較演算子
str_a="x"
str_b="y"
assert_ok $(( str_a = str_a ))
assert_ok $(( str_a != str_b ))

# 整数用の比較演算子
num_a=1
num_b=2
assert_ok $(( num_a -eq num_b ))
assert_ok $(( num_a -ne num_b ))
assert_ok $(( num_a -lt num_b ))
assert_ok $(( num_b -gt num_a ))
assert_ok $(( num_a -le num_a ))
assert_ok $(( num_a -le num_b ))
assert_ok $(( num_a -ge num_a ))
assert_ok $(( num_b -ge num_a ))

pushd $(dirname ${BASH_SOURCE:-$0})
assert_ok $(( -d tmp/dir )) # directory
assert_ok $(( -f tmp/empty.txt )) # file
assert_ok $(( -s tmp/non-empty.txt )) # size
assert_ok $(( -e tmp/empty.txt )) # exist
assert_ok $(( -e tmp/non-empty.txt ))
assert_ok $(( -r tmp/a.txt )) # readable
assert_ok $(( -w tmp/a.txt )) # writable
assert_ok $(( -x tmp/a.sh )) # executable
assert_ok $(( -o tmp/a.txt )) # owned
assert_ok $(( -L tmp/symbolic-link.txt )) # Link
assert_ok $(( tmp/newer-file.txt -nt tmp/older-file.txt )) # newer than
assert_ok $(( tmp/older-file.txt -ot tmp/newer-file.txt )) # older than
popd

a_path='/foo/bar/baz/a.txt'
assert_equals ${a_path:h} '/foo/bar/baz' # head
assert_equals ${a_path:t} 'a.txt' # tail
assert_equals ${a_path:r} '/foo/bar/baz/a' # root
assert_equals ${a_path:e} '.txt' # extension
assert_equals ${a_path:a} '/foo/bar/baz/a.txt' # all

# ${a:=1}
# ${a:-1}
# ${a:+1}
# ${a:?message}

assert_end

