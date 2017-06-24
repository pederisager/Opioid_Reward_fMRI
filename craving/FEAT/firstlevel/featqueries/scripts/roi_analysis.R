
## Attempt at ROI plot and analysis
library(psych)
library(nlme)
library(ggplot2)
library(extrafont)

# Summarize max within the mask
ROI = "value_frontal"
side = ""

dataset <- unique(fqstats_value_frontal[fqstats_value_frontal$image=="stats/pe1",])


dataset_summary <- describeBy(x = dataset$max, 
                group = dataset$drug, 
                mat = TRUE) 
names(dataset_summary)[2] <- "drug"

assign(paste(ROI,side,"_signalchange", sep = ""),
       ggplot(dataset_summary, aes(x = drug, y = mean, col = drug)) + 
         geom_errorbar(aes(ymin=mean-se, ymax=mean+se), width = .1, size=1, col = "black") + 
         geom_point(size=7) + 
         theme_bw(base_size = 20, base_family = "Calibri") +
         labs(title = "Value frontal", x = "Drug", y = "% change") + 
         scale_color_manual(values = c("#D55E00", "#009E73"))
)
assign(paste(ROI,side,"_ttest", sep = ""), t.test(max ~ drug, data = dataset, paired=TRUE, cond.level=0.95, na.action=na.exclude))

# t.test probably looks cleaner, but remember that the lme model below does exactly the same thing, and produces the same result
#summary(lme(max ~ drug, data = dataset, random = ~1|subject, method = "ML"))


tiff("value_striatum_left.tiff", height = 12, width = 17, units = 'cm', 
     compression = "lzw", res = 600)
plot(value_striatum_left_signalchange)
dev.off()

############### For each ROI

############### V1 left
# V1 left
ROI = "V1"
side = "left_thr50"

dataset <- unique(fqstats_V1left_thr50[fqstats_V1left_thr50$image=="stats/pe1",])


dataset_summary <- describeBy(x = dataset$max, 
                              group = dataset$drug, 
                              mat = TRUE) 
names(dataset_summary)[2] <- "drug"

assign(paste(ROI,side,"_signalchange", sep = ""),
       ggplot(dataset_summary, aes(x = drug, y = mean, col = drug)) + 
         geom_errorbar(aes(ymin=mean-se, ymax=mean+se), width = .1, size=1, col = "black") + 
         geom_point(size=7) + 
         theme_bw(base_size = 20, base_family = "Gill Sans MT") +
         labs(title = "V1 left", x = "Drug", y = "% change") + 
         scale_color_manual(values = c("#D55E00", "#0072B2"))
)

assign(paste(ROI,side,"_ttest", sep = ""), t.test(max ~ drug, data = dataset, paired=TRUE, cond.level=0.95, na.action=na.exclude))

# t.test probably looks cleaner, but remember that the lme model below does exactly the same thing, and produces the same result
#summary(lme(max ~ drug, data = dataset, random = ~1|subject, method = "ML"))


tiff("V1_left", height = 12, width = 17, units = 'cm', 
     compression = "lzw", res = 600)
plot(value_striatum_left_signalchange)
dev.off()





############### V1 right
ROI = "V1"
side = "right_thr50"

dataset <- unique(fqstats_V1right_thr50[fqstats_V1right_thr50$image=="stats/pe1",])


dataset_summary <- describeBy(x = dataset$max, 
                              group = dataset$drug, 
                              mat = TRUE) 
names(dataset_summary)[2] <- "drug"

assign(paste(ROI,side,"_signalchange", sep = ""),
       ggplot(dataset_summary, aes(x = drug, y = mean, col = drug)) + 
         geom_errorbar(aes(ymin=mean-se, ymax=mean+se), width = .1, size=1, col = "black") + 
         geom_point(size=7) + 
         theme_bw(base_size = 20, base_family = "Gill Sans MT") +
         labs(title = "V1 right", x = "Drug", y = "% change") + 
         scale_color_manual(values = c("#D55E00", "#0072B2"))
)

assign(paste(ROI,side,"_ttest", sep = ""), t.test(max ~ drug, data = dataset, paired=TRUE, cond.level=0.95, na.action=na.exclude))

# t.test probably looks cleaner, but remember that the lme model below does exactly the same thing, and produces the same result
#summary(lme(max ~ drug, data = dataset, random = ~1|subject, method = "ML"))


tiff("V1_right.tiff", height = 12, width = 17, units = 'cm', 
     compression = "lzw", res = 600)
plot(value_striatum_left_signalchange)
dev.off()





############### Value striatum right
ROI = "value_striatum_right"
side = ""

dataset <- unique(fqstats_value_striatum_right[fqstats_value_striatum_right$image=="stats/pe1",])


