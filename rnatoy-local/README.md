RNAToy stats 
================

This folder contains the log files for the RNAToy pipeline executions. 

To generate the figures use the `make` command. It creates the following 
assets: 

* `time_native.txt`: Summary table of times for `native` executions
* `time_docker.txt`: Summary table of times for `docker` executions
* `fig_wall_time.png`: Box plot of pipeline wall-clock execution time
* `fig_run_time.png`: Box plot of pipeline aggregate tasks run-time
* `fig_correlation.png`: Correlation between docker and native tasks time execution
    