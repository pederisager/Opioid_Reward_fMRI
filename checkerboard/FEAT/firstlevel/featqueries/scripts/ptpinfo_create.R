ptpinfo <- read.table("druglist.txt")

ptpinfo$sex <- ifelse(ptpinfo$ptp > 536, "female", "male")

# In

subjectinfo = NULL



subjectinfo <- data.frame(
  subject = c(501,502, 504,505,506, 509:513, 515:529, 531:536, 601:616, 618:632),
  session = c(1,2),
  drug = c(
    "pla", "mor", "pla", "mor", "pla", "mor", "mor", "pla", "pla", "mor", "mor", "pla", "pla", "mor", "mor", "pla", "pla",
    "mor", "mor", "pla", "mor", "pla", "pla", "mor", "mor", "pla", "pla", "mor", "mor", "pla", "pla", "mor", "mor", "pla",
    "pla", "mor", "mor", "pla", "pla", "mor", "mor", "pla", "pla", "mor", "mor", "pla", "pla", "mor", "mor", "pla", "pla",
    "mor", "pla", "mor", "pla", "mor", "mor", "pla", "pla", "mor", "pla", "mor", "mor", "pla", "pla", "mor", "mor", "pla",
    "pla", "mor", "mor", "pla", "pla", "mor", "mor", "pla", "pla", "mor", "mor", "pla", "pla", "mor", "mor", "pla", "pla",
    "mor", "mor", "pla", "pla", "mor", "mor", "pla", "pla", "mor", "pla", "mor", "mor", "pla", "mor", "pla", "mor", "pla",
    "pla", "mor", "mor", "pla", "pla", "mor", "mor", "pla", "pla", "mor", "pla", "mor", "mor", "pla", "mor", "pla", "pla",
    "mor", "pla", "mor", "mor", "pla")
  gender = c(ifelse(subjectinfo$subject < 600, "male", "female"))
  )