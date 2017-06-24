
library(nlme)
library(ggplot2)
library(extrafont)

# Analyze respiration

resp_means <- read.csv(file = "respiration_means.csv", header = TRUE, sep = ",")

rdrug_means <- aggregate(x = resp_means$mean, by = list(resp_means$subject, resp_means$drug), FUN = mean)
names(rdrug_means) <- c("subject", "drug", "mean")
rdrug_means$subject <- factor(rdrug_means$subject)

summary(lme(mean ~ drug, data = rdrug_means, random = ~1|subject, method = "ML"))

# plot data
rdrug_plot <- ggplot(data = resp_means, aes(x = drug, y = mean)) +
  #geom_violin(aes(fill = drug, col = drug), width = .5, alpha = .5) +
  geom_jitter(width = .04) +
  theme_classic(base_size = 20, base_family = "Gill Sans MT") +
  scale_fill_manual(values = c("#D55E00", "#0072B2"))

# Save plot as image file
tiff("respbydrug.tiff", height = 12, width = 17, units = 'cm', 
     compression = "lzw", res = 600)
plot(rdrug_plot)
dev.off()


# Analyze pulse

pulse_means <- read.csv(file = "pulse_means.csv", header = TRUE, sep = ",")

pdrug_means <- aggregate(x = pulse_means$mean, by = list(pulse_means$subject, pulse_means$drug), FUN = mean)
names(pdrug_means) <- c("subject", "drug", "mean")
pdrug_means$subject <- factor(pdrug_means$subject)

summary(lme(mean ~ drug, data = pdrug_means, random = ~1|subject, method = "ML", na.action = na.omit))

# plot data
pdrug_plot <- ggplot(data = pulse_means, aes(x = drug, y = mean)) +
  #geom_violin(aes(fill = drug, col = drug), width = .5, alpha = .5) +
  geom_jitter(width = .04) +
  theme_classic(base_size = 20, base_family = "Gill Sans MT") +
  scale_fill_manual(values = c("#D55E00", "#0072B2"))

# Save plot as image file
tiff("pulsebydrug.tiff", height = 12, width = 17, units = 'cm', 
     compression = "lzw", res = 600)
plot(pdrug_plot)
dev.off()