## Testing 

# Load required packages -----------------------------------------------------------------------------------------------
library(car)
library(ggplot2)
library(nlme)
library(reshape)

# Attach the dataset to use shorthand variable assignments 

# Plot the data --------------------------------------------------------------------------------------------------------

# Assert the need for the model ----------------------------------------------------------------------------------------

# WANTFOOD - comparing baseline model to model with varying intercepts  
# Baseline model
ratings_interceptOnly_wf <- gls(wantfood ~ 1, data = ratingvas, method = "ML", na.action = na.exclude)
summary(ratings_interceptOnly_wf)

#Varying intercepts model
ratings_randomInterceptOnly_wf <- lme(wantfood ~ 1, data = ratingvas, random = ~1|subject, method = "ML", na.action = na.exclude)
summary(ratings_randomInterceptOnly_wf)

#Varying drug slopes as well as intercepts for subject
ratings_RSsub_wf <- lme(wantfood ~ 1, data = ratingvas, random = ~drug|subject, method = "ML", na.action = na.exclude)
summary(ratings_RSsub_wf)

# Testing the improvement of random intercept model.
anova(ratings_interceptOnly_wf, ratings_randomInterceptOnly_wf, ratings_RSsub_wf)



# FEELGOODFOOD - comparing baseline model to model with varying intercepts
# Baseline model
ratings_interceptOnly_fgf <- gls(feelgoodfood ~ 1, data = ratingvas, method = "ML", na.action = na.exclude)
summary(ratings_interceptOnly_fgf)

#Varying intercepts model
ratings_randomInterceptOnly_fgf <- lme(feelgoodfood ~ 1, data = ratingvas, random = ~1|subject, method = "ML", na.action = na.exclude)
summary(ratings_randomInterceptOnly_fgf)

#Varying drug slopes as well as intercepts for subject
ratings_RSsub_fgf <- lme(feelgoodfood ~ 1, data = ratingvas, random = ~drug|subject, method = "ML", na.action = na.exclude)
summary(ratings_RSsub_fgf)

# Testing the improvement of random intercept model.
anova(ratings_interceptOnly_fgf, ratings_randomInterceptOnly_fgf, ratings_RSsub_fgf)

## Defining models for analysis  -------------------------------------------------------------------------------------

# WANTFOOD - Final model
model_ratingvasfinal_wf <- lme(wantfood ~ drug + session + sex + hungervas + weight + 
                                 drug:sex + weight:drug + weight:sex,
                               data = ratingvas, 
                               random = ~1|subject, 
                               method = "ML",
                               na.action = na.exclude)
summary(model_ratingvasfinal_wf)
anova(model_ratingvasfinal_wf)

# FEELGOODFOOD - Final model
model_ratingvasfinal_fgf <- lme(feelgoodfood ~ drug + session + sex + hungervas  + weight +
                                  drug:sex + weight:drug,
                                data = ratingvas, 
                                random = ~1|subject, 
                                method = "ML",
                                na.action = na.exclude)
summary(model_ratingvasfinal_fgf)
anova(model_ratingvasfinal_fgf)


model_ratingvasfinal_temp <- lme(wantfood  ~ drug + session + sex + hungervas + weight + drug:weight + drug:sex,
                               data = ratingvas, 
                               random = ~1|subject, 
                               method = "ML",
                               na.action = na.exclude)
summary(model_ratingvasfinal_temp)