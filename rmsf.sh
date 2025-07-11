#!/bin/bash

# bash, too, uses the same concepts as any other scripting language. Below are arrays that hold information for outputs and also the 
# naming conventions for the two main directories 
a=( "0perW7" "10perW7" "25perW7" ) # this is the naming for outputs (ie which one of the systems, for this - protonation states)

for j in `seq 0 2` # loops through 5 sub directories 
do 


cat > rmsf.tcl << EOF
mol new /Scratch/ugochi/mglur1/${a[j]}/dcd/${a[j]}.psf
mol addfile /Scratch/ugochi/mglur1/${a[j]}/dcd/${a[j]}.pdb
mol addfile /Scratch/ugochi/mglur1/${a[j]}/dcd/${a[j]}.dcd type dcd first 0 last -1 step 1 filebonds 1 autobonds 1 waitfor all


set ref [atomselect 0 "protein and name CA" frame 0]
set sel [atomselect 0 "protein and name CA"]
set all [atomselect 0 "all"]

set num_steps [molinfo 0 get numframes]
for {set frame 0} {\$frame < \$num_steps} {incr frame} {
    \$sel frame \$frame
    \$all frame \$frame
    set trans [measure fit \$sel \$ref]
    \$all move \$trans
}

set rmsf [measure rmsf \$sel first 0 last -1 step 1]
for {set i 0} {\$i < [\$sel num]} {incr i} {
    puts \$outfile "[expr {\$i+581}] [lindex \$rmsf \$i]"



}
quit
EOF

vmd -dispdev text -e rmsf.tcl 2> /Scratch/ugochi/mglur1/analysis/rmsf/${a[j]}_rmsf.txt



done

cat > Water.tcl << EOF

package require pbctools

mol new /Scratch/ugochi/mglur1/${a[j]}/dcd/${a[j]}.psf
mol addfile /Scratch/ugochi/mglur1/${a[j]}/dcd/${a[j]}.dcd type dcd first 0 last -1 step 1 filebonds 1 autobonds 1 waitfor all

pbc wrap -centersel "protein" -center com -compound residue -all
set num_steps [molinfo top get numframes]
set sel [atomselect top "water and same residue as (within 1 of protein and segname PROA) and not (within 6 of lipids) and noh"]
set sel2 [atomselect top "water and same residue as (within 1 of protein and segname PROB) and not (within 6 of lipids) and noh"]
set sel3 [atomselect top "water and same residue as (within 1 of protein) and not (within 6 of lipids) and noh"]
set sel4 [atomselect top "water and same residue as (within 1 of protein and resid 594 595 597 598 601 602 604 605 606 608 609 612 613 615 616 and sidechain) and not (within 6 of lipids) and noh"]
set sel5 [atomselect top "water and same residue as (within 1 of protein and segname PROA and resid 614 625 631 634 638 648 668 671 672 675 678 679 681 682 686 703 707 710 714 757 760 763 764 767 771 777 779 780 781 783 784 787 790 791 794 798 801 805 815 822 823 826 830 831 834 837 838 and sidechain) and not (within 6 of lipids) and noh"]
set sel6 [atomselect top "water and same residue as (within 1 of protein and segname PROB and resid 614 625 631 634 638 648 668 671 672 675 678 679 681 682 686 703 707 710 714 757 760 763 764 767 771 777 779 780 781 783 784 787 790 791 794 798 801 805 815 822 823 826 830 831 834 837 838 and sidechain) and not (within 6 of lipids) and noh"]
set sel7 [atomselect top "water and same residue as (within 1 of protein and segname PROA and resid 637 638 641 660 668 672 756 760 794 801 805 815 818 819 822 and sidechain) and not (within 6 of lipids) and noh"]
set sel8 [atomselect top "water and same residue as (within 1 of protein and segname PROB and resid 637 638 641 660 668 672 756 760 794 801 805 815 818 819 822 and sidechain) and not (within 6 of lipids) and noh"]
set pro [atomselect top "protein and alpha"]
set ref [atomselect top "protein and alpha" frame 0]
for {set frame 0} {\$frame < \$num_steps} {incr frame} {
    \$pro frame \$frame
    \$sel frame \$frame
    \$sel2 frame \$frame
    \$sel3 frame \$frame
    \$sel4 frame \$frame
    \$sel5 frame \$frame
    \$sel6 frame \$frame
    \$sel7 frame \$frame
    \$sel8 frame \$frame
    \$sel update
    \$sel2 update
    \$sel3 update
    \$sel4 update
    \$sel5 update
    \$sel6 update
    \$sel7 update
    \$sel8 update
    \$sel move [measure fit \$pro \$ref]
     set wat [\$sel num]
    \$sel2 move [measure fit \$pro \$ref]
     set wat2 [\$sel2 num]
    \$sel3 move [measure fit \$pro \$ref]
     set wat3 [\$sel3 num]
    \$sel4 move [measure fit \$pro \$ref]
     set wat4 [\$sel4 num]
    \$sel5 move [measure fit \$pro \$ref]
     set wat5 [\$sel5 num]
    \$sel6 move [measure fit \$pro \$ref]
     set wat6 [\$sel6 num]
    \$sel7 move [measure fit \$pro \$ref]
     set wat7 [\$sel7 num]
    \$sel8 move [measure fit \$pro \$ref]
     set wat8 [\$sel8 num]
     puts stderr "\$frame \$wat \$wat2 \$wat3 \$wat4 \$wat5 \$wat6 \$wat7 \$wat8"
}
quit

