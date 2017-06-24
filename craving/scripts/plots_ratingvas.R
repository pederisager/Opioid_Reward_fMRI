
# Plot mean change in wantfood VAS per subject per drug condition
wf_drugmean <- ggplot(data = ratingvas, aes(x = drug, y = wfdrugmean)) +
  geom_line(aes(group = subject)) +
  geom_boxplot(width=0.1, lwd=1)

# Plot mean change in feelgoodfood VAS per subject per drug condition
fgf_drugmean <- ggplot(data = ratingvas, aes(x = drug, y = fgfdrugmean)) +
  geom_line(aes(group = subject)) +
  geom_boxplot(width=0.1, lwd=1)


grid.arrange(wf_drugmean, fgf_drugmean, ncol=2)

wf_mealdrug <- ggplot(data = ratingvas, aes(x = hours_since_meal, y = wantfood, col = drug, group = drug)) + 
  geom_jitter() +
  geom_smooth(method = "lm")
plot(wf_mealdrug)

# Plot VAS for each image
plot_imagevas <- ggplot(data = ratingvas, aes(x = image, y = wantfood)) +
  geom_boxplot()