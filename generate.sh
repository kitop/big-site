#! /bin/bash

mkdir site

for n in {1..100}; do
  dd if=/dev/urandom of=site/$( printf %03d "$n" ).html bs=1 count=$(( RANDOM + 1024 ))
done
