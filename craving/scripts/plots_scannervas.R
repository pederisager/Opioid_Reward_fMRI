

# Drug main effect
drug_main <- ggplot(scannervas_long, aes(x = drug, y = vas)) + 
  theme_minimal(base_size = 30) +
  theme(legend.position = "none") +
  scale_fill_manual(values = c("#D55E00", "#0072B2")) +
  geom_violin(aes(fill = drug), col = "black", size = 1) + 
  geom_boxplot(width=.1, size = 1, outlier.shape=NA) 

plot(drug_main)


# Condition main effect
cond_main <- ggplot(scannervas_long, aes(x = condition, y = vas)) + 
  theme_minimal(base_size = 30) +
  theme(legend.position = "none") +
  scale_fill_manual(values = c("#66CC99", "#9999FF")) +
  geom_violin(aes(fill = condition), col = "black", size = 1) + 
  geom_boxplot(width=.1, size = 1, outlier.shape=NA)

plot(cond_main)


# Drug * Condition interaction
drug_cond <- ggplot(scannervas_long, aes(x = condition, y = vas, by = drug)) + 
  theme_minimal(base_size = 30) +
  scale_fill_manual(values = c("#D55E00", "#0072B2")) +
  geom_boxplot(aes(fill = drug), width=.1, outlier.shape=NA, size = 1, position = position_dodge(width=0.2))

plot(drug_cond)

