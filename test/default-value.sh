#!/bin/zsh
. $(dirname ${BASH_SOURCE:-$0})/helpers/assert.sh
# cf. [シェル変数のデフォルト値を設定する、未初期化時にエラーメッセージを出力してスクリプトを強制終了する - 百日半狂乱](http://doi-t.hatenablog.com/entry/2013/12/08/161929)

v1=10
assert_equals "${v1:-100}" 10
assert_equals "${v2:-200}" 200
assert_equals "${v3:=300}" 300
assert_equals "$v1" 10
assert_equals "$v2" ''
assert_equals "$v3" 300

assert_end
