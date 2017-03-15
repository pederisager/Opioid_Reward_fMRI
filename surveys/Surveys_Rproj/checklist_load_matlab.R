checklist_matlab <- read.table(
  paste(subdir,'matlab_data.txt', sep=""), 
  header = FALSE, sep = "\t", fill = TRUE)

names(checklist_matlab) <- c("subject", "date", "group", "sex", "age", "redund", "block", "session", paste(items$item))
checklist_matlab[, c("date", "group", "sex", "age", "redund")] <- list(NULL)

checklist_matlab <- gather(checklist_matlab, item, vas, feel_good:retake_pill, factor_key = TRUE)
checklist_matlab <- checklist_matlab[, c("subject", "session", "block", "item", "vas")]
checklist_matlab$vas <- checklist_matlab$vas * 10 # multiplying by 10 to fit eprime data