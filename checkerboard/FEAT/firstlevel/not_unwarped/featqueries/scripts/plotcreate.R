

library(ggplot2)

### simple ggplot of the subject data over time

ggplot(psdata, aes(x = time*2.208, y = data, col = drug)) +
  theme_classic(base_size = 40) +
  theme(legend.key = element_rect(), legend.title=element_text(size=25), legend.text=element_text(size=20)) +
  scale_color_manual(values = c("#D55E00", "#0072B2")) +
  geom_point(size = 2) +
  geom_label(data = psdata[which.max(psdata$data),], aes(label = subject), size = 10, show.legend = FALSE) +
  geom_label(data = psdata[which.min(psdata$data),], aes(label = subject), size = 10, show.legend = FALSE) +
  labs(title = "Left V1", x = "Time (seconds)", y = "raw signal data") 


### ggplots of data demeaned using each subjects data from ca. the first second as a mean for that subject.

ggplot(psdata, aes(x=time*2.208, y=datanobase, col=drug)) + 
  theme_classic(base_size = 40) +
  theme(legend.key = element_rect(), legend.title=element_text(size=25), legend.text=element_text(size=20)) +
  geom_smooth(size = 2) +
  scale_color_manual(values = c("#D55E00", "#0072B2")) +
  labs(title = "Left V1 Mean signal change", x = "Time (seconds)", y = "demeaned signal")



ggplot(psdata, aes(x=time*2.208, y=datanobase, col=drug)) + 
  theme_classic(base_size = 40) +
  theme(legend.key = element_rect(), legend.title=element_text(size=25), legend.text=element_text(size=20)) +
  geom_point() +
  geom_smooth(size = 2) +
  scale_color_manual(values = c("#D55E00", "#0072B2")) +
  labs(title = "Mean signal change", x = "Time (seconds)", y = "demeaned signal data")

###

