#
# The main files produced by this script are: 
# - table.txt: the stats included in "Table 1" in the manuscript. 
# - fig_correlation.png: the figure included in the manuscript.
# 
all: stats_native.txt stats_docker.txt table.txt fig_correlation.png

# 
# Collects the pipeline start/stop timestamp and aggregates tasks duration time
# for each "native" execution.  
#   
# in : 
# 	native_{1..10}/.nextflow.log
# 	native_{1..10}/trace.csv
#
# out: 
#	time_native.txt
#
time_native.txt:
	bash ../scripts/time.sh native > time_native.txt


# 
# Collects the pipeline start/stop timestamp and aggregates tasks duration time
# for each "docker" execution.  
#   
# in : 
# 	docker_{1..10}/.nextflow.log
# 	docker_{1..10}/trace.csv
#
# out: 
#	time_docker.txt
#
time_docker.txt:
	bash ../scripts/time.sh docker > time_docker.txt
	
#
# Collects the trace runtime info for each "native" execution into a single file,
# rows are sorted by task name (column 4)
#	
# in : 
#	native_{1..10}/trace.csv
#
# out: 
#	trace_native.txt
#
trace_native.txt:
	cat native_{1..10}/trace.csv | grep -v 'task_id' | sort -k4 > trace_native.txt
	
#
# Collects the trace runtime info for each "docker" execution into a single file,
# rows are sorted by task name (column 4)
#	
# in : 
#	docker_{1..10}/trace.csv
#
# out: 
#	trace_docker.txt
#
trace_docker.txt:
	cat docker_{1..10}/trace.csv | grep -v 'task_id' | sort -k4 > trace_docker.txt
	
#
# Calculates the median duration time grouping for tasks of the same type for each execution,
# both for "native" and "docker" executions. 
# 
# Then collects all of them into a tab-separated file, where each line contains 
# three fields: task name; native median task execution time; docker median execution time 
# 
# Task duration time is defined as real wall-clock time from task submission to completion, 
# *including* container instantiation time when docker is used.
# 
# in :
#	native_{1..10}/trace.csv
#	docker_{1..10}/trace.csv	
# 
# out: 
#  	plot.csv
#	
plot.csv: 
	./plot.sh docker | sort > plot_docker.txt
	./plot.sh native | sort > plot_native.txt
	groovy ../scripts/join.groovy > plot.csv
	
#
# Create the figure showing the correlation of "native" tasks execution time
# vs "docker" tasks executinon time
# 
# in :
# 	plot.csv 
#	stats_native.txt 
#	stats_docker.txt
#
# out:   
#  	fig_correlation.png
# 	
fig_correlation.png: plot.csv stats_native.txt stats_docker.txt 
	Rscript Figures.R
	
#
# Aggregate median and mean execution time for tasks of the same type across all pipeline 
# runs for the "native" benchmark.  
# 
# in : 
# 	trace_native.txt
#
# out: 
#	stats_native.txt
# 	
stats_native.txt:
	bash stage.sh native > stats_native.txt
	
#
# Aggregate median and mean execution time for tasks of the same type across all pipeline 
# runs for the "docker" benchmark.  
# 
# in : 
# 	trace_docker.txt
# out: 
#	stats_docker.txt
# 		
stats_docker.txt:
	bash stage.sh docker > stats_docker.txt

#
# Produces the main stats included in "Table 1": 
# 	- median pipeline duration time 
#	- standard deviation of pipeline duration time 
# 	- median task duration time
# 
# Where duration time is defined as the wall-clock execution time, *including* the 
# container instantiation time when Docker is used.
# 
# in : 
# 	time_native.txt
# 	time_docker.txt
# 
# out: 
#	stats_docker.txt
# 
table.txt: time_native.txt time_docker.txt
	Rscript table.R > table.txt
		
#
# Clean-up task
#		
clean:
	rm -rf stats_* time_*.txt *.png plot.csv table.txt
