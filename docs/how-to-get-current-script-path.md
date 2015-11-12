# cf. [bash/zshでsourceされたスクリプト内で、ファイル自身の絶対パスをとるシンプルな記法 - Qiita](http://qiita.com/yudoufu/items/48cb6fb71e5b498b2532)

```shell
# 通常呼び出し○
# bashのsource呼び出し×
# zshのsource呼び出し○
script_dir=$(cd $(dirname $0); pwd)
```

```shell
script_dir=$(cd $(dirname ${BASH_SOURCE:-$0}); pwd)
```
