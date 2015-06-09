all: figures stats_native.txt stats_docker.txt


time_native.txt:
	bash time.sh native > time_native.txt

time_docker.txt:
	bash time.sh docker > time_docker.txt
	
trace_native.txt:
	cat native_{1..10}/trace.csv | grep -v 'task_id' | sort -k4 > trace_native.txt
	
trace_docker.txt:
	cat docker_{1..10}/trace.csv | grep -v 'task_id' | sort -k4 > trace_docker.txt
	
plot.csv: 
	./plot.sh docker | sort > plot_docker.txt
	./plot.sh native | sort > plot_native.txt
	groovy join.groovy > plot.csv
	
figures: time_native.txt time_docker.txt plot.csv
	Rscript Figures.R
	
stats_native.txt:
	bash stage.sh native > stats_native.txt
	
stats_docker.txt:
	bash stage.sh docker > stats_docker.txt
		
clean:
	rm -rf stats_* time_*.txt *.png plot.csv
