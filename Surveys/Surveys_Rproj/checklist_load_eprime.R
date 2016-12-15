

checklist_eprime <- read.table(
  paste(subdir,"eprime_data.txt", sep=""), 
  header = TRUE, sep = "\t", fill = TRUE)

names(checklist_eprime) <- c("subject", "session", "item", "vas")
checklist_eprime$block <- 2
checklist_eprime <- checklist_eprime[, c("subject", "session", "block", "item", "vas")]

for (i in 1:length(items$item)) {
  levels(checklist_eprime$item)[levels(checklist_eprime$item)==items$question[i]] <- paste(items$item[i])
} # Renaming the items in the eprime data to the shortened version in items.csv
