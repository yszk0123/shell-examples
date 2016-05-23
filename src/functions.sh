# cf. [Makefile - 関数](http://www.booran.com/menu/makefile/func.html)

filter関数
fileter関数は、文字列を空白で区切られた単語の列とみなし、パターンにあったものを返す。%文字は、任意の文字としてパターンに使用できる。
(書式) $(fileter pattern, text)
patern 探すパターン
text 検索対象文字列

filter関数の例
text := abc def ghi jkl
test :
        @echo $(filter a%c, $(text))


filter-out関数
fileter関数と逆の働きをする。すなわち、マッチしない単語を返す。
(書式) $(fileter-out pattern, text)
patern 探すパターン(マッチしたものを返さない)
text 検索対象文字列

filter-out関数の例
text := abc def ghi jkl
test :
        @echo $(filter-out mno, $(text))


findstring関数
対象文字列を検索し、マッチしたらパターンを返す。findstring関数では、ワイルドカード(%)は使えない
(書式) $(findstring pattern, text)
patern 探すパターン
text 検索対象文字列

findstring関数の例
text := abc def ghi jkl
test :
        @echo $(findstring ab, $(text))


subst関数
subst関数は、検索と置換を行なう。また、ワイルドカードは使えない。
(書式) $(subst search-str, rep_str, target)
search-str 検索文字列
rep-str 置換文字列
target 置換対象文字列

findstring関数の例
text := test1.c test2.c test3.c
test :
        @echo $(subst .c,.o $(text))
        #置換文字列の前のカンマの後に空白を入れると、「 .o」で置換される


patsubst関数
substと違いワイルドカードが指定できる関数。検索文字列にワイルドカードを使って、ワイルドカードにマッチした部分を置換文字列に使う事ができる。
(書式) $(patsubst search-str, rep_str, target)
search-str 検索文字列
rep-str 置換文字列
target 置換対象文字列

patsubst関数の例
text := /home/usr/
test :
        @echo $(pstsubst %/,% $(text))         #最後の"/"だけ取り除かれる


words関数
引数にとった単語の数を返す
(書式) $(words text)
text 文字列(スペースで区切られたもの)

words関数の例
text := abc def ghi jkm
test :
        @echo $(words $(text))


word関数
引数にとったn番目の単語の数を返す。最初の単語を１番目として返すので、Cとかの配列とは違うので注意が必要。
(書式) $(word, n, text)
n 取りだしたい番号
text スペースで区切られている単語

word関数の例
text := abc def ghi jkm
test :
        @echo $(word 2, $(text))


firstword関数
先頭の単語を返す。$(word 1, text)と同義。
(書式) $(firstword, text)
text スペースで区切られている単語

firstword関数の例
text := abc def ghi jkm
test :
        @echo $(firstword $(text))


wordlist関数
指定した範囲の単語のリストを返す。
(書式) $(wordlist start, end, text)
start 取りだす開始位置(1が先頭)
end 取りだす終了位置
text スペースで区切られている単語
startが単語の総数より大きかった場合は何も返さない。また、endよりstartの方が大きい場合も何も返さない。endが単語の総数より大きかった場合は、startから最後までの単語の総数を返す。

wordlist関数の例
text := abc def ghi jkm
test :
        @echo $(wordlist 2, 3, $(text))


sort関数
引数で与えられたリストの重複を取り除き並びかえる。
(書式) $(sort text)
text スペースで区切られている単語

wordlist関数の例
text := def ghi jkm abc
test :
        @echo $(sort $(text))


call関数
引数を展開し、その後の値で展開した値を置き換える。
(書式) $(call macro-name, [param...])
macro-name 展開するマクロ名
param 置き換える単語(文字列)
macro-name内に$1...$nが存在している時、後の引数で最初のマクロ内の$nを置き換える

call関数の例
define call-test
        @echo "paramter test $1"
endif
default:
        $(call call-test, dayo)
        #call-testが展開され、$1がdayoに置き換わり、表示される


shell関数
引数をひとつとり、サブシェルを実行する
(書式) $(shell cmd)
cmd コマンド

shell関数の例
TEST := $(shell ls -al)
all:
        @echo $(TEST)


wildcard関数
パターンのリストを受け取り、展開する。パターンは複数あっても構わない。
(書式) $(wildcard pattern)
pattern ワイルドカード(*)使用可能な、パターン

wildcard関数の例
SRC_FILES := $(wildcard *.cpp *.h)


dir関数
引数の単語リストのディレクトリ部分を返す。
(書式) $(dir list)
list 複数の単語からなるリスト

dir関数の例
SRC_LIST := $(sort $(dir $(shell find . -name '*.cpp')))
#findコマンドでソースファイルを検索し、その文字列からディレクトリ名を取りだし、ソートする


notdir関数
引数のリストから、ファイル名だけを返す。
(書式) $(notdir list)
list 複数の単語からなるリスト

suffix関数
各引数からサフィックスのリストを作って返す
(書式) $(suffix list)
list サフィックスを取りだしたいリスト

basename関数
ファイル名からサフィックスを取り除いた部分を返す。パスはそのまま残る
(書式) $(basename name)
name 対象ファイル

addsuffix関数
ある単語のリストに対して指定したサフィックスを付加する
(書式) $(addsuffix suffix, name)
suffix 付加したサフィックス
name 付加するリスト
