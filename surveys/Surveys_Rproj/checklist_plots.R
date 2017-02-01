
## Plots ##


# For pill questions: Plot of vas*drug*pill
ggplot(data = cldata_pillqs, aes(x = drug, y = vas)) +
  facet_grid(. ~ item) +
  geom_point() + 
  geom_jitter(width = 0.3)

# For state questions: Plot of vas*drug*pill
ggplot(data = cldata_stateqs, aes(x = drug, y = vas)) +
  facet_grid(. ~ item) +
  geom_jitter(width = 0.3)

# vas by drug for pill questions, mean summary
by_item <- group_by(cldata_pillqs, item, drug)
sum_item <- summarise(by_item, mean_vas = mean(vas, na.rm = TRUE), n = n(), sd = sd(vas, na.rm = TRUE), moe = qt(0.975,df=n-1)*sd/sqrt(n))

ggplot(data = sum_item, aes(x = drug, y = mean_vas)) +
  geom_jitter(data = cldata_pillqs, aes(drug, vas), width = 0.1, color = "grey") +
  geom_errorbar(aes(ymin = mean_vas-moe, ymax = mean_vas+moe), width = 0) +
  geom_point(aes(col = drug), size = 4) + 
  scale_color_manual(values = c("#D55E00", "#0072B2")) +
  facet_grid(. ~ item)

# vas by drug for state questions, mean summary
state_by_item <- group_by(cldata_stateqs, item, drug)

state_sum_item <- summarise(state_by_item, 
                            mean_vas = mean(vas, na.rm = TRUE), 
                            n = n(), 
                            sd = sd(vas, na.rm = TRUE), 
                            moe = qt(0.975,df=n-1)*sd/sqrt(n)
                            )

ggplot(data = state_sum_item, aes(x = drug, y = mean_vas)) +
  geom_errorbar(aes(ymin = mean_vas-moe, ymax = mean_vas+moe), width = 0) +
  geom_point(aes(col = drug), size = 5) + 
  scale_color_manual(values = c("#D55E00", "#0072B2")) +
  facet_wrap(~item, scales = "free_y")

ggplot(data = state_sum_item, aes(x = drug, y = mean_vas)) +
  geom_jitter(data = cldata_stateqs, aes(drug, vas), width = 0.1, color = "grey") +
  geom_errorbar(aes(ymin = mean_vas-moe, ymax = mean_vas+moe), width = 0) +
  geom_point(aes(col = drug), size = 4) + 
  scale_color_manual(values = c("#D55E00", "#0072B2")) +
  facet_grid(. ~ item)


# vas by drug*block for state questions, mean summary
stateq_grouped <- group_by(cldata_stateqs, item, drug, block)

stateq_summary <- summarise(stateq_grouped, 
                                        mean_vas = mean(vas, na.rm = TRUE), 
                                        n = n(), 
                                        sd = sd(vas, na.rm = TRUE), 
                                        moe = qt(0.975,df=n-1)*sd/sqrt(n)
                                        )


ggplot(data = stateq_summary, aes(x = block, y = mean_vas)) +
  geom_jitter(data = cldata_stateqs, aes(block, vas), width = 0.1, color = "grey") +
  geom_errorbar(aes(ymin = mean_vas-moe, ymax = mean_vas+moe), width = 0.1) +
  geom_point(aes(col = drug), size = 3) + 
  geom_line(aes(group = drug, col = drug)) + 
  scale_color_manual(values = c("#D55E00", "#0072B2")) +
  facet_grid(. ~ item)


# vas by drug*block for pill questions, mean summary
pillq_grouped <- group_by(cldata_pillqs, item, drug, block)
pillq_summary <- summarise(pillq_grouped, 
                           mean_vas = mean(vas, na.rm = TRUE), 
                           n = n(), 
                           sd = sd(vas, na.rm = TRUE), 
                           moe = qt(0.975,df=n-1)*sd/sqrt(n))

ggplot(data = pillq_summary, aes(x = block, y = mean_vas)) +
  geom_jitter(data = cldata_pillqs, aes(block, vas), width = 0.1, color = "grey") +
  geom_errorbar(aes(ymin = mean_vas-moe, ymax = mean_vas+moe), width = 0.1) +
  geom_point(aes(col = drug), size = 3) + 
  geom_line(aes(group = drug, col = drug)) + 
  scale_color_manual(values = c("#D55E00", "#0072B2")) +
  facet_grid(. ~ item) 

