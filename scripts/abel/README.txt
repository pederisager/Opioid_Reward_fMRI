########################################################
#						       #
#		THE ABEL COMPUTING CLUSTER	       #
#						       #
########################################################

DESCRIPTION

The Abel computing cluster is UiO's local supercomputer.
It provides a large amount of processing power, and is
especially useful for parallel processing analyses of
multiple subjects at once, like first level feat.

Using Abel correctly can be complicated, and reqires an
account provided by hpc-drift@usit.uio.no.
If you are able to do analyses using Abel, feel free to
use the scripts provided in this directory.

Abel works really well with large files, but not so well
with very many small files. That is why you will see 
many feat directories etc contained within tar archives
here.

For detailed information about Abel and how to use it,
consult:
ABEL_USERGUIDE.docx
or
http://www.uio.no/english/services/it/research/hpc/abel/

For technical support:
1. Consult the userguide
2. Consult the FAQ section on the web page
3. Contact Abel support at hpc-drift@usit.uio.no


########################################################

BRIEF SCRIPT DECRIPTIONS

An overview and short description of the scripts found 
in this directory.

FEAT
	firstlvl_submitscript	- Script submitted to Abel for running multiple instances of firstlvl_workerscript (e.g. one for each subject)
	firstlvl_workerscript	- Run feat on a spicific set of files
	higherlvl_submitscript	- Script submitted to Abel for running higher level feat analysis
