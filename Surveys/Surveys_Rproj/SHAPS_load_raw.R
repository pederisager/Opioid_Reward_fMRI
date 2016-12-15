shapsdata <- read.table(
  paste(subdir,'SHAPS_all_raw.txt', sep=""), 
  header = TRUE, sep = ";", fill = TRUE, na.strings = c("", "#DIV/0!"), dec = ",")

names(shapsdata) <- c("subject", "sex", "block", "session", "drugcode", paste(items$item))
shapsdata[, c("drugcode", "sex")] <- list(NULL)
shapsdata <- shapsdata[complete.cases(shapsdata),]

shapsdata <- gather(shapsdata, item, vas, TV:appreciated, factor_key = TRUE)
shapsdata <- shapsdata[, c("subject", "session", "block", "item", "vas")]
