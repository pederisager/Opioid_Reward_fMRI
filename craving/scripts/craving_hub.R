library(ggplot2)
library(nlme)
library(reshape)
library(reshape2)
library(gridExtra)
library(psych)
library(extrafont)
library(effects)

# load the vas data
source("scripts/load_scannervas.R")

source("scripts/load_ratingvas.R")

# Churn out all plots for in-scanner data
source("scripts/plots_scannervas.R")




# Create EVs for Feat analyses 
#source("scripts/createEV_scannervas.R")

# Save plots
tiff("drugmeans.tiff", height = 12, width = 17, units = 'cm', 
     compression = "lzw", res = 600)
plot(drug_persub)
dev.off()

tiff("conditionmeans.tiff", height = 12, width = 17, units = 'cm', 
     compression = "lzw", res = 600)
plot(cond_persub)
dev.off()