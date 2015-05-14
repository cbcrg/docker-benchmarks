function stats() {
    STAGES=$(cat trace_${1}.txt | cut -f 4 | cut -f 1 -d ' ' | uniq | sort)
    for x in $STAGES; do 
      row=$(cat trace_${1}.txt | grep $x | sed 's/-/0/g' | datamash min 20 q1 20 median 20 q3 20 max 20 sstdev 20 mean 20)
      printf "$x\t$row\n"
    done
}

echo NATIVE
stats native

echo ''
echo DOCKER
stats docker 