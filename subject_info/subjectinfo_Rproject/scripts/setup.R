subjectinfo <- read.csv("../subject_infosheet.csv", header = TRUE, sep = ";")


excludedsubs <- c(503, 507, 508, 514, 530)
subjectinfo <- subjectinfo[!(subjectinfo$subject == excludedsubs),]

library(ggplot2)


