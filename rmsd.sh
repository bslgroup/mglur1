#!/bin/bash

# bash, too, uses the same concepts as any other scripting language. Below are arrays that hold information for outputs and also the 
# naming conventions for the two main directories 
#a=( "6al2-woloop" )
a=( "0perW7" "10perW7" "25perW7" ) # this is the naming for outputs (ie which one of the systems, for this - protonation states)
#b=( "rmsd" "rmsf" "angles" "salt") # naming of the output files
#c=( "apo" "substrate" ) # which directory name to look at 

#rm `ls analysis/*.txt` # deletes previous files 
# 581 - 590 = linker region
#731-745 = ECL2 region

for j in `seq 0 2` # loops through 5 sub directories 
do 

#for k in `seq 0 1` # loops through tcl files in script 
#do 

cat > rmsd_PROA.tcl << EOF
mol new /Scratch/ugochi/mglur1/${a[j]}/dcd/${a[j]}.psf
mol addfile /Scratch/ugochi/mglur1/${a[j]}/dcd/${a[j]}.pdb
mol addfile /Scratch/ugochi/mglur1/${a[j]}/dcd/GPCR3-${a[j]}.dcd type dcd first 0 last -1 step 1 filebonds 1 autobonds 1 waitfor all


set helix [atomselect top "protein and segname PROA and resid 581 to 590 and alpha"]
set helix1 [atomselect top "protein and segname PROA and resid 592 to 617 and alpha"]
set helix2 [atomselect top "protein and segname PROA and resid 629 to 649 and alpha"]
set helix3 [atomselect top "protein and segname PROA and resid 654 to 683 and alpha"]
set helix4 [atomselect top "protein and segname PROA and resid 703 to 728 and alpha"]
set helix5 [atomselect top "protein and segname PROA and resid 753 to 772 and alpha"]
set helix6 [atomselect top "protein and segname PROA and resid 784 to 809 and alpha"]
set helix7 [atomselect top "protein and segname PROA and resid 812 to 840 and alpha"]
set helix8 [atomselect top "protein and segname PROA and resid 731 to 745 and alpha"]

#ciregion

set refhelix [atomselect top "protein and segname PROA and resid 581 to 590 and alpha"]
set refhelix1 [atomselect top "protein and segname PROA and resid 592 to 617 and alpha"]
set refhelix2 [atomselect top "protein and segname PROA and resid 629 to 649 and alpha"]
set refhelix3 [atomselect top "protein and segname PROA and resid 654 to 683 and alpha"]
set refhelix4 [atomselect top "protein and segname PROA and resid 703 to 728 and alpha"]
set refhelix5 [atomselect top "protein and segname PROA and resid 753 to 772 and alpha"]
set refhelix6 [atomselect top "protein and segname PROA and resid 784 to 809 and alpha"]
set refhelix7 [atomselect top "protein and segname PROA and resid 812 to 840 and alpha"]
set refhelix8 [atomselect top "protein and segname PROA and resid 731 to 745 and alpha"]



set all [atomselect top "all"]

set num_steps [molinfo 0 get numframes]
for {set frame 1} {\$frame < \$num_steps} {incr frame} {
    \$all frame \$frame
    \$helix frame \$frame
    \$helix1 frame \$frame
    \$helix2 frame \$frame
    \$helix3 frame \$frame
    \$helix4 frame \$frame
    \$helix5 frame \$frame
    \$helix6 frame \$frame
    \$helix7 frame \$frame
    \$helix8 frame \$frame
    set trans [measure fit \$helix \$refhelix]
    \$all move \$trans
    set rmsdh [measure rmsd \$helix \$refhelix]
    #
    set trans [measure fit \$helix1 \$refhelix1]
    \$all move \$trans
    set rmsdh1 [measure rmsd \$helix1 \$refhelix1]
    #
    set trans [measure fit \$helix2 \$refhelix2]
    \$all move \$trans
    set rmsdh2 [measure rmsd \$helix2 \$refhelix2]
    #
    set trans [measure fit \$helix3 \$refhelix3]
    \$all move \$trans
    set rmsdh3 [measure rmsd \$helix3 \$refhelix3]
    #
    set trans [measure fit \$helix4 \$refhelix4]
    \$all move \$trans
    set rmsdh4 [measure rmsd \$helix4 \$refhelix4]
    #
    set trans [measure fit \$helix5 \$refhelix5]
    \$all move \$trans
    set rmsdh5 [measure rmsd \$helix5 \$refhelix5]
    #
    set trans [measure fit \$helix6 \$refhelix6]
    \$all move \$trans
    set rmsdh6 [measure rmsd \$helix6 \$refhelix6]
    #
    set trans [measure fit \$helix7 \$refhelix7]
    \$all move \$trans
    set rmsdh7 [measure rmsd \$helix7 \$refhelix7]
    #
    set trans [measure fit \$helix8 \$refhelix8]
    \$all move \$trans
    set rmsdh8 [measure rmsd \$helix8 \$refhelix8]
     puts stderr "\$frame \$rmsdh \$rmsdh1 \$rmsdh2 \$rmsdh3 \$rmsdh4 \$rmsdh5 \$rmsdh6 \$rmsdh7 \$rmsdh8" 
}
quit



