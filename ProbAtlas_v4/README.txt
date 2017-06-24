This folder contains a probabilistic fMRI atlas of visual areas, in 1mm resolution, ready for implementation in FSL. 
Consult the paper "Probabilistic Maps of Visual Topography in Human Cortex" for details on the procedure. 

File/folder descriptions:

- ROIfiles_Labeling.txt: Describes which area is denoted by each image in the subj_vol_all directory. 
- subj_vol_all: Contains numerated .nii.gz probabilistic masks for all the ROIs covered in the atlas. 
- prepared_ROIs: Contains ROIs resampled to 2mm MNI standard space, for use in our analyses. 



ROI preparation:

#To rescale the ROI voxel dimensions to 2x2x2 mm: 

flirt -in <infput ROI> -ref <input ROI> -out <name of output ROI> -applyisoxfm 2


#To combine several ROIs:

fslmaths <ROI 1> -add <ROI 2> <outputfile>
