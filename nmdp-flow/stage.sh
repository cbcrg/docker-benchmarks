function stats() {
    STAGES=$(cat trace_${1}.txt | cut -f 4 | cut -f 1 -d ' ' | uniq | sort)
    for x in $STAGES; do 
      row=$(cat trace_${1}.txt | grep $x | sed 's/-/0/g' | datamash median 19 mean 19 median 20 mean 20 count 1)
      printf "$x\t$row\n"
    done

    row=$(cat trace_${1}.txt | sed 's/-/0/g' | datamash median 19 mean 19 median 20 mean 20 count 1)
    printf "ALL\t$row\n"

}

echo $1 | awk '{print toupper($0)}'
stats $1
