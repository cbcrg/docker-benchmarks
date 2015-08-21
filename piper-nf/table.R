native <- read.delim("time_native.txt", header=TRUE)
docker <- read.delim("time_docker.txt", header=TRUE)

native_median_exec_time = median(native$duration) / 1000 /60
docker_median_exec_time = median(docker$duration) / 1000 /60

native_stdev_exec_time = sd(native$duration) / 1000 /60
docker_stddev_exec_time = sd(docker$duration) / 1000 /60


native_mean_task_time = native_median_exec_time / 98
docker_mean_task_time = docker_median_exec_time / 98

cat(sprintf("PIPER           : native  docker\n"))
cat(sprintf("Task mean time  : %.1f  %.1f\n", native_mean_task_time, docker_mean_task_time))
cat(sprintf("Median exec time: %.1f  %.1f\n", native_median_exec_time, docker_median_exec_time))
cat(sprintf("Stddev exec time: %.1f  %.1f\n", native_stdev_exec_time, docker_stddev_exec_time))
cat(sprintf("Slow-down       : %.3f\n" , docker_median_exec_time/native_median_exec_time))
