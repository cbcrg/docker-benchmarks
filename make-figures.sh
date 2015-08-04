#!/bin/bash
set -e 
set -o
(cd nmdp-flow && make)
(cd piper-nf && make)
(cd rnaseq-toy && make)

