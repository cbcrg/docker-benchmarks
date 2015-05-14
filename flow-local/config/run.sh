#!/bin/bash -ue

log() {
    echo "=== ${1}" >&2
}

unset NXF_WORK
export NXF_VER=0.13.4
nextflow info

for i in {1..10}; do
    log "Submitting run ${i}..."
    for run in docker native; do
        (mkdir -p ${run}_${i} && cd ${run}_${i} && nextflow -c ../${run}.config run ../main.nf > log_${run}_${i})
        sleep 10s
    done
    sleep 10s 
done
