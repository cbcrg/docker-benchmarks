library(reshape)
library(ggplot2)
library(grid)
NF_stats<-read.csv("plot.csv",header=T)
NF_stats = cbind(NF_stats, shape=rep("16",dim(NF_stats)[1]))

nL = dim(read.table("stats_docker.txt", skip=1, header=F))[1]

NF_median =  data.frame(list( name = c("median"), realtime_docker = read.table("stats_docker.txt", skip=nL, header=F)[,2], realtime_native = read.table("stats_native.txt", skip=nL, header=F)[,2], shape = c("6")))
NF_mean =  data.frame(list( name = c("mean"), realtime_docker = read.table("stats_docker.txt", skip=nL, header=F)[,3], realtime_native = read.table("stats_native.txt", skip=nL, header=F)[,3], shape = c("8")))

png(filename = "fig_correlation.png", width = 5, height = 4, units = 'in', res = 300)
max_axis = max(c(NF_stats[,2], NF_stats[,3]))/1000/60 * 1.08
qplot(x=(realtime_docker/1000)/60, y=(realtime_native/1000)/60, data=NF_stats, main="", color=name, ylab="Native tasks avg. time (mins)", xlab="Docker tasks avg. time (mins)") + 
    geom_point(size = 3, aes(shape = shape)) +
    geom_point( data = NF_median, aes(x=(realtime_docker/1000)/60, y=(realtime_native/1000)/60, shape = shape, color = NA), size = 3) +
    geom_point( data = NF_mean, aes(x=(realtime_docker/1000)/60, y=(realtime_native/1000)/60, shape = shape, color = NA), size = 3) +
    coord_cartesian(xlim=c(0,max_axis), ylim=c(0,max_axis)) +
    scale_shape_manual(values = c(16, 6, 8), breaks = c("6","8"), labels = c("median","mean")) +
    geom_abline(intercept = 0, size=.2)+
    theme(axis.text.x=element_text(size=10), axis.text.y=element_text(size=10), axis.title.y=element_text(size=8), axis.title.x=element_text(size=8),legend.text=element_text(size=8),legend.title=element_text(size=8)) +
    labs(color = "Task", title='RNA-Seq', shape = "")
dev.off()
