cat docker_{1..10}/trace.csv | grep -v 'task_id' | sort -k4 > trace_docker.txt
cat native_{1..10}/trace.csv | grep -v 'task_id' | sort -k4 > trace_native.txt