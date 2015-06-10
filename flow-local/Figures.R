native <- read.delim("time_native.txt", header=TRUE)
docker <- read.delim("time_docker.txt", header=TRUE)

n_elapsed <- native$delta / 1000 / 60 
d_elapsed <- docker$delta / 1000 / 60 

png(filename = "fig_wall_time.png")
boxplot(n_elapsed, d_elapsed, names = c("native","docker"))
title("Execution wall-clock time")
dev.off()

n_cputime <- native$realtime / 1000 / 60 
d_cputime <- docker$realtime / 1000 / 60 

png(filename = "fig_run_time.png")
boxplot(n_cputime, d_cputime, names = c("native","docker"))
title("Execution total run time")
dev.off()


library(scales)
library(reshape)
library(ggplot2)
library(grid)

NF_stats<-read.csv("plot.csv",header=T)

NF_stats$realtime_docker_log10 = log10((NF_stats$realtime_docker/1000)/60)
NF_stats$realtime_native_log10 = log10((NF_stats$realtime_native/1000)/60)

max_axis = max(c(NF_stats$realtime_docker_log10, NF_stats$realtime_native_log10)) * 1.08
min_axis = min(c(NF_stats$realtime_docker_log10, NF_stats$realtime_native_log10)) * 1.01

lbreaks = log10(c(1,10,100,1000))
llabels = c(1,10,100,1000)
png(filename = "fig_correlation.png", width = 5, height = 4, units = 'in', res = 300)
qplot(x=realtime_docker_log10, y=realtime_native_log10, data=NF_stats, main="", color=name, ylab="Native tasks avg. time (mins)", xlab="Docker tasks avg. time (mins)") + 
 geom_point(size = 3) + 
 geom_abline(intercept = 0, size=.2) + 
 scale_x_continuous(limits = c(min_axis,max_axis), breaks = lbreaks, labels = llabels) +
 scale_y_continuous(limits = c(min_axis,max_axis), breaks = lbreaks, labels = llabels) +
 labs(color = "Task", title='Variant-calling') + 
 theme(axis.text.x=element_text(size=10), axis.text.y=element_text(size=10), axis.title.y=element_text(size=8), axis.title.x=element_text(size=8),legend.text=element_text(size=8),legend.title=element_text(size=8)) 

dev.off()


