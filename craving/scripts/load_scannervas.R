
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


## Load subject information 
subinfo <- read.csv("/Dropbox/jobb/hedfarmlab/Opioid_Reward_fMRI/subject_info/subject_infosheet.csv", header = TRUE, ",", dec = ".")

## Prepare dataset for analysis
# Remove subjects
excludedsubs <- c(503, 507, 514)
scannervas_raw <- scannervas_raw[!(scannervas_raw$subject %in% excludedsubs),]

# Merge data with subject information
scannervas_long <- merge(scannervas_raw, subinfo, by = c("subject", "session"))
attach(scannervas_long)
scannervas_long <- scannervas_long[order(subject, drug, condition),]
detach(scannervas_long)

## Create mean vas per condition per session variable (for calculating EVs in FSL)
scannervas_condmeans <- aggregate(vas, list(subject, session, condition), mean)
names(scannervas_condmeans) <- c("subject", "session","condition", "sucomvas")

scannervas_long <- merge(scannervas_long, scannervas_condmeans, by = c("subject", "session","condition"))

scannervas_long$demvas <- scannervas_long$vas - scannervas_long$sucomvas


## Make a wide format version of the dataset 

# Convert to wide format based on drug, adding some relevant between subject variables
scannervas_wide <- scannervas_long[,c("subject", "drug", "condition", "vas", "age", "sex", "weight")]
scannervas_wide <- dcast(data = scannervas_long, formula = subject + age + sex + weight ~ drug + condition, value.var = "vas", fun.aggregate = mean)

