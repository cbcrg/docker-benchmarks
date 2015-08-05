Docker benchmarks 
===================

This repository contains the benchmarks for these pipelines: 

* [Piper-nf](https://github.com/cbcrg/piper-nf/tree/docker-benchmark)
* [RNA-Seq](https://github.com/nextflow-io/rnatoy/tree/docker-benchmark)
* [NMDP-Flow](https://github.com/nextflow-io/nmdp-flow/tree/docker-benchmark)

Quick start 
------------

To reproduce the figures from the raw data pull the following Docker container: 

	docker pull cbcrg/make-peerj5515
	
Then run the following command: 

	docker run -v $PWD:$PWD -w $PWD cbcrg/make-peerj5515 bash make-figures.sh
	
(if you do not or cannot use Docker, it will be required to download and install 
the required dependencies: R, Datamash, Make and Groovy. See the included 
[Dockefile](https://raw.githubusercontent.com/cbcrg/docker-benchmarks/master/Dockerfile) for configuration details).


Structure of the repository  
----------------------------

Benchmarks scripts and data are organised in separated folder depending the pipeline executed: 

* [nmdp-flow](nmdp-flow)
* [piper-nf](piper-nf)
* [rnaseq-toy](rnaseq-toy)

Each of these folders contains a `Makefile` and other scripts used by it to generate the figures. 
Raw data of each executions are the files `docker_{1..10}/trace.csv` and `native_{1..10}/trace.csv` in the same folder. 

The `make` process produce the following files: 

Name 				| Description 
--------------------|--------------
fig_correlation.png | The figure included in the publication 
time_native.txt		| 
time_docker.txt		| 
trace_native.txt	| 
trace_docker.txt	| 
stats_native.txt	| 
stats_docker.txt 	| 
plot_native.txt		| 
plot_docker.txt		| 



