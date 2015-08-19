#!/bin/zsh
# 連想配列
# cf. [zsh の配列操作の基本から応用まで - Qiita](http://qiita.com/mollifier/items/f897b3fddd2d10369333)

typeset -A map
echo ${(t)map} #=> association

map=(a 10 b 20)
echo $map #=> 10 20
echo $map[a] #=> 10
echo ${(k)map} #=> a b
echo ${(v)map} #=> 10 20
