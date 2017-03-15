
### Main script for checklist data analysis ###

## Set global variables for flexibility ##

setwd('D:/Dropbox/jobb/hedfarmlab/Opioid_Reward_fMRI/Surveys')

#Set the directory of the checklistfolder
subdir <- "D:/Dropbox/jobb/hedfarmlab/Opioid_Reward_fMRI/Surveys/checklist/"

#Load all relevant packages
#library(tidyr)
library(dplyr)
library(tidyr)
library(ggplot2)


## Load (and tidy up) relevant data files ##

# Load data

subinfo <- read.csv(file ='D:/Dropbox/jobb/hedfarmlab/Opioid_Reward_fMRI/subject_info/subject_infosheet.csv', header = TRUE, sep = ",")

items <- read.table(
  paste(subdir,'items.txt', sep=""), 
  sep = "\t", header = TRUE)

source("Surveys_Rproj/checklist_load_eprime.R")
source("Surveys_Rproj/checklist_load_matlab.R")

#Combine eprime, matlab, and subject info

cldata <- rbind(checklist_matlab, checklist_eprime)
cldata <- cldata[order(cldata$subject, cldata$session, cldata$block), ]

cldata <- merge(cldata, subinfo, by = c("subject", "session"))

cldata$session <- factor(cldata$session)
cldata$block <- factor(cldata$block)

# Filter data

source("Surveys_Rproj/checklist_filter.R")
