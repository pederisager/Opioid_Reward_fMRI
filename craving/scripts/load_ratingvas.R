# Load packages
require(reshape2)

## Set up and sort the scanner vas data dataframe ------------------------------------------------------
# Load data
ratingvas_raw <- read.table(file = "behavioral/food_rating_edat/Food_rating.txt", header = TRUE, sep = "\t", dec = ".")

# Keep only relevant variables
ratingvas <- ratingvas_raw[,c("Subject", "Session", "Trial", "Image", "Slide1.RESP", "Slide2.RESP")]

# Change variable names
names(ratingvas) <- c("subject", "session", "trial", "image", "wantfood", "feelgoodfood")

# Sort by subject, then by session
attach(ratingvas)
ratingvas <- ratingvas[order(subject, session),]
detach(ratingvas)



## Delete subs, merge with subinfo, create variables, and set variables as factors ---------------------------------------

# Delete subjects
excludedsubs <- c(503, 507, 508, 514)
ratingvas <- ratingvas[!(ratingvas$subject %in% excludedsubs),]

# Load subject information & merge
subinfo <- read.csv("/Dropbox/jobb/hedfarmlab/Opioid_Reward_fMRI/subject_info/subject_infosheet.csv", header = TRUE, ",", dec = ".")

cldata <- read.table("/Dropbox/jobb/hedfarmlab/Opioid_Reward_fMRI/surveys/checklist/cldata.txt", header = TRUE, sep = "\t", dec = ".")
cl_hunger <- cldata[cldata$block==3 & cldata$item=="hungry",c(1,2,5)] # The third rating vas chosen as it was the one made closest tot the present task
cl_hunger$subject <- factor(cl_hunger$subject)
cl_hunger$session <- factor(cl_hunger$session)
names(cl_hunger) <- c("subject", "session", "hungervas")

ratingvas <- merge(ratingvas, cl_hunger, by = c("subject", "session"))
ratingvas <- merge(ratingvas, subinfo, by = c("subject", "session"))

# Set factors 
ratingvas$subject <- factor(ratingvas$subject)
ratingvas$session <- factor(ratingvas$session)
ratingvas$trial <- factor(ratingvas$trial)
ratingvas$image <- factor(ratingvas$image)
ratingvas$guess_cor <- factor(ratingvas$guess_cor)
ratingvas$feelgoodfood <- as.numeric(as.character(ratingvas$feelgoodfood))
ratingvas$wantfood <- as.numeric(as.character(ratingvas$wantfood))

# Create mean vas per drug per subject
ratingvas_wf_drugmeans <- aggregate(ratingvas$wantfood, list(ratingvas$subject, ratingvas$drug), mean, na.rm=TRUE, na.action=NULL)
names(ratingvas_wf_drugmeans) <- c("subject", "drug","wfdrugmean")
ratingvas_fgf_drugmeans <- aggregate(ratingvas$feelgoodfood, list(ratingvas$subject, ratingvas$drug), mean, na.rm=TRUE, na.action=NULL)
names(ratingvas_fgf_drugmeans) <- c("subject", "drug","fgfdrugmean")

ratingvas <- merge(ratingvas, ratingvas_wf_drugmeans, by = c("subject", "drug"))
ratingvas <- merge(ratingvas, ratingvas_fgf_drugmeans, by = c("subject", "drug"))
