s1='a b c'
s2='d e f'
for v in $s1 $s2; do
  echo "v = $v"
done

for v in "$s1" "$s2"; do
  echo "v = $v"
done
