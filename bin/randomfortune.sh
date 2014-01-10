#!/bin/bash

while true
do
  str=$(fortune)
  numlines=$(echo "$str" | wc -l)
  while (( $numlines > 2 ))
  do
    str=$(fortune)
    numlines=$(echo "$str" | wc -l)
  done
  sleep 300
  twmnc -c "$str"
done
