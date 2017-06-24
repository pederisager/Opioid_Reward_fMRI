

# Set parameters ----
excludedsubs <- c(503, 507, 508, 512, 514, 530, 617)#, 532, 622, 504
peristimdata <- "ps_tsplot_zstat1_ev1.txt"

# Load data
roi <- "V1"
side <- "left_thr50"

source("D:/Dropbox/jobb/hedfarmlab/Opioid_Reward_fMRI/checkerboard/FEAT/firstlevel/featqueries/scripts/loaddata.R")
source("D:/Dropbox/jobb/hedfarmlab/Opioid_Reward_fMRI/checkerboard/FEAT/firstlevel/featqueries/scripts/plotcreate.R")


roi <- "V1"
side <- "right_thr50"

source("D:/Dropbox/jobb/hedfarmlab/Opioid_Reward_fMRI/checkerboard/FEAT/firstlevel/featqueries/scripts/loaddata.R")
source("D:/Dropbox/jobb/hedfarmlab/Opioid_Reward_fMRI/checkerboard/FEAT/firstlevel/featqueries/scripts/plotcreate.R")


roi <- "V2"
side <- "left_2mm_thr50"

source("D:/Dropbox/jobb/hedfarmlab/Opioid_Reward_fMRI/checkerboard/FEAT/firstlevel/featqueries/scripts/loaddata.R")
source("D:/Dropbox/jobb/hedfarmlab/Opioid_Reward_fMRI/checkerboard/FEAT/firstlevel/featqueries/scripts/plotcreate.R")


roi <- "V2"
side <- "right_2mm_thr50"

source("D:/Dropbox/jobb/hedfarmlab/Opioid_Reward_fMRI/checkerboard/FEAT/firstlevel/featqueries/scripts/loaddata.R")
source("D:/Dropbox/jobb/hedfarmlab/Opioid_Reward_fMRI/checkerboard/FEAT/firstlevel/featqueries/scripts/plotcreate.R")


roi <- "V3"
side <- "left_2mm_thr50"

source("D:/Dropbox/jobb/hedfarmlab/Opioid_Reward_fMRI/checkerboard/FEAT/firstlevel/featqueries/scripts/loaddata.R")
source("D:/Dropbox/jobb/hedfarmlab/Opioid_Reward_fMRI/checkerboard/FEAT/firstlevel/featqueries/scripts/plotcreate.R")


roi <- "V3"
side <- "right_2mm_thr50"

source("D:/Dropbox/jobb/hedfarmlab/Opioid_Reward_fMRI/checkerboard/FEAT/firstlevel/featqueries/scripts/loaddata.R")
source("D:/Dropbox/jobb/hedfarmlab/Opioid_Reward_fMRI/checkerboard/FEAT/firstlevel/featqueries/scripts/plotcreate.R")


roi <- "V4"
side <- "left_2mm_thr40"

source("D:/Dropbox/jobb/hedfarmlab/Opioid_Reward_fMRI/checkerboard/FEAT/firstlevel/featqueries/scripts/loaddata.R")
source("D:/Dropbox/jobb/hedfarmlab/Opioid_Reward_fMRI/checkerboard/FEAT/firstlevel/featqueries/scripts/plotcreate.R")


roi <- "V4"
side <- "right_2mm_thr40"

source("D:/Dropbox/jobb/hedfarmlab/Opioid_Reward_fMRI/checkerboard/FEAT/firstlevel/featqueries/scripts/loaddata.R")
source("D:/Dropbox/jobb/hedfarmlab/Opioid_Reward_fMRI/checkerboard/FEAT/firstlevel/featqueries/scripts/plotcreate.R")


## PLOTTING

g_legend<-function(a.gplot){
  tmp <- ggplot_gtable(ggplot_build(a.gplot))
  leg <- which(sapply(tmp$grobs, function(x) x$name) == "guide-box")
  legend <- tmp$grobs[[leg]]
  return(legend)}

mylegend<-g_legend(V1left_thr50_gam)



V1to4gam_plot <- grid.arrange(V1left_thr50_gam + theme(legend.position="none", axis.title=element_blank()),
                              V1right_thr50_gam + theme(legend.position="none", axis.title=element_blank()),
                              V2left_2mm_thr50_gam + theme(legend.position="none", axis.title=element_blank()),
                              V2right_2mm_thr50_gam + theme(legend.position="none", axis.title=element_blank()),
                              V3left_2mm_thr50_gam + theme(legend.position="none", axis.title=element_blank()),
                              V3right_2mm_thr50_gam + theme(legend.position="none", axis.title=element_blank()),
                              V4left_2mm_thr40_gam + theme(legend.position="none", axis.title=element_blank()),
                              V4right_2mm_thr40_gam + theme(legend.position="none", axis.title=element_blank()),
                              ncol = 2)

V1to4raw_plot <- grid.arrange(V1left_thr50_raw, 
                              V1right_thr50_raw, V2left_2mm_thr50_raw, V2right_2mm_thr50_raw, V3left_2mm_thr50_raw, V3right_2mm_thr50_raw, V4left_2mm_thr40_raw, V4right_2mm_thr40_raw, ncol = 2)


V1gam_plot <- grid.arrange(V1left_thr50_gam + theme(legend.position="none", axis.title=element_blank()),
                              V1right_thr50_gam + theme(legend.position="none", axis.title=element_blank()),
                              ncol=2)
# Save plots 

tiff("V1to4gam.tiff", height = 12, width = 17, units = 'cm', 
     compression = "lzw", res = 600)
plot(V1to4gam_plot)
dev.off()

tiff("V1to4raw.tiff", height = 12, width = 17, units = 'cm', 
     compression = "lzw", res = 600)
plot(V1to4gam_plot)
dev.off()

tiff("V1gam.tiff", height = 3, width = 20, units = 'cm', 
     compression = "lzw", res = 600)
plot(V1gam_plot)
dev.off()



