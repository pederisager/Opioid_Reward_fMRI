########################################################
#						       #
# DATA DIRECTORIES FOR OPIOID & REWARD fMRI EXPERIMENT #
# 	    HEDONIC PHARMACOLOGY LAB		       #
#						       #
########################################################

LOG YOUR CHANGES:

Whenever you run an anlysis or conduct any changes 
to files, please write a short description of what 
you did in the appropriate task folder README.txt 
in the same way as this example:

DD.MM.YY
Ran analysis X, in folder Y
Created folder Z
Deleted folders A and B
etc... 

######################################################

DIRECTORY LOGIC:

Opioid_Reward_fMRI/ contains separate data folders 
for each task, as well as 3D_and_BET containg the 
structural MRIs for each participant, and a backup
directory for all raw data. 

Each task directory contains a README.txt file that
contains a short description of the task, the contents
of the directory and a log of the activity in the 
directory. 

######################################################

INTEGRATIONS:

GIT
Opioid_Reward_fMRI/ is a Git repository.
See scrips/git/README.txt for further information.
NEVER DELETE the hidden .git folder.
DO NOT DELETE OR EDIT the .gitignore file unless 
you know what you are doing.

ABEL
Data-analysis is partially conducted using the Abel 
computer cluster. See scripts/abel/README.txt for 
further information. 
You will probably find that some folders are in .tar
files or .tar.gz files. This is because Abel works 
much better with few large files than with many small
files. 

RSYNC
rsync is a quite powerful and plexible way of syncronizing file systems. Documentation of this program can be found online. Be very careful when using this feature however,
as it can potentially override important information. 
To be safe, try to only rsync the specific files you want,
and be sure that you don't rsynd the hidden .git folder.

######################################################
