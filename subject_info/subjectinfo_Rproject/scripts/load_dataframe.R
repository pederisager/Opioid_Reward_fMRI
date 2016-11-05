subjectinfo <- read.csv("../subject_infosheet.csv", sep = ";")

subjectinfo$sex <- ifelse(subjectinfo$subject < 600, "male", "female")
  