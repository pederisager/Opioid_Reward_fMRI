### ggplots of data demeaned using each subjects data from ca. the first second as a mean for that subject.

ggplot(psdata, aes(x=time*2.208, y=datanobase, col=drug)) + 
  geom_smooth() +
  labs(title = "Mean signal change", x = "Time (seconds)", y = "demeaned signal data")

ggplot(psdata, aes(x=time*2.208, y=datanobase, col=drug)) + 
  geom_point() +
  labs(title = "Mean signal change", x = "Time (seconds)", y = "demeaned signal data")

###





### ggplots with demeaned data based on within-drug mean. Tom comments: may be innapropriate.

# mormean <- aggregate(psdata$data[psdata$drug=="mor"], list(psdata$time[psdata$drug=="mor"]), mean)
# plamean <- aggregate(psdata$data[psdata$drug=="pla"], list(psdata$time[psdata$drug=="pla"]), mean)
# mormean$drug <- "mor"
# plamean$drug <- "pla"
# sigm <- rbind(plamean, mormean) #generate signal means
# names(sigm) <- c("time", "data", "drug") #rename sigm variable names
# 
# mmv = mean(sigm$data[sigm$drug=="mor"])
# mpv = mean(sigm$data[sigm$drug=="pla"])
# 
# mordm <- sigm$data[sigm$drug=="mor"] - mmv
# pladm <- sigm$data[sigm$drug=="pla"] - mpv
# datadm <- c(mordm, pladm)
# sigm$datadm <- datadm
# 
# ggplot(sigm, aes(x=time, y=datadm, col=drug)) +
#   geom_smooth(level=0.95) +
#   geom_point() +
#   labs(title = "Mean signal change", x = "Time (TRs)", y = "demeaned signal data")
# 
# # ggplot(sigm, aes(x=time, y=datadm, col=drug)) +
#   geom_smooth(level=0.95) +
#   labs(title = "Mean signal change", x = "Time (TRs)", y = "demeaned signal data")

###

