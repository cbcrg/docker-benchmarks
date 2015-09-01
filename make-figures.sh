#!/bin/bash
set -e 
set -o
(cd nmdp-flow && make)
(cd piper-nf && make)
(cd rnaseq-toy && make)

echo 'DONE'
echo ''
echo "Table 1 data is provided by these files:"
echo "- rnaseq-toy/table.txt"
echo "- nmdp-flow/table.txt"
echo "- piper-nf/table.txt" 

echo ""
echo "Figures are the following files:" 
echo "- Fig 1: rnaseq-toy/fig_correlation.png"
echo "- Fig 2: nmdp-flow/fig_correlation.png" 
echo "- Fig 3: piper-nf/fig_correlation.png"
echo ''