EOF

cat > Water3.tcl << EOF

package require pbctools

mol new /Scratch/ugochi/mglur1/${a[j]}/dcd/${a[j]}.psf
mol addfile /Scratch/ugochi/mglur1/${a[j]}/dcd/${a[j]}.dcd type dcd first 0 last -1 step 1 filebonds 1 autobonds 1 waitfor all

pbc wrap -centersel "protein" -center com -compound residue -all
set num_steps [molinfo top get numframes]
set sel [atomselect top "water and same residue as (within 3 of protein and segname PROA) and not (within 6 of lipids) and noh"]
set sel2 [atomselect top "water and same residue as (within 3 of protein and segname PROB) and not (within 6 of lipids) and noh"]
set sel3 [atomselect top "water and same residue as (within 3 of protein) and not (within 6 of lipids) and noh"]
set sel4 [atomselect top "water and same residue as (within 3 of protein and resid 594 595 597 598 601 602 604 605 606 608 609 612 613 615 616 and sidechain) and not (within 6 of lipids) and noh"]
set sel5 [atomselect top "water and same residue as (within 3 of protein and segname PROA and resid 614 625 631 634 638 648 668 671 672 675 678 679 681 682 686 703 707 710 714 757 760 763 764 767 771 777 779 780 781 783 784 787 790 791 794 798 801 805 815 822 823 826 830 831 834 837 838 and sidechain) and not (within 6 of lipids) and noh"]
set sel6 [atomselect top "water and same residue as (within 3 of protein and segname PROB and resid 614 625 631 634 638 648 668 671 672 675 678 679 681 682 686 703 707 710 714 757 760 763 764 767 771 777 779 780 781 783 784 787 790 791 794 798 801 805 815 822 823 826 830 831 834 837 838 and sidechain) and not (within 6 of lipids) and noh"]
set sel7 [atomselect top "water and same residue as (within 3 of protein and segname PROA and resid 637 638 641 660 668 672 756 760 794 801 805 815 818 819 822 and sidechain) and not (within 6 of lipids) and noh"]
set sel8 [atomselect top "water and same residue as (within 3 of protein and segname PROB and resid 637 638 641 660 668 672 756 760 794 801 805 815 818 819 822 and sidechain) and not (within 6 of lipids) and noh"]
set pro [atomselect top "protein and alpha"]
set ref [atomselect top "protein and alpha" frame 0]
for {set frame 0} {\$frame < \$num_steps} {incr frame} {
    \$pro frame \$frame
    \$sel frame \$frame
    \$sel2 frame \$frame
    \$sel3 frame \$frame
    \$sel4 frame \$frame
    \$sel5 frame \$frame
    \$sel6 frame \$frame
    \$sel7 frame \$frame
    \$sel8 frame \$frame
    \$sel update
    \$sel2 update
    \$sel3 update
    \$sel4 update
    \$sel5 update
    \$sel6 update
    \$sel7 update
    \$sel8 update
    \$sel move [measure fit \$pro \$ref]
     set wat [\$sel num]
    \$sel2 move [measure fit \$pro \$ref]
     set wat2 [\$sel2 num]
    \$sel3 move [measure fit \$pro \$ref]
     set wat3 [\$sel3 num]
    \$sel4 move [measure fit \$pro \$ref]
     set wat4 [\$sel4 num]
    \$sel5 move [measure fit \$pro \$ref]
     set wat5 [\$sel5 num]
    \$sel6 move [measure fit \$pro \$ref]
     set wat6 [\$sel6 num]
    \$sel7 move [measure fit \$pro \$ref]
     set wat7 [\$sel7 num]
    \$sel8 move [measure fit \$pro \$ref]
     set wat8 [\$sel8 num]
     puts stderr "\$frame \$wat \$wat2 \$wat3 \$wat4 \$wat5 \$wat6 \$wat7 \$wat8"
}
quit