dataset_summary <- describeBy(x = dataset$mean, 
                              group = dataset$drug, 
                              mat = TRUE) 
names(dataset_summary)[2] <- "drug"

assign(paste(ROI,side,"_signalchange", sep = ""),
       ggplot(dataset_summary, aes(x = drug, y = mean, col = drug)) + 
         geom_errorbar(aes(ymin=mean-se, ymax=mean+se), width = .1, size=1, col = "black") + 
         geom_point(size=7) + 
         theme_bw(base_size = 20, base_family = "Calibri") +
         labs(title = "value striatum right", x = "Drug", y = "% change") + 
         scale_color_manual(values = c("#D55E00", "#009E73"))
)

assign(paste(ROI,side,"_ttest", sep = ""), t.test(mean ~ drug, data = dataset, paired=TRUE, cond.level=0.95, na.action=na.exclude))
t.test(dataset$mean, cond.level=0.95, na.action=na.exclude)
dataset_summary$mean[1]-dataset_summary$mean[2]
# t.test probably looks cleaner, but remember that the lme model below does exactly the same thing, and produces the same result
#summary(lme(max ~ drug, data = dataset, random = ~1|subject, method = "ML"))



tiff("value_striatum_right.tiff", height = 12, width = 17, units = 'cm', 
     compression = "lzw", res = 600)
plot(value_striatum_right_signalchange)
dev.off()


############### Value striatum left
ROI = "value_striatum_left"
side = ""

dataset <- unique(fqstats_value_striatum_left[fqstats_value_striatum_left$image=="stats/pe1",])


dataset_summary <- describeBy(x = dataset$mean, 
                              group = dataset$drug, 
                              mat = TRUE) 
names(dataset_summary)[2] <- "drug"

assign(paste(ROI,side,"_signalchange", sep = ""),
       ggplot(dataset_summary, aes(x = drug, y = mean, col = drug)) + 
         geom_errorbar(aes(ymin=mean-se, ymax=mean+se), width = .1, size=1, col = "black") + 
         geom_point(size=7) + 
         theme_bw(base_size = 20, base_family = "Calibri") +
         labs(title = "value striatum left", x = "Drug", y = "% change") + 
         scale_color_manual(values = c("#D55E00", "#009E73"))
)

assign(paste(ROI,side,"_ttest", sep = ""), t.test(mean ~ drug, data = dataset, paired=TRUE, cond.level=0.95, na.action=na.exclude))
t.test(dataset$mean, cond.level=0.95, na.action=na.exclude)
dataset_summary$mean[1]-dataset_summary$mean[2]
# t.test probably looks cleaner, but remember that the lme model below does exactly the same thing, and produces the same result
#summary(lme(max ~ drug, data = dataset, random = ~1|subject, method = "ML"))



tiff("value_striatum_left.tiff", height = 12, width = 17, units = 'cm', 
     compression = "lzw", res = 600)
plot(value_striatum_left_signalchange)
dev.off()


############### Value frontal
ROI = "value_frontal"
side = ""

dataset <- unique(fqstats_value_frontal[fqstats_value_frontal$image=="stats/pe1",])


dataset_summary <- describeBy(x = dataset$mean, 
                              group = dataset$drug, 
                              mat = TRUE) 
names(dataset_summary)[2] <- "drug"

assign(paste(ROI,side,"_signalchange", sep = ""),
       ggplot(dataset_summary, aes(x = drug, y = mean, col = drug)) + 
         geom_errorbar(aes(ymin=mean-se, ymax=mean+se), width = .1, size=1, col = "black") + 
         geom_point(size=7) + 
         theme_bw(base_size = 20, base_family = "Calibri") +
         labs(title = "value striatum frontal", x = "Drug", y = "% change") + 
         scale_color_manual(values = c("#D55E00", "#009E73"))
)

assign(paste(ROI,side,"_ttest", sep = ""), t.test(mean ~ drug, data = dataset, paired=TRUE, cond.level=0.95, na.action=na.exclude))

t.test(dataset$mean, cond.level=0.95, na.action=na.exclude)
dataset_summary$mean[1]-dataset_summary$mean[2]


tiff("value_frontal.tiff", height = 12, width = 17, units = 'cm', 
     compression = "lzw", res = 600)
plot(value_frontal_signalchange)
dev.off()


tiff("value_striatum_left.tiff", height = 12, width = 17, units = 'cm', 
     compression = "lzw", res = 600)
plot(value_striatum_left_signalchange)
dev.off()


tiff("value_striatum_right.tiff", height = 12, width = 17, units = 'cm', 
     compression = "lzw", res = 600)
plot(value_striatum_right_signalchange)
dev.off()





