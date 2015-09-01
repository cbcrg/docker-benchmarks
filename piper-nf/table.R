native <- read.delim("time_native.txt", header=TRUE)
docker <- read.delim("time_docker.txt", header=TRUE)

stderr <- function(x) sd(x)/sqrt(length(x))

native_mean_exec_time = mean(native$duration) / 1000 /60
docker_mean_exec_time = mean(docker$duration) / 1000 /60

native_err = stderr(native$duration) / 1000 /60
docker_err = stderr(docker$duration) / 1000 /60

native_stdev_exec_time = sd(native$duration) / 1000 /60
docker_stddev_exec_time = sd(docker$duration) / 1000 /60

# each instance executes 98 instances
native_mean_task_time = native_mean_exec_time / 98
docker_mean_task_time = docker_mean_exec_time / 98

cat(sprintf("PIPER           : native  docker\n"))
cat(sprintf("Task mean time  : %.1f  %.1f\n", native_mean_task_time, docker_mean_task_time))
cat(sprintf("Mean exec time  : %.1f (±%.1f) %.1f (±%.1f) \n", native_mean_exec_time, native_err, docker_mean_exec_time, docker_err))
cat(sprintf("Stddev exec time: %.1f  %.1f\n", native_stdev_exec_time, docker_stddev_exec_time))
cat(sprintf("Slow-down       : %.3f\n" , docker_mean_exec_time/native_mean_exec_time))
