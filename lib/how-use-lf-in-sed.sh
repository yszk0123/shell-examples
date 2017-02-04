#!/bin/bash -e
# cf. [sedコマンドで文字列を改行に置換する、しかもスマートに置換する。](http://qiita.com/richmikan@github/items/3c74212b0d8dec9bd00f)
TARGET="$1"
[ -z "$TARGET" ] && echo TARGET required && exit 1

LF=$(printf '\\\012_')
LF=${LF%_}
sed -e "s/, /$LF/" -i "" "$TARGET"
