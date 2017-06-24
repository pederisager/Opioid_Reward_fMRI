
library(ggplot2)

# Drug main effect
drug_main <- ggplot(scannervas_long, aes(x = drug, y = vas)) + 
  theme_minimal(base_size = 20) +
  theme(legend.position = "none") +
  scale_fill_manual(values = c("#D55E00", "#0072B2")) +
  geom_violin(aes(fill = drug), col = "black", size = 1) + 
  geom_boxplot(width=.1, size = 1, outlier.shape=NA) 



# Condition main effect
cond_main <- ggplot(scannervas_long, aes(x = condition, y = vas)) + 
  theme_minimal(base_size = 20) +
  theme(legend.position = "none") +
  scale_fill_manual(values = c("#66CC99", "#9999FF")) +
  geom_violin(aes(fill = condition), col = "black", size = 1) + 
  geom_boxplot(width=.1, size = 1, outlier.shape=NA)


# Drug * Condition interaction
drug_cond <- ggplot(scannervas_long, aes(x = condition, y = vas, by = drug)) + 
  theme_bw(base_size = 20) +
  scale_fill_manual(values = c("#D55E00", "#0072B2")) +
  geom_boxplot(aes(fill = drug), width=.1, outlier.shape=NA, size = 1, position = position_dodge(width=0.2))


# Mean VAS score per subject per drug condition
drug_persub <- ggplot(scannervas_long, aes(x = drug, y = subdrugmeanvas)) + 
  theme_bw(base_size = 20, base_family = "Gill Sans MT") +
  theme(legend.position = "none",
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank()) +
  scale_fill_manual(values = c("#D55E00", "#0072B2")) +
  labs(x = "Drug", y = "subject mean VAS score") +
  geom_point(size=2) +
  geom_line(aes(group=subject), size=0.5, na.rm = TRUE) +
  stat_summary(fun.y=mean, geom="point", col="red", size=5) +
  stat_summary(fun.y=mean, geom="line", col="red", size=1.5, aes(group=1))

## Mean VAS score per subject per condition
cond_persub <- ggplot(scannervas_long, aes(x = condition, y = sucomvas)) + 
  theme_bw(base_size = 20, base_family = "Gill Sans MT") +
  theme(legend.position = "none",
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank()) +
  scale_fill_manual(values = c("#D55E00", "#0072B2")) +
  labs(x = "Condition", y = "subject mean VAS score") +
  geom_point(size=2) +
  geom_line(aes(group=subject), size=0.5, na.rm = TRUE) +
  stat_summary(fun.y=mean, geom="point", col="cadetblue", size=5) +
  stat_summary(fun.y=mean, geom="line", col="cadetblue", size=1.5, aes(group=1))

# Plot VAS by hunger ratings
ggplot(scannervas_long, aes(x = hungervas, y = vas)) +
  geom_point() + 
  geom_smooth(method = "lm")




# Model plots from the mixed model - also contains plots for the ratingvas_data
ggplot(as.data.frame(Effect(c("condition","sex"), model_scanvas_5)), aes(condition, fit, col=sex)) +
  geom_line(aes(group=sex, col = sex), size = 1) +
  geom_errorbar(aes(ymin=lower, ymax=upper), width=.05, size =1) +
  geom_point(size = 5) + 
  theme_bw(base_size = 20) +
  labs(title = "condition*sex interaction EM", y = "VAS")

ggplot(as.data.frame(Effect(c("drug","sex"), model_scanvas_5)), aes(factor(drug, levels = c("pla", "mor")), fit, col=sex)) +
  geom_line(aes(group=sex, col = sex), size = 1) +
  geom_errorbar(aes(ymin=lower, ymax=upper), width=.05, size =1) +
  geom_point(size = 5) + 
  theme_bw(base_size = 20, base_family = "Gill Sans MT") +
  labs(title = "drug*sex interaction EM", x = "drug", y = "VAS")

ggplot(as.data.frame(Effect(c("drug"), model_scanvas_5)), aes(drug, fit)) +
  geom_line(aes(group=1), size = 1) +
  geom_errorbar(aes(ymin=lower, ymax=upper), width=.05, size =1) +
  geom_point(size = 5) + 
  theme_bw(base_size = 20) +
  labs(title = "drug EM", y = "VAS")

ggplot(as.data.frame(Effect(c("drug","sex"), model_scanvas_5)), aes(drug, fit, col=sex)) +
  geom_line(aes(group=sex, col = sex), size = 1) +
  geom_errorbar(aes(ymin=lower, ymax=upper), width=.05, size =1) +
  geom_point(size = 5) + 
  theme_bw(base_size = 20) +
  labs(title = "drug*sex interaction EM", y = "VAS")

ggplot(as.data.frame(Effect(c("drug","sex"), model_ratingvasfinal_wf)), aes(drug, fit, col=sex)) +
  geom_line(aes(group=sex, col = sex), size = 1) +
  geom_errorbar(aes(ymin=lower, ymax=upper), width=.05, size =1) +
  geom_point(size = 5) + 
  theme_bw(base_size = 20) +
  labs(title = "drug*sex interaction EM", y = "VAS")


plot(Effect(c("condition","sex"), model_scanvas_5))
plot(Effect(c("sex"), model_ratingvasfinal_fgf))
plot(Effect(c("hungervas"), model_ratingvasfinal_fgf))



tiff("drugmeans.tiff", height = 12, width = 17, units = 'cm', 
     compression = "lzw", res = 600)
plot(Effect(c("hungervas"), model_scanvas_5))
dev.off()
