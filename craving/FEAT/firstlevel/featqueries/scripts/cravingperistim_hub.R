

# Set parameters ----
excludedsubs <- c(503, 507, 508, 514, 530, 602, 617)
# 503, 507, 508, 514, 530, 617 - Only one or no session
# 512, 532 - Extreme checkerboard data
# 602 - featquery crash in craving session2. Also has corrupted cope8 and 9 in craving. 

peristimdata <- "ps_tsplotc_zstat1_ev1.txt"

# Load data ----

roi <- "V1"
side <- "left"

source("D:/Dropbox/jobb/hedfarmlab/Opioid_Reward_fMRI/checkerboard/FEAT/firstlevel/featqueries/scripts/loaddata.R")
source("D:/Dropbox/jobb/hedfarmlab/Opioid_Reward_fMRI/checkerboard/FEAT/firstlevel/featqueries/scripts/plotcreate.R")


roi <- "V1"
side <- "right"

source("D:/Dropbox/jobb/hedfarmlab/Opioid_Reward_fMRI/checkerboard/FEAT/firstlevel/featqueries/scripts/loaddata.R")
source("D:/Dropbox/jobb/hedfarmlab/Opioid_Reward_fMRI/checkerboard/FEAT/firstlevel/featqueries/scripts/plotcreate.R")


roi <- "V2"
side <- "left"

source("D:/Dropbox/jobb/hedfarmlab/Opioid_Reward_fMRI/checkerboard/FEAT/firstlevel/featqueries/scripts/loaddata.R")
source("D:/Dropbox/jobb/hedfarmlab/Opioid_Reward_fMRI/checkerboard/FEAT/firstlevel/featqueries/scripts/plotcreate.R")


roi <- "V2"
side <- "right"

source("D:/Dropbox/jobb/hedfarmlab/Opioid_Reward_fMRI/checkerboard/FEAT/firstlevel/featqueries/scripts/loaddata.R")
source("D:/Dropbox/jobb/hedfarmlab/Opioid_Reward_fMRI/checkerboard/FEAT/firstlevel/featqueries/scripts/plotcreate.R")


roi <- "V3"
side <- "left"

source("D:/Dropbox/jobb/hedfarmlab/Opioid_Reward_fMRI/checkerboard/FEAT/firstlevel/featqueries/scripts/loaddata.R")
source("D:/Dropbox/jobb/hedfarmlab/Opioid_Reward_fMRI/checkerboard/FEAT/firstlevel/featqueries/scripts/plotcreate.R")


roi <- "V3"
side <- "right"

source("D:/Dropbox/jobb/hedfarmlab/Opioid_Reward_fMRI/checkerboard/FEAT/firstlevel/featqueries/scripts/loaddata.R")
source("D:/Dropbox/jobb/hedfarmlab/Opioid_Reward_fMRI/checkerboard/FEAT/firstlevel/featqueries/scripts/plotcreate.R")


roi <- "V4"
side <- "left"

source("D:/Dropbox/jobb/hedfarmlab/Opioid_Reward_fMRI/checkerboard/FEAT/firstlevel/featqueries/scripts/loaddata.R")
source("D:/Dropbox/jobb/hedfarmlab/Opioid_Reward_fMRI/checkerboard/FEAT/firstlevel/featqueries/scripts/plotcreate.R")


roi <- "V4"
side <- "right"

source("D:/Dropbox/jobb/hedfarmlab/Opioid_Reward_fMRI/checkerboard/FEAT/firstlevel/featqueries/scripts/loaddata.R")
source("D:/Dropbox/jobb/hedfarmlab/Opioid_Reward_fMRI/checkerboard/FEAT/firstlevel/featqueries/scripts/plotcreate.R")


roi <- "value_striatum_left"
side <- ""

source("D:/Dropbox/jobb/hedfarmlab/Opioid_Reward_fMRI/checkerboard/FEAT/firstlevel/featqueries/scripts/loaddata.R")
source("D:/Dropbox/jobb/hedfarmlab/Opioid_Reward_fMRI/checkerboard/FEAT/firstlevel/featqueries/scripts/plotcreate.R")


roi <- "value_striatum_right"
side <- ""

source("D:/Dropbox/jobb/hedfarmlab/Opioid_Reward_fMRI/checkerboard/FEAT/firstlevel/featqueries/scripts/loaddata.R")
source("D:/Dropbox/jobb/hedfarmlab/Opioid_Reward_fMRI/checkerboard/FEAT/firstlevel/featqueries/scripts/plotcreate.R")


roi <- "value_frontal"
side <- ""

source("D:/Dropbox/jobb/hedfarmlab/Opioid_Reward_fMRI/checkerboard/FEAT/firstlevel/featqueries/scripts/loaddata.R")
source("D:/Dropbox/jobb/hedfarmlab/Opioid_Reward_fMRI/checkerboard/FEAT/firstlevel/featqueries/scripts/plotcreate.R")



# Plot ROI HRVs
grid.arrange(V1left_gam, V1right_gam, V2left_gam, V2right_gam, V3left_gam, V3right_gam, V4left_gam, V4right_gam, ncol = 2)
# Plot ROI raw peristimulus data
grid.arrange(V1left_raw, V1right_raw, V2left_raw, V2right_raw, V3left_raw, V3right_raw, V4left_raw, V4right_raw, ncol = 2)
