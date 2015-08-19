name=hoge

"$name"() {
  unset -f $hoge
  echo 'Loading $hoge...'
  $name "$@"
}

hoge
