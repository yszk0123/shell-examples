# cf. [シェル変数のデフォルト値を設定する、未初期化時にエラーメッセージを出力してスクリプトを強制終了する - 百日半狂乱](http://doi-t.hatenablog.com/entry/2013/12/08/161929)

v1=10
echo "${v1:-100}"
echo "${v2:-200}"
echo "${v3:=300}"
echo "$v1"
echo "$v2"
echo "$v3"
