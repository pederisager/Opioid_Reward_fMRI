
psdata <- data.frame()

for (subject in ptpinfo$ptp) {
  for (session in c(1,2)) {
    
    assign("dataset", 
           read.table(
             paste(subject,"-",session,"/featquery_mni_occipital/tsplot/ps_tsplotc_zstat1_ev1.txt", sep = "")))
    
    if (ptpinfo$morsession == session) {
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


