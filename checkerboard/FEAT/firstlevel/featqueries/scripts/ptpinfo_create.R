ptpinfo <- read.table("druglist.txt")

ptpinfo$sex <- ifelse(ptpinfo$ptp > 536, "female", "male")

# In

subjectinfo = NULL



druglist <- read.table("druglist.txt")


subjectinfo <- data.frame(
  subject = rep(c(501,502, 504,505,506, 509:513, 515:529, 531:536, 601:616, 618:632),2),
  session = c(rep(1,62), rep(2,62)),
  drug = c(druglist$morsession, druglist$plasession),
  gender = c(ifelse(temp$subject < 600, "male", "female"))
)

subjectinfo <- data.frame(
  subject = c(501,502, 504,505,506, 509:513, 515:529, 531:536, 601:616, 618:632),
  session = ,
  gender = c(ifelse(temp$subject < 600, "male", "female"))
  )

subjectinfo <- merge(subjectinfo, temp, by = "subject")

