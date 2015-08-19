# cf. [for 文の使用方法 - UNIX & Linux コマンド・シェルスクリプト リファレンス](http://shellscript.sunone.me/for.html)

for name in foo bar baz 'hoge fuga' "a b"; do
  echo "name = $name"
done

for i in `seq 1 10`; do
  echo "i = $i"
done
