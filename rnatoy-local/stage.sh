function stats() {
    STAGES=$(cat trace_${1}.txt | cut -f 4 | cut -f 1 -d ' ' | uniq | sort)
    for x in $STAGES; do 
      row=$(cat trace_${1}.txt | grep $x | sed 's/-/0/g' | datamash median 17 mean 17 median 18 mean 18)
      printf "$x\t$row\n"
    done
}

stats $1
