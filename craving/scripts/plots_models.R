### Create plots for the model with within-subject CIs from the predicted values

# Make demeaned predicted values from model
scannervas_long$predictedvas <- predict(model_scanvas_8)
scannervas_long$predvasdm <- scannervas_long$predictedvas - mean(scannervas_long$predictedvas)



## Drug

# Summarize based on relevant effect
predsum <- describeBy(scannervas_long$predictedvas, group = scannervas_long$drug, mat = TRUE)
# Reorder factors to set placebo first
predsum$group1 <- factor(predsum$group1, c("pla", "mor"))

modelplot_drug <- ggplot(predsum, aes(group1, mean, col=group1)) + 
  geom_errorbar(aes(ymin=mean-(se*1.96), ymax=mean+(se*1.96)), width=.05, size =1, col="black") +
  geom_point(size = 5) + 
  theme_bw(base_size = 20, base_family = "Calibri") +
  scale_color_manual(values = c("#009E73","#D55E00")) +
  labs(title = "A - Drug", x = "Drug", y = "Want food [0-10] estimated means") + 
  theme(legend.title = element_blank()) +
  ylim(4.5, 5.5)



## condition

# Summarize based on relevant effect
predsum <- describeBy(scannervas_long$predictedvas, group = scannervas_long$condition, mat = TRUE)

modelplot_cond <- ggplot(predsum, aes(group1, mean, col=group1)) + 
  geom_errorbar(aes(ymin=mean-(se*1.96), ymax=mean+(se*1.96)), width=.05, size =1, col="black") +
  geom_point(size = 4) + 
  theme_bw(base_size = 20, base_family = "Calibri") +
  labs(title = "B - Condition", x = "Condition", y = "Want food [0-10] estimated means") + 
  theme(legend.title = element_blank())



## drug:condition
predsum <- describeBy(scannervas_long$predictedvas, group = list(scannervas_long$condition, scannervas_long$drug), mat = TRUE)
# Reorder factors to set placebo first
predsum$group2 <- factor(predsum$group2, c("pla", "mor"))

modelplot_conddrug <- ggplot(predsum, aes(group1, mean, col = group2)) +
  geom_errorbar(aes(ymin=mean-(se*1.96), ymax=mean+(se*1.96)), width=.1, size =1, col="black") +
  geom_point(size = 4) + 
  geom_line(aes(group=group2), size=1.5) +
  theme_bw(base_size = 20, base_family = "Calibri") +
  scale_color_manual(values = c("#009E73","#D55E00")) +
  labs(title = "B - Condition*Drug", x = "condition", y = "Want food [0-10] estimated means") + 
  theme(legend.title = element_blank()) +
  ylim(3,7)



## Hunger

# Summarize based on relevant effect
predsum <- describeBy(scannervas_long$predictedvas, group = scannervas_long$hungervas, mat = TRUE)

modelplot_hunger <- ggplot(predsum, aes(as.numeric(group1), mean)) +
  geom_smooth(method = "lm", size=1.5, col="black") +
  theme_bw(base_size = 20, base_family = "Calibri") +
  labs(title = "C - Hunger", x = "Hunger at scan start (0-100)", y = "Want food [0-10] estimated means") + 
  theme(legend.title = element_blank()) 



## condition:sex
predsum <- describeBy(scannervas_long$predictedvas, group = list(scannervas_long$condition, scannervas_long$sex), mat = TRUE)

modelplot_condsex <- ggplot(predsum, aes(group1, mean, col = group2)) +
  geom_errorbar(aes(ymin=mean-(se*1.96), ymax=mean+(se*1.96)), width=.1, size =1, col="black") +
  geom_point(size = 4) + 
  geom_line(aes(group=group2), size=1.5) +
  theme_bw(base_size = 20, base_family = "Calibri") +
  scale_color_manual(values = c("#F4953B","#0072B2")) +
  labs(title = "D - Condition*Gender", x = "condition", y = "Want food [0-10] estimated means") + 
  theme(legend.title = element_blank()) +
  ylim(3,7)



## drug:condition:weight
predsum <- describeBy(scannervas_long$predictedvas, group = list(scannervas_long$condition, scannervas_long$drug, scannervas_long$weight), mat = TRUE)

modelplot_drugcondweight <- ggplot(predsum, aes(as.numeric(as.character(predsum$group3)), mean, col=group2)) +
  geom_smooth(method="lm", size=1.5, alpha=0.2, aes(linetype=group1)) +
  theme_bw(base_size = 20, base_family = "Calibri") +
  labs(title = "E - Weight*Drug*Condition", x = "Weight", y = "Want food [0-10] estimated means") +
  guides(colour = guide_legend(override.aes = list(size = 10))) +  
  scale_color_manual(values = c("#CC0000", "#0072B2", "#FF6666", "#00CCFF")) +
  theme(legend.title = element_blank())

grid.arrange(modelplot_drug + theme_bw(base_size = 13), 
             modelplot_conddrug + theme_bw(base_size = 13), 
             modelplot_hunger + theme_bw(base_size = 13),
             modelplot_condsex + theme_bw(base_size = 13))




tiff("drug.tiff", height = 12, width = 17, units = 'cm', 
     compression = "lzw", res = 600)
plot(modelplot_drug)
dev.off()

tiff("condition.tiff", height = 12, width = 17, units = 'cm', 
     compression = "lzw", res = 600)
plot(modelplot_cond)
dev.off()

tiff("conddrug.tiff", height = 12, width = 17, units = 'cm', 
     compression = "lzw", res = 600)
plot(modelplot_conddrug)
dev.off()

tiff("hunger.tiff", height = 12, width = 17, units = 'cm', 
     compression = "lzw", res = 600)
plot(modelplot_hunger)
dev.off()

tiff("condsex.tiff", height = 12, width = 17, units = 'cm', 
     compression = "lzw", res = 600)
plot(modelplot_condsex)
dev.off()

tiff("drugcondweigh.tiff", height = 12, width = 17, units = 'cm', 
     compression = "lzw", res = 600)
plot(modelplot_drugcondweight)
dev.off()




ggplot(predsum, aes(as.numeric(as.character(predsum$group3)), mean, col=group2)) +
  geom_smooth(method="lm", size=1.5, alpha=0.2, aes(fill = group1)) +
  theme_bw(base_size = 20, base_family = "Gill Sans MT") +
  labs(title = "E - Weight*Drug*Condition", x = "Weight", y = "VAS") +
  guides(colour = guide_legend(override.aes = list(size=10, size=10))) +  
  scale_color_manual(values = c("#CC0000", "#0072B2", "#FF6666", "#00CCFF")) +
  theme(legend.title = element_blank())
