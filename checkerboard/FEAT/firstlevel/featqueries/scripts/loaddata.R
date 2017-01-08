
## Set the name of folders containing the featquery of interest

queryfolder <- "featquery_V2_L_weighted"

## Load subject information and exclude subects

subinfo <- read.csv(file ='D:/Dropbox/jobb/hedfarmlab/Opioid_Reward_fMRI/subject_info/subject_infosheet.csv', header = TRUE, sep = ",")

excludedsubs <- c(503, 507, 508, 514, 530, 617)
subinfo <- subinfo[!(subinfo$subject %in% excludedsubs),]


## Load data for all subjects and combine in 'psdata'

psdata <- data.frame()

for (subject in subinfo$subject) {
  for (session in c(1,2)) {
    
    assign("dataset", 
           read.table(
             paste(subject,"-",session,"/",queryfolder,"/tsplot/ps_tsplotc_zstat1_ev1.txt", sep = "")))
    
    if ((subinfo$drug[subinfo$subject == subject & subinfo$session == session]) == "mor") {
      dataset$drug <- "mor"
    } else {
      dataset$drug <- "pla"
    }
    
    dataset$subject <- subject
    dataset$session <- session
    dataset$datanobase <- dataset$V2 - mean(dataset$V2[dataset$V1 <= 0.4])
    
    names(dataset) <- c("time", "data", "myst1", "myst2", "mystdata", "drug", "subject", "session", "datanobase")
    
    psdata <- rbind(psdata, dataset) # 
    
    assign(paste("sub", subject, "s", session, sep = ""), dataset) #rename dataset based on sub and sess
    rm(dataset)
    
    
  }
}
