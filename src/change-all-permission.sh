#!/bin/sh
# cf. [Bash - ファイルやディレクトリのパーミッションを一括で置換したい - Qiita](http://qiita.com/takeshi81/items/48ea62eae2fc7f1cb2f0)

TARGET_PATH=~/foo/bar

# change directories and files recursively
find $TARGET_PATH -type d -exec chmod 755 {} +
find $TARGET_PATH -type f -exec chmod 644 {} +

# one-liner
find . \( -type f -exec chmod 0644 {} + \) -or \( -type d -exec chmod 0755 {} + \)

# simpler
chmod -R a=rX,u+w $TARGET_PATH
