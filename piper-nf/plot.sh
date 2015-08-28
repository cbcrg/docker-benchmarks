#!/bin/bash

function stats() {
    STAGES=$(tail -n +2  $1 | cut -f 4 | cut -f 1 -d ' ' | sort | uniq)
    for x in $STAGES; do 
      row=$(cat $1 | grep $x | sed 's/-/0/g' | datamash median 19 mean 19 median 20 mean 20 count 1)
      printf "$x\t$row\n"
    done
}

for file in ${1}_{1..10}/trace.csv;do 
  stats $file
done  
