
### Data analysis of scannervas_long using a multilevel linear modeling ###

# Load required packages -----------------------------------------------------------------------------------------------
library(car)
library(ggplot2)
library(nlme)
library(reshape)

# Attach the dataset to use shorthand variable assignments 
attach(scannervas_long)

# Plot the data --------------------------------------------------------------------------------------------------------

scannervas_plot <- ggplot(data = scannervas_long, aes(x = drug, y = vas, col = drug)) +
  facet_wrap( ~ condition) +
  geom_violin(aes(fill = drug), width = 0.5, col = "black") +
  geom_boxplot(width = 0.2, col = "black") +
  theme_bw()
  
plot(scannervas_plot)

# Assert the need for the model ----------------------------------------------------------------------------------------
# comparing baseline model to model with varying intercepts  
  
  # Baseline model
  model_interceptOnly <- gls(vas ~ 1, data = scannervas_long, method = "ML")
  summary(model_interceptOnly)

  #Varying intercepts model
  model_ranomInterceptOnly <- lme(vas ~ 1, data = scannervas_long, random = ~1|subject, method = "ML")
  summary(model_ranominterceptOnly)
  
  #Varying intercepts for subject and trial
  model_RIsubtim <- lme(vas ~ 1, data = scannervas_long, random = ~1|subject/trial, method = "ML")
  summary(model_RIsubtim)
  
  #Varying drug slopes as well as intercepts for subject and trial
  model_RSsubtim <- lme(vas ~ 1, data = scannervas_long, random = ~drug|subject/trial, method = "ML")
  summary(model_RSsubtim)
  
# Testing the improvement of random intercept model based on -2LL.
logLik(model_interceptOnly)*-2
logLik(model_ranominterceptOnly)*-2
  # Testing model difference against the critical p<.05 value of the chi square for df=1
  (logLik(model_interceptOnly)*-2) - (logLik(model_ranominterceptOnly)*-2) > 3.84 
  # Another way of doing the same
  anova(model_interceptOnly, model_ranominterceptOnly, model_RIsubtim, model_RSsubtim)

# Build the final model for analysis --------------------------------------------------------------------------------

  # Model 1 - base model
  model_scanvas_1<- lme(vas ~ drug + condition + session + sex + 
                          drug:condition + drug:session + condition:session + drug:sex + condition:sex +
                          drug:condition:sex, 
                                   data = scannervas_long, 
                                   random = ~1|subject, 
                                   method = "ML",
                                   na.action = na.exclude)
  summary(model_scanvas_1)
  anova(model_RIsubtim, model_scanvas_1)
  
  # Model 2 - removed drug:session interaction, which was highly correlated with drug (This decision is critical for the effect of drug!)
  model_scanvas_2 <- lme(vas ~ drug + condition + session + sex + 
                          drug:condition + condition:session + drug:sex + condition:sex +
                          drug:condition:sex, 
                        data = scannervas_long, 
                        random = ~1|subject, 
                        method = "ML",
                        na.action = na.exclude)
  summary(model_scanvas_2)
  anova(model_scanvas_1, model_scanvas_2)
  
  # Model 3 - adding reported hunger as a predictor
  model_scanvas_3 <- update(model_scanvas_2, .~. + hungervas)
  summary(model_scanvas_3)
  anova(model_scanvas_2, model_scanvas_3)
  
  # Model 4 - adding hunger interactions to main explanatory variables
  model_scanvas_4 <- update(model_scanvas_3, .~. + drug:hungervas, condition:hungervas)
  summary(model_scanvas_4)
  anova(model_scanvas_3, model_scanvas_4) # Did not improve the model
  
  # Model 5 - removing 3-way interaction, as it was highly correlated with a few others
  model_scanvas_5 <- lme(vas ~ drug + condition + session + sex + hungervas +
                           drug:condition + condition:session + drug:sex + condition:sex,
                         data = scannervas_long, 
                         random = ~1|subject, 
                         method = "ML",
                         na.action = na.exclude)
  summary(model_scanvas_5)
  anova(model_scanvas_3, model_scanvas_5) # No difference between models in explanatory value, so 3-way did not contribute much

  # Model 6 - comparing hungervas with time_since_meal as predictor
  model_scanvas_6 <- lme(vas ~ drug + condition + session + sex + hours_since_meal +
                           drug:condition + condition:session + drug:sex + condition:sex,
                         data = scannervas_long, 
                         random = ~1|subject, 
                         method = "ML",
                         na.action = na.exclude)
  summary(model_scanvas_6) # hungervas much better predictor than time_since_meal
  
  
  model_scanvas_7 <- lme(vas ~ drug + condition + session + sex + hungervas + weight +
                           weight:drug + weight:condition + drug:condition + condition:session + drug:sex + condition:sex,
                         data = scannervas_long, 
                         random = ~1|subject, 
                         method = "ML",
                         na.action = na.exclude)
  summary(model_scanvas_7)
  anova(model_scanvas_5, model_scanvas_7)
  
  # Adding weight to the model - FINAL MODEL FOR MA THESIS
  model_scanvas_8 <- lme(vas ~ drug + condition + session + sex + hungervas + weight +
                           weight:condition + weight:drug + drug:condition + condition:session + drug:sex + condition:sex +
                           weight:drug:condition,
                         data = scannervas_long, 
                         random = ~1|subject, 
                         method = "ML")
  summary(model_scanvas_8)
  anova(model_scanvas_8) 
  plot(allEffects(model_scanvas_8))
  # Adding weight plus its two and three way interaction with drug and condition made model fit consequently better
  # Adding weight alone not good predictor, weight + interactions either good or had singularity issues. 
  # Main + all interactions had the best improvement of model fit.
  

  
  # Added trial main effect
  model_scanvas_trial <- lme(vas ~ drug + condition + session + sex + hungervas + weight + trial +
                              weight:condition + weight:drug + drug:condition + condition:session + drug:sex + condition:sex +
                              weight:drug:condition,
                            data = scannervas_long, 
                            random = ~1|subject, 
                            method = "REML",
                            na.action = na.exclude)
  summary(model_scanvas_trial)
  plot(allEffects(model_scanvas_temp))
  
  # Tested hungervas interactions with main variables. Did not explain any significant variance
  model_scanvas_temp <- lme(vas ~ drug + condition + session + sex + hungervas + weight +
                              weight:condition + weight:drug + drug:condition + condition:session + drug:sex + condition:sex + hungervas:drug + hungervas:condition +
                              weight:drug:condition + drug:condition:hungervas,
                            data = scannervas_long, 
                            random = ~1|subject, 
                            method = "REML")
  #summary(model_scanvas_temp)
  anova(model_scanvas_temp)
anova(model_scanvas_temp1, model_scanvas_temp2)  
