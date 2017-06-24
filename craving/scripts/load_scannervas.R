# Load packages
library(reshape2)

## Set up and sort the scanner vas data dataframe
scannervas_raw <- read.table(file = "behavioral/in_scanner_edat/Food_craving_in_scanner.txt", header = TRUE, sep = "\t", dec = ".")

# 510 subject name mislabeled
scannervas_raw$Subject[scannervas_raw$Session==1 & scannervas_raw$RandomSeed==-122576504] <- 510
# 513 subject name mislabeled
scannervas_raw$Subject[scannervas_raw$Session==2 & scannervas_raw$RandomSeed==-1737019012] <- 513
# 527 session 2 was mislabeled
scannervas_raw$Session[scannervas_raw$Subject==527 & scannervas_raw$RandomSeed==-2025130312] <- 2
# 627 session 2 was mislabeled
scannervas_raw$Session[scannervas_raw$Subject==627 & scannervas_raw$RandomSeed==-1119385059] <- 2

# Keep only relevant variables, keep only block averages, and rename to fit merge with subinfo
scannervas_raw <- scannervas_raw[,c("Subject", "Session", "Condition", "Block1.Sample", "VasScore")]
scannervas_raw <- unique(scannervas_raw)
names(scannervas_raw) <- c("subject", "session", "condition", "trial", "vas")

# Sort by subject, then by session
attach(scannervas_raw)
scannervas_raw <- scannervas_raw[order(subject, session),]
detach(scannervas_raw)


## Load subject information, and the checklist data to get the hunger ratings
subinfo <- read.csv("/Dropbox/jobb/hedfarmlab/Opioid_Reward_fMRI/subject_info/subject_infosheet.csv", header = TRUE, ",", dec = ".")

cldata <- read.table("/Dropbox/jobb/hedfarmlab/Opioid_Reward_fMRI/surveys/checklist/cldata.txt", header = TRUE, sep = "\t", dec = ".")
cl_hunger <- cldata[cldata$block==2 & cldata$item=="hungry",c(1,2,5)] # The second rating vas chosen as it was the one made closest tot the present task
cl_hunger$subject <- factor(cl_hunger$subject)
cl_hunger$session <- factor(cl_hunger$session)
names(cl_hunger) <- c("subject", "session", "hungervas")


## Prepare dataset for analysis
# Remove subjects
excludedsubs <- c(503, 507, 514)
scannervas_raw <- scannervas_raw[!(scannervas_raw$subject %in% excludedsubs),]

# Merge data with subject information and hunger ratings
scannervas_long <- merge(scannervas_raw, cl_hunger, by = c("subject", "session"))
scannervas_long <- merge(scannervas_long, subinfo, by = c("subject", "session"))

# Set variables as factors and change "Reguler" and "Observer" to "Regulate" and "Observe"
scannervas_long$subject = factor(scannervas_long$subject)
scannervas_long$session = factor(scannervas_long$session)
scannervas_long$trial = factor(scannervas_long$trial)
scannervas_long$guess_cor = factor(scannervas_long$guess_cor)
scannervas_long$drug <- factor(scannervas_long$drug, c("pla", "mor"))

levels(scannervas_long$condition)[levels(scannervas_long$condition)=="Reguler"] <- "regulate"
levels(scannervas_long$condition)[levels(scannervas_long$condition)=="Observer"] <- "observe"


# Downscale VAS ratings
scannervas_long$vas <- scannervas_long$vas / 10
scannervas_long$hungervas <- scannervas_long$hungervas * 10


scannervas_long <- scannervas_long[order(scannervas_long$subject, scannervas_long$drug, scannervas_long$condition),]


## Create mean vas per condition per session variable (for calculating EVs in FSL). sucomvas = subject-condition-mean-vas
scannervas_condmeans <- aggregate(scannervas_long$vas, list(scannervas_long$subject, scannervas_long$session, scannervas_long$condition), mean)
names(scannervas_condmeans) <- c("subject", "session","condition", "sucomvas")

scannervas_long <- merge(scannervas_long, 
                         scannervas_condmeans, 
                         by = c("subject", "session", "condition"))

scannervas_long$demvas <- scannervas_long$vas - scannervas_long$sucomvas

# Recalculate condmeans, excluding session
scannervas_long$sucomvas <- NULL
scannervas_condmeans <- aggregate(scannervas_condmeans$sucomvas, list(scannervas_condmeans$subject, scannervas_condmeans$condition), mean)
names(scannervas_condmeans) <- c("subject","condition", "sucomvas")
scannervas_long <- merge(scannervas_long, 
                         scannervas_condmeans, 
                         by = c("subject", "condition"))


# Create mean vas per drug per subject
scannervas_drugmeans <- aggregate(scannervas_long$vas, list(scannervas_long$subject, scannervas_long$drug), mean)
names(scannervas_drugmeans) <- c("subject", "drug","subdrugmeanvas")

scannervas_long <- merge(scannervas_long, 
                         scannervas_drugmeans, 
                         by = c("subject", "drug"))

# Create mean vas per subject and demeaned data
scannervas_submeans <- aggregate(scannervas_long$vas, list(scannervas_long$subject), mean)
names(scannervas_submeans) <- c("subject", "submean")
scannervas_long <- merge(scannervas_long, 
                         scannervas_submeans, 
                         by = c("subject"))
scannervas_long$drugdemvas <- scannervas_long$subdrugmeanvas - scannervas_long$submean
scannervas_long$conddemvas <- scannervas_long$sucomvas - scannervas_long$submean

## Make a wide format version of the dataset 

# Convert to wide format based on drug, adding some relevant between subject variables
scannervas_wide <- scannervas_long[,c("subject", "drug", "condition", "vas", "age", "sex", "weight")]
scannervas_wide <- dcast(data = scannervas_long, formula = subject + age + sex + weight ~ drug + condition, value.var = "vas", fun.aggregate = mean)

