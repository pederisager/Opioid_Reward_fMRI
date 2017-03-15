

## Loop through all Observe and Regulate EVs and construct Food Wanting and Regulate Success EVs

attach(scannervas_long)
# For all included subjects
for (subj in unique(subject)) {
  
  # For all sessions
  for (sess in unique(session)) {
    
    # For all the conditions (Observe/Regulate)
    for (cond in unique(condition)) {
      
      # Load the EV file
      assign(
        x = "EV",
        value = read.table(file = paste("EVs/session",sess,"/",subj,"/",cond,"_",subj,".txt", sep = ""))
      )
      
      # Create either a FoodWanting or a RegSuccess EV and put it in the appropriate directory
      
      if (cond=="Observer"){
        EV$V3 <- demvas[subject==subj & session==sess & condition==cond] # Substitute 1s in V3 with demeaned vas variance
        assign(paste("FoodWanting","_",subj,"_",sess, sep = ""), EV) # Create a variable for visual inspection
        
        # Write the new EV content to a txt file, for use in first level FEAT
        write.table(
          x = EV,
          file = paste("EVs/session",sess,"/",subj,"/","FoodWanting","_",subj,".txt", sep = ""),
          sep = "\t",
          dec = ".",
          row.names = FALSE, col.names = FALSE
        )
      }
      if (cond=="Reguler"){
        EV <- EV[,c(1,2)]
        EV$V3 <- -demvas[subject==subj & session==sess & condition==cond]
        assign(paste("RegSuccess","_",subj,"_",sess, sep = ""), EV)
        
        write.table(
          x = EV,
          file = paste("EVs/session",sess,"/",subj,"/","RegSuccess","_",subj,".txt", sep = ""),
          sep = "\t",
          dec = ".",
          row.names = FALSE, col.names = FALSE
        )
      }
    }
  }
}

## Load and combine the condition-separated VAS and instruct EVs. Then save the combined EVs in the appropriate session/subject directory

#attach(scannervas_long)
# For all included subjects
for (subj in unique(subject)) {
  
  # For all sessions
  for (sess in unique(session)) {
    
    
    # Load the relevant EVs
    assign(
      x = "EVinstrreg",
      value = read.table(file = paste("EVs/session",sess,"/",subj,"/","Reguler","_instruct_",subj,".txt", sep = ""))
    )
    assign(
      x = "EVinstrobs",
      value = read.table(file = paste("EVs/session",sess,"/",subj,"/","Observer","_instruct_",subj,".txt", sep = ""))
    )
    assign(
      x = "EVvasreg",
      value = read.table(file = paste("EVs/session",sess,"/",subj,"/","Reguler","_VAS_",subj,".txt", sep = ""))
    )
    assign(
      x = "EVvasobs",
      value = read.table(file = paste("EVs/session",sess,"/",subj,"/","Observer","_VAS_",subj,".txt", sep = ""))
    )
    
    # Combine EVs
    EVinst <- rbind(EVinstrobs, EVinstrreg)
    EVvas <- rbind(EVvasobs, EVvasreg)
    
    # Save combined vas and instruct EVs as tab delimited .txt file
    # Save the instruct EV
    write.table(
      x = EVinst,
      file = paste("EVs/session",sess,"/",subj,"/","Instruct","_",subj,".txt", sep = ""),
      sep = "\t",
      dec = ".",
      row.names = FALSE, col.names = FALSE
    )
    # Save the VAS EV as tab delimited .txt file
    write.table(
      x = EVvas,
      file = paste("EVs/session",sess,"/",subj,"/","VAS","_",subj,".txt", sep = ""),
      sep = "\t",
      dec = ".",
      row.names = FALSE, col.names = FALSE
    )
  }
}

