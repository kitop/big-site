#! /bin/bash

mkdir -p site

for n in {1..1500}; do
  prefix=""
  if [ $((RANDOM % 2)) -eq 0 ]; then
    s=$((RANDOM % 10 + 1))
    prefix=$(echo $RANDOM$RANDOM | sed "s/\\([0-9]\\{0,$s\\}\\)/\\1\\//g")
    mkdir -p site/${prefix}
  fi
  if [ $(($n % 100)) -eq 0 ]; then
    echo "$n pages generated"
  fi
  dd if=/dev/urandom of=site/${prefix}$( printf %03d "$n" ).txt bs=1 count=$(( (RANDOM + 1024) / 4)) > /dev/null 2> /dev/null
done
