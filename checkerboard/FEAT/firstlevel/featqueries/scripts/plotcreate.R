

library(ggplot2)
library(gridExtra)

### simple ggplot of the subject data over time

assign(paste(ROI,side,"_raw", sep = ""),
ggplot(psdata, aes(x = time*2.208, y = data, col = drug)) +
  theme_classic(base_size = 10) +
  theme(legend.key = element_rect(), legend.title=element_text(size=12), legend.text=element_text(size=10)) +
  scale_color_manual(values = c("#D55E00", "#009E73")) +
  geom_point(size = 2) +
  geom_label(data = psdata[which.max(psdata$data),], aes(label = paste(subject,"-",session)), size = 4, show.legend = FALSE) +
  geom_label(data = psdata[which.min(psdata$data),], aes(label = paste(subject,"-",session)), size = 4, show.legend = FALSE) +
  labs(title = paste(side,ROI), x = "Time (seconds)", y = "signal data") 
)

### simple ggplot of the subject demeaned data over time


# ggplot(psdata, aes(x = time*2.208, y = datanobase, col = drug)) +
#   theme_classic(base_size = 25) +
#   theme(legend.key = element_rect(), legend.title=element_text(size=25), legend.text=element_text(size=20)) +
#   scale_color_manual(values = c("#D55E00", "#0072B2")) +
#   geom_point(size = 2) +
#   geom_label(data = psdata[which.max(psdata$datanobase),], aes(label = paste(subject,"-",session)), size = 10, show.legend = FALSE) +
#   geom_label(data = psdata[which.min(psdata$datanobase),], aes(label = paste(subject,"-",session)), size = 10, show.legend = FALSE) +
#   labs(title = paste(side,ROI), x = "Time (seconds)", y = "demeaned signal data") 

### ggplots of data demeaned using each subjects data from ca. the first second as a mean for that subject.

assign(paste(ROI,side,"_gam", sep = ""),
       ggplot(psdata, aes(x=time*2.208, y=datanobase, col=drug)) + 
         theme_classic(base_size = 10) +
         theme(legend.key = element_rect(), legend.title=element_text(size=12), legend.text=element_text(size=10)) +
         geom_smooth(size = 0.5) +
         scale_color_manual(values = c("#D55E00", "#009E73")) +
         labs(title = paste(ROI), x = "Drug", y = "% signal change")
       )

# assign(paste(ROI,side,"_gam", sep = ""),
# ggplot(psdata, aes(x=time*2.208, y=datanobase, col=drug)) + 
#   theme_classic(base_size = 10) +
#   theme(legend.key = element_rect(), legend.title=element_text(size=12), legend.text=element_text(size=10)) +
#   geom_smooth(size = 2) +
#   scale_color_manual(values = c("#D55E00", "#0072B2")) +
#   labs(title = paste(side,ROI,"Mean signal change"), x = "Time (seconds)", y = "demeaned signal")
# )

# ggplot(psdata, aes(x=time*2.208, y=datanobase, col=drug)) +
#   theme_classic(base_size = 40) +
#   theme(legend.key = element_rect(), legend.title=element_text(size=25), legend.text=element_text(size=20)) +
#   geom_point() +
#   geom_smooth(size = 2) +
#   scale_color_manual(values = c("#D55E00", "#0072B2")) +
#   labs(title = "Mean signal change", x = "Time (seconds)", y = "demeaned signal data")

###

