########################################################
#						       #
# DATA DIRECTORIES FOR OPIOID & REWARD fMRI EXPERIMENT #
# 	    HEDONIC PHARMACOLOGY LAB		       #
#						       #
########################################################

(folder = directory)

DIRECTORY LOGIC:

Opioid_Reward_fMRI/ contains separate data folders 
for each task, as well as 3D_and_BET containg the 
structural MRIs for each participant, and a backup
directory for all raw data. 

Each task directory contains a README.txt file that
contains a short description of the task, the contents
of the directory and a log of the activity in the 
directory. 

There are three versions of this file system. One on
dropbox, one on lagringhotellet, and one on Abel. 
The three versions should have the same directories, 
but not the same files. There are no raw or MRI data
on dropbox. There are only data relevant for fMRI 
analyses on Abel. Lagringshotellet is updated from 
time to time and should contain all files from both
dropbox and Abel, as well as a backup of the raw data.

Please do not change folder names in the first level
of the file system, and try to keep changes to 
directory-names in general to a minimum. This will make 
synchronization between mirrors of the system (on
dropbox, on lagringshotellet, on Abel etc. much easier).

Avoid capital letters and spaces in directory names if
the directory contains data and analyses. This makes
the directory much easier to work with from a
command line.

######################################################


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
rsync is a quite powerful and flexible way of syncronizing file systems. 
Documentation of this program can be found online. 
Be very careful when using this feature however,
as it can potentially override important information. 
To be safe, try to only rsync the specific files you want,
and be sure that you don't rsync the hidden .git folder.

######################################################
