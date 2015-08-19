#!/bin/zsh
# cf. [zsh の配列操作の基本から応用まで - Qiita](http://qiita.com/mollifier/items/f897b3fddd2d10369333)

lines=( ${(@f)"$(< tmp/lines.txt)"} )
echo $lines
echo ${lines:#bar*}
