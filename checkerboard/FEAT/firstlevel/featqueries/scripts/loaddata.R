


## Set your parameters of interest ##
# The parameters are also used for labling plots later on

ROI <- roi
side <- side


## Sets the name of folders containing the featquery of interest

queryfolder <- paste("featquery_",ROI,side,sep = "")

## Load subject information and exclude subects

subinfo <- read.csv(file ='D:/Dropbox/jobb/hedfarmlab/Opioid_Reward_fMRI/subject_info/subject_infosheet.csv', header = TRUE, sep = ",")

excludedsubs <- excludedsubs
subinfo <- subinfo[!(subinfo$subject %in% excludedsubs),]


## Load data for all subjects and combine in 'psdata'

assign(paste("psdata"),data.frame())
assign(paste("fqstats"),data.frame())

for (subject in subinfo$subject) {
  for (session in c(1,2)) {
    # Load peristimulus-data ----
    
    # Load dataset
    assign("datasetps", 
           read.table(paste(subject,"-",session,"/",queryfolder,"/tsplot/",peristimdata, sep = ""))) 
    # Log drug session
    if ((subinfo$drug[subinfo$subject == subject & subinfo$session == session]) == "mor") {
      datasetps$drug <- "mor"
    } else {
      datasetps$drug <- "pla"
    }
    # Set subject as factor
    datasetps$subject <- factor(subject)
    # Log session
    datasetps$session <- factor(session)
    # Calculate demeaned HRF based on raw data minus first second of peristimulus time
    datasetps$datanobase <- (datasetps$V2 - mean(datasetps$V2[datasetps$V1 <= 0.4])) / mean(datasetps$V2[datasetps$V1 <= 0.4])
    # Set names. I do not know the content of the myst-variables
    names(datasetps) <- c("time", "data", "myst1", "myst2", "mystdata", "drug", "subject", "session", "datanobase")
    
    psdata <- rbind(psdata, datasetps)
    

    
    
    # Load featquery statstics
    assign("datasetfq",
           read.table(paste(subject,"-",session,"/",queryfolder,"/","report.txt", sep = "")))
    if ((subinfo$drug[subinfo$subject == subject & subinfo$session == session]) == "mor") {
      datasetfq$drug <- "mor"
    } else {
      datasetfq$drug <- "pla"
    }
    datasetfq$session <- factor(session)
    datasetfq$subject <- factor(subject)
    datasetfq$drug <- factor(datasetfq$drug)
    
    names(datasetfq) <- c("V1", "image", "voxels", "min", "10%", "mean", "median", "90%", "max", "stdev", "X", "Y", "Z", "Xmm", "Ymm", "Zmm", "drug", "session", "subject")
    
    fqstats <- rbind(fqstats, datasetfq)
  }
}

assign(paste("psdata_",ROI,side, sep = ""),psdata)
assign(paste("fqstats_",ROI,side, sep = ""),fqstats)
