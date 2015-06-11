#!/bin/bash -ue

log() {
    echo "=== ${1}" >&2
}

unset NXF_WORK
export NXF_VER=0.14.0-SNAPSHOT
export NXF_DEBUG=3
nextflow info

for i in {21..30}; do
    log "Submitting run ${i}..."
    for run in docker native; do
    (mkdir -p ${run}_${i} && cd ${run}_${i} && nextflow -c ../${run}.config run ../piper-nf > log_${run}_${i}; rm -rf db work || true)
    sleep 10s
    done
done