EOF


cat > rmsd_PROB.tcl << EOF
mol new /Scratch/ugochi/mglur1/${a[j]}/dcd/${a[j]}.psf
mol addfile /Scratch/ugochi/mglur1/${a[j]}/dcd/${a[j]}.pdb
mol addfile /Scratch/ugochi/mglur1/${a[j]}/dcd/GPCR3-${a[j]}.dcd type dcd first 0 last -1 step 1 filebonds 1 autobonds 1 waitfor all


set helix [atomselect top "protein and segname PROB and resid 581 to 590 and alpha"]
set helix1 [atomselect top "protein and segname PROB and resid 592 to 617 and alpha"]
set helix2 [atomselect top "protein and segname PROB and resid 629 to 649 and alpha"]
set helix3 [atomselect top "protein and segname PROB and resid 654 to 683 and alpha"]
set helix4 [atomselect top "protein and segname PROB and resid 703 to 728 and alpha"]
set helix5 [atomselect top "protein and segname PROB and resid 753 to 772 and alpha"]
set helix6 [atomselect top "protein and segname PROB and resid 784 to 809 and alpha"]
set helix7 [atomselect top "protein and segname PROB and resid 812 to 840 and alpha"]
set helix8 [atomselect top "protein and segname PROB and resid 731 to 745 and alpha"]

#ciregion

set refhelix [atomselect top "protein and segname PROB and resid 581 to 590 and alpha"]
set refhelix1 [atomselect top "protein and segname PROB and resid 592 to 617 and alpha"]
set refhelix2 [atomselect top "protein and segname PROB and resid 629 to 649 and alpha"]
set refhelix3 [atomselect top "protein and segname PROB and resid 654 to 683 and alpha"]
set refhelix4 [atomselect top "protein and segname PROB and resid 703 to 728 and alpha"]
set refhelix5 [atomselect top "protein and segname PROB and resid 753 to 772 and alpha"]
set refhelix6 [atomselect top "protein and segname PROB and resid 784 to 809 and alpha"]
set refhelix7 [atomselect top "protein and segname PROB and resid 812 to 840 and alpha"]
set refhelix8 [atomselect top "protein and segname PROB and resid 731 to 745 and alpha"]



set all [atomselect top "all"]

set num_steps [molinfo 0 get numframes]
for {set frame 1} {\$frame < \$num_steps} {incr frame} {
    \$all frame \$frame
    \$helix frame \$frame
    \$helix1 frame \$frame
    \$helix2 frame \$frame
    \$helix3 frame \$frame
    \$helix4 frame \$frame
    \$helix5 frame \$frame
    \$helix6 frame \$frame
    \$helix7 frame \$frame
    \$helix8 frame \$frame
    set trans [measure fit \$helix \$refhelix]
    \$all move \$trans
    set rmsdh [measure rmsd \$helix \$refhelix]
    #
    set trans [measure fit \$helix1 \$refhelix1]
    \$all move \$trans
    set rmsdh1 [measure rmsd \$helix1 \$refhelix1]
    #
    set trans [measure fit \$helix2 \$refhelix2]
    \$all move \$trans
    set rmsdh2 [measure rmsd \$helix2 \$refhelix2]
    #
    set trans [measure fit \$helix3 \$refhelix3]
    \$all move \$trans
    set rmsdh3 [measure rmsd \$helix3 \$refhelix3]
    #
    set trans [measure fit \$helix4 \$refhelix4]
    \$all move \$trans
    set rmsdh4 [measure rmsd \$helix4 \$refhelix4]
    #
    set trans [measure fit \$helix5 \$refhelix5]
    \$all move \$trans
    set rmsdh5 [measure rmsd \$helix5 \$refhelix5]
    #
    set trans [measure fit \$helix6 \$refhelix6]
    \$all move \$trans
    set rmsdh6 [measure rmsd \$helix6 \$refhelix6]
    #
    set trans [measure fit \$helix7 \$refhelix7]
    \$all move \$trans
    set rmsdh7 [measure rmsd \$helix7 \$refhelix7]
    #
    set trans [measure fit \$helix8 \$refhelix8]
    \$all move \$trans
    set rmsdh8 [measure rmsd \$helix8 \$refhelix8]
     puts stderr "\$frame \$rmsdh \$rmsdh1 \$rmsdh2 \$rmsdh3 \$rmsdh4 \$rmsdh5 \$rmsdh6 \$rmsdh7 \$rmsdh8" 
}
quit


