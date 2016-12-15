### Main script for SHAPS data analysis ###


## Set global variables for flexibility ##

setwd('D:/Dropbox/jobb/hedfarmlab/Opioid_Reward_fMRI/Surveys')

#Set the directory of the checklistfolder
subdir <- "D:/Dropbox/jobb/hedfarmlab/Opioid_Reward_fMRI/Surveys/SHAPS/"

subinfo <- read.csv(file ='D:/Dropbox/jobb/hedfarmlab/Opioid_Reward_fMRI/subject_info/subject_infosheet.csv', header = TRUE, sep = ";")

#Load all relevant packages
library(tidyr)
library(ggplot2)

source("Surveys_Rproj/SHAPS_load_raw.R")

## Load (and tidy up) relevant data files ##

items <- read.table(
  paste(subdir,'items.txt', sep=""), 
  sep = "\t", header = TRUE)

## Combining data with subject info ##

shapsdata <- merge(shapsdata, subinfo, by = c("subject", "session"))

shapsdata$session <- factor(shapsdata$session)
