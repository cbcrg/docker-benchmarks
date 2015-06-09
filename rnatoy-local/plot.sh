function stats() {
    STAGES=$(tail -n +2  $1 | cut -f 4 | cut -f 1 -d ' ' | sort | uniq)
    for x in $STAGES; do 
      row=$(cat $1 | grep $x | sed 's/-/0/g' | datamash median 17 mean 17 median 18 mean 18 count 1)
      printf "$x\t$row\n"
    done
}

for file in ${1}_{1..10}/trace.csv;do 
  stats $file
done  