EOF


cat > Water5.tcl << EOF

package require pbctools

mol new /Scratch/ugochi/mglur1/${a[j]}/dcd/${a[j]}.psf
mol addfile /Scratch/ugochi/mglur1/${a[j]}/dcd/${a[j]}.dcd type dcd first 0 last -1 step 1 filebonds 1 autobonds 1 waitfor all

pbc wrap -centersel "protein" -center com -compound residue -all
set num_steps [molinfo top get numframes]
set sel [atomselect top "water and same residue as (within 5 of protein and segname PROA) and not (within 6 of lipids) and noh"]
set sel2 [atomselect top "water and same residue as (within 5 of protein and segname PROB) and not (within 6 of lipids) and noh"]
set sel3 [atomselect top "water and same residue as (within 5 of protein) and not (within 6 of lipids) and noh"]
set sel4 [atomselect top "water and same residue as (within 5 of protein and resid 594 595 597 598 601 602 604 605 606 608 609 612 613 615 616 and sidechain) and not (within 6 of lipids) and noh"]
set sel5 [atomselect top "water and same residue as (within 5 of protein and segname PROA and resid 614 625 631 634 638 648 668 671 672 675 678 679 681 682 686 703 707 710 714 757 760 763 764 767 771 777 779 780 781 783 784 787 790 791 794 798 801 805 815 822 823 826 830 831 834 837 838 and sidechain) and not (within 6 of lipids) and noh"]
set sel6 [atomselect top "water and same residue as (within 5 of protein and segname PROB and resid 614 625 631 634 638 648 668 671 672 675 678 679 681 682 686 703 707 710 714 757 760 763 764 767 771 777 779 780 781 783 784 787 790 791 794 798 801 805 815 822 823 826 830 831 834 837 838 and sidechain) and not (within 6 of lipids) and noh"]
set sel7 [atomselect top "water and same residue as (within 5 of protein and segname PROA and resid 637 638 641 660 668 672 756 760 794 801 805 815 818 819 822 and sidechain) and not (within 6 of lipids) and noh"]
set sel8 [atomselect top "water and same residue as (within 5 of protein and segname PROB and resid 637 638 641 660 668 672 756 760 794 801 805 815 818 819 822 and sidechain) and not (within 6 of lipids) and noh"]
set pro [atomselect top "protein and alpha"]
set ref [atomselect top "protein and alpha" frame 0]
for {set frame 0} {\$frame < \$num_steps} {incr frame} {
    \$pro frame \$frame
    \$sel frame \$frame
    \$sel2 frame \$frame
    \$sel3 frame \$frame
    \$sel4 frame \$frame
    \$sel5 frame \$frame
    \$sel6 frame \$frame
    \$sel7 frame \$frame
    \$sel8 frame \$frame
    \$sel update
    \$sel2 update
    \$sel3 update
    \$sel4 update
    \$sel5 update
    \$sel6 update
    \$sel7 update
    \$sel8 update
    \$sel move [measure fit \$pro \$ref]
     set wat [\$sel num]
    \$sel2 move [measure fit \$pro \$ref]
     set wat2 [\$sel2 num]
    \$sel3 move [measure fit \$pro \$ref]
     set wat3 [\$sel3 num]
    \$sel4 move [measure fit \$pro \$ref]
     set wat4 [\$sel4 num]
    \$sel5 move [measure fit \$pro \$ref]
     set wat5 [\$sel5 num]
    \$sel6 move [measure fit \$pro \$ref]
     set wat6 [\$sel6 num]
    \$sel7 move [measure fit \$pro \$ref]
     set wat7 [\$sel7 num]
    \$sel8 move [measure fit \$pro \$ref]
     set wat8 [\$sel8 num]
     puts stderr "\$frame \$wat \$wat2 \$wat3 \$wat4 \$wat5 \$wat6 \$wat7 \$wat8"
}
quit

EOF

#vmd -dispdev text -e Water.tcl 2> /Scratch/ugochi/mglur1/analysis/water/${a[j]}_water_1A.txt
vmd -dispdev text -e Water3.tcl 2> /Scratch/ugochi/mglur1/analysis/water/${a[j]}_water_3A.txt
vmd -dispdev text -e Water5.tcl 2> /Scratch/ugochi/mglur1/analysis/water/${a[j]}_water_5A.txt

done
