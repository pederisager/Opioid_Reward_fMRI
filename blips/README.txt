This folder contains topup results for blip images for all participants. 
This data will be used to calculate and reduce warping in the raw task fMRI data, using the applytopup function. 

The topup command used for each session was: 
topup --imain=AP_PA.nii.gz --datain=acq_param.txt --config=b02b0.cnf --out=my_topup_results --iout=blip_AP_PA_unwarped
