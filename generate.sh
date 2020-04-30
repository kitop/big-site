#! /bin/bash

mkdir -p site

if [ -z "$NUM_FILES" ]; then
  echo "No NUM_FILES set, using default of 500"
  NUM_FILES=500
fi

if [ -z "$FILE_SIZE" ]; then
  echo "No FILE_SIZE set, using default of 1024"
  FILE_SIZE=1024
fi

for n in $(seq ${NUM_FILES}); do
  prefix=""
  if [ $((RANDOM % 2)) -eq 0 ]; then
    s=$((RANDOM % 10 + 1))
    prefix=$(echo $RANDOM$RANDOM | sed "s/\\([0-9]\\{0,$s\\}\\)/\\1\\//g")
    mkdir -p site/${prefix}
  fi
  if [ $(($n % 100)) -eq 0 ]; then
    echo "$n pages generated"
  fi
  dd if=/dev/urandom of=site/${prefix}$( printf %03d "$n" ).txt bs=1 count=${FILE_SIZE} > /dev/null 2> /dev/null
done
