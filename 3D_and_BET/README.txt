
This folder contains 
Raw structural MRI images
BET'ed structural MRI images

3D-image name logic:
RR = reoriented
*_brain = skull/head removed


bet recipe for the brain extraction: 
bet 3D.nii.gz 3DRR.nii.gz -f 0.15 -g -0.15 -RB
