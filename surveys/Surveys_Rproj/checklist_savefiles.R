write.table(cldata, file = "checklist/cldata.txt", sep = "\t", dec = ".", na = "missing", row.names = FALSE)

write.table(cldata_stateqs, file = "checklist/cldata_stateqs.txt", sep = "\t", dec = ".", na = "missing", row.names = FALSE)

write.table(cldata_stateqs, file = "checklist/cldata_pillqs.txt", sep = "\t", dec = ".", na = "missing", row.names = FALSE)


# Writing table(s) for analysis in SPSS

# Long format (feel_good as an example here):
write.table(cldata_stateqs[cldata_stateqs$item == "feel_good", ], file = "checklist/cldata_feelgood.txt", sep = "\t", dec = ".", na = "missing", row.names = FALSE)


# Loop through creation of wide format txt-files for all state questions
for (question in unique(cldata_stateqs$item)){
  data_wide <- cldata_stateqs[cldata_stateqs$item == question, ]
  data_wide <- reshape(data = data_wide, timevar = c("block"), idvar = c("drug", "subject", "sex", "age", "weight", "height"), direction = "wide", drop = c("session", "item", "birth_control", "cycle_phase"))
  data_wide <- reshape(data = data_wide, timevar = c("drug"), idvar = c("subject", "sex", "age", "weight", "height"), direction = "wide")
  write.table(data_wide, file = paste("checklist/cldata_", question, "_wide.txt", sep = ""), sep = "\t", dec = ".", na = "999", row.names = FALSE, quote = TRUE)
}

# Loop through creation of wide format txt-files for all pill questions
for (question in unique(cldata_pillqs$item)){
  data_wide <- cldata_pillqs[cldata_pillqs$item == question, ]
  data_wide <- reshape(data = data_wide, timevar = c("block"), idvar = c("drug", "subject", "sex", "age", "weight", "height"), direction = "wide", drop = c("session", "item", "birth_control", "cycle_phase"))
  data_wide <- reshape(data = data_wide, timevar = c("drug"), idvar = c("subject", "sex", "age", "weight", "height"), direction = "wide")
  write.table(data_wide, file = paste("checklist/cldata_", question, "_wide.txt", sep = ""), sep = "\t", dec = ".", na = "999", row.names = FALSE, quote = TRUE)
}