EOF



cat > rmsd_protein.tcl << EOF
mol new /Scratch/ugochi/mglur1/${a[j]}/dcd/${a[j]}.psf
mol addfile /Scratch/ugochi/mglur1/${a[j]}/dcd/${a[j]}.pdb
mol addfile /Scratch/ugochi/mglur1/${a[j]}/dcd/GPCR3-${a[j]}.dcd type dcd first 0 last -1 step 1 filebonds 1 autobonds 1 waitfor all


set helix [atomselect top "protein and resid 581 to 590 and alpha"]
set helix1 [atomselect top "protein and resid 592 to 617 and alpha"]
set helix2 [atomselect top "protein and resid 629 to 649 and alpha"]
set helix3 [atomselect top "protein and resid 654 to 683 and alpha"]
set helix4 [atomselect top "protein and resid 703 to 728 and alpha"]
set helix5 [atomselect top "protein and resid 753 to 772 and alpha"]
set helix6 [atomselect top "protein and resid 784 to 809 and alpha"]
set helix7 [atomselect top "protein and resid 812 to 840 and alpha"]
set helix8 [atomselect top "protein and resid 731 to 745 and alpha"]

#ciregion

set refhelix [atomselect top "protein and resid 581 to 590 and alpha"]
set refhelix1 [atomselect top "protein and resid 592 to 617 and alpha"]
set refhelix2 [atomselect top "protein and resid 629 to 649 and alpha"]
set refhelix3 [atomselect top "protein and resid 654 to 683 and alpha"]
set refhelix4 [atomselect top "protein and resid 703 to 728 and alpha"]
set refhelix5 [atomselect top "protein and resid 753 to 772 and alpha"]
set refhelix6 [atomselect top "protein and resid 784 to 809 and alpha"]
set refhelix7 [atomselect top "protein and resid 812 to 840 and alpha"]
set refhelix8 [atomselect top "protein and resid 731 to 745 and alpha"]



set all [atomselect top "all"]

set num_steps [molinfo 0 get numframes]
for {set frame 1} {\$frame < \$num_steps} {incr frame} {
    \$all frame \$frame
    \$helix frame \$frame
    \$helix1 frame \$frame
    \$helix2 frame \$frame
    \$helix3 frame \$frame
    \$helix4 frame \$frame
    \$helix5 frame \$frame
    \$helix6 frame \$frame
    \$helix7 frame \$frame
    \$helix8 frame \$frame
    set trans [measure fit \$helix \$refhelix]
    \$all move \$trans
    set rmsdh [measure rmsd \$helix \$refhelix]
    #
    set trans [measure fit \$helix1 \$refhelix1]
    \$all move \$trans
    set rmsdh1 [measure rmsd \$helix1 \$refhelix1]
    #
    set trans [measure fit \$helix2 \$refhelix2]
    \$all move \$trans
    set rmsdh2 [measure rmsd \$helix2 \$refhelix2]
    #
    set trans [measure fit \$helix3 \$refhelix3]
    \$all move \$trans
    set rmsdh3 [measure rmsd \$helix3 \$refhelix3]
    #
    set trans [measure fit \$helix4 \$refhelix4]
    \$all move \$trans
    set rmsdh4 [measure rmsd \$helix4 \$refhelix4]
    #
    set trans [measure fit \$helix5 \$refhelix5]
    \$all move \$trans
    set rmsdh5 [measure rmsd \$helix5 \$refhelix5]
    #
    set trans [measure fit \$helix6 \$refhelix6]
    \$all move \$trans
    set rmsdh6 [measure rmsd \$helix6 \$refhelix6]
    #
    set trans [measure fit \$helix7 \$refhelix7]
    \$all move \$trans
    set rmsdh7 [measure rmsd \$helix7 \$refhelix7]
    #
    set trans [measure fit \$helix8 \$refhelix8]
    \$all move \$trans
    set rmsdh8 [measure rmsd \$helix8 \$refhelix8]
     puts stderr "\$frame \$rmsdh \$rmsdh1 \$rmsdh2 \$rmsdh3 \$rmsdh4 \$rmsdh5 \$rmsdh6 \$rmsdh7 \$rmsdh8" 
}
quit



EOF

vmd -dispdev text -e rmsd_PROA.tcl 2> ${a[j]}_rmsd_PROA.txt

vmd -dispdev text -e rmsd_PROB.tcl 2> ${a[j]}_rmsd_PROB.txt

vmd -dispdev text -e rmsd_protein.tcl 2> ${a[j]}_rmsd_protein.txt




done

