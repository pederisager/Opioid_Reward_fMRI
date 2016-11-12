### ggplots of data demeaned using each subjects data from ca. the first second as a mean for that subject.

ggplot(psdata, aes(x=time*2.208, y=datanobase, col=drug)) + 
  geom_smooth() +
  labs(title = "Mean signal change", x = "Time (seconds)", y = "demeaned signal data")

ggplot(psdata, aes(x=time*2.208, y=datanobase, col=drug)) + 
  geom_point() +
  labs(title = "Mean signal change", x = "Time (seconds)", y = "demeaned signal data")

###



