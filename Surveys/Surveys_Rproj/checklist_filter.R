
## Filter cldata

# Create dataset to be filtered
cldata_filtered <- cldata

# Remove 514
cldata_filtered <- cldata_filtered[cldata_filtered$subject != "514", ]

# Remove nonresponses
cldata_filtered$vas[cldata_filtered$vas == -10] <- NA

# Split data into questions about state, and questions about pills
cldata_pillqs <- cldata_filtered[cldata_filtered$item == "effect_pill" | cldata_filtered$item == "like_pill" | cldata_filtered$item == "retake_pill" | cldata_filtered$item == "dislike_pill", ]
cldata_pillqs <- cldata_pillqs[cldata_pillqs$block != 1, ]

cldata_stateqs <- cldata_filtered[cldata_filtered$item != "effect_pill" & cldata_filtered$item != "like_pill" & cldata_filtered$item != "retake_pill" & cldata_filtered$item != "dislike_pill", ]




# Identify subjects with missing data
# for (ptp in c(unique(cldata$subject))) {
#   if (length(cldata$subject[cldata$subject==ptp]) < 126) {
#     print(ptp)#cldata_filtered <- cldata_filtered[!cldata$subject==ptp]
#   }
# }


