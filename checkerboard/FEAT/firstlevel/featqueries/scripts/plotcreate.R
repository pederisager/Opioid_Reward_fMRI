

library(ggplot2)

### simple ggplot of the subject data over time

ggplot(psdata, aes(x = time, y = data, col = subject)) +
  geom_point()


### ggplots of data demeaned using each subjects data from ca. the first second as a mean for that subject.

ggplot(psdata, aes(x=time*2.208, y=datanobase, col=drug)) + 
  geom_smooth() +
  scale_color_manual(values = c("#D55E00", "#0072B2")) +
  labs(title = "Mean signal change", x = "Time (seconds)", y = "demeaned signal data")

ggplot(psdata, aes(x=time*2.208, y=datanobase, col=drug)) + 
  geom_point() +
  scale_color_manual(values = c("#D55E00", "#0072B2")) +
  labs(title = "Mean signal change", x = "Time (seconds)", y = "demeaned signal data")

###

