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



library(reshape)
library(ggplot2)
library(grid)
NF_stats<-read.csv("plot.csv",header=T)

png(filename = "fig_correlation.png", width = 5, height = 4, units = 'in', res = 300)
melt(NF_stats, measure.vars=c("realtime_docker", "realtime_native")) -> melted.NF_stats
max_axis = max(c(NF_stats[,2], NF_stats[,3]))/1000/60 * 1.08
qplot(x=(realtime_docker/1000)/60, y=(realtime_native/1000)/60, data=NF_stats, main="", color=name, ylab="Native tasks avg. time (mins)", xlab="Docker tasks avg. time (mins)") + 
 geom_point(size = 3) + coord_cartesian(xlim=c(0,max_axis), ylim=c(0,max_axis)) + 
 geom_abline(intercept = 0, size=.2)+ 
 theme(axis.text.x=element_text(size=10), axis.text.y=element_text(size=10), axis.title.y=element_text(size=8), axis.title.x=element_text(size=8),legend.text=element_text(size=8),legend.title=element_text(size=8)) + 
 labs(color = "Task", title='RNA-Seq')
dev.off()
