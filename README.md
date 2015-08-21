Docker benchmarks 
===================

This repository contains the benchmarks for these pipelines: 

* [Rnaseq-toy](https://github.com/nextflow-io/rnatoy/)
* [Nmdp-flow](https://github.com/nextflow-io/nmdp-flow/)
* [Piper-nf](https://github.com/cbcrg/piper-nf/)

Quick start 
------------

To reproduce the figures from raw data clone this repository:

	https://github.com/cbcrg/docker-benchmarks.git

Then pull the required Docker image: 

	docker pull cbcrg/make-peerj5515
	
Finally launch the `make` script using the following command: 

	docker run -v $PWD:$PWD -w $PWD cbcrg/make-peerj5515 bash make-figures.sh
	
(if you don't want or cannot use Docker, it will be required to download and install 
the required dependencies: R, Datamash, Make and Groovy. See the included 
[Dockefile](https://raw.githubusercontent.com/cbcrg/docker-benchmarks/master/Dockerfile) for configuration details).


Structure of the repository  
----------------------------

Benchmarks scripts and data are organised in separated folder depending the pipeline executed: 

* [Rnaseq-toy](rnaseq-toy)
* [nmdp-flow](nmdp-flow)
* [piper-nf](piper-nf)

Each of these folders contains a `Makefile` and other scripts used by it to generate the figures. 
Raw data of each executions are the files `docker_{1..10}/trace.csv` and `native_{1..10}/trace.csv` in the same folder. 

The main files produced by the `make` process are: 

* `table.txt`: the numbers included in the *Table 1*
* `fig_correlation.png`: the figure in included in the manuscript.

See the respective `Makefile`s for more details.


Replicate benchmarks 
----------------------

Pipeline executions can be replicated following the instructions 
in the respective repositories, shown below:

* [nmdp-flow](https://github.com/nextflow-io/nmdp-flow/tree/peerj5515/)
* [piper-nf](https://github.com/cbcrg/piper-nf/tree/peerj5515)
* [rnaseq-toy](https://github.com/nextflow-io/rnatoy/tree/peerj5515)

