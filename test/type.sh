#!/bin/zsh
# cf. [zsh の配列操作の基本から応用まで - Qiita](http://qiita.com/mollifier/items/f897b3fddd2d10369333)

scalar='a'
echo ${(t)scalar} #=> scalar

typeset -a array
echo ${(t)array} #=> array

typeset -A map
echo ${(t)map} #=> association
