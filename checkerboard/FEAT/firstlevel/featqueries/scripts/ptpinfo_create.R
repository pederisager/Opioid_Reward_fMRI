ptpinfo <- read.table("druglist.txt")

ptpinfo$sex <- ifelse(ptpinfo$ptp > 536, "female", "male")
