#!/bin/bash

gnuplot << EOF

set size 1,1.1
set terminal postscript eps size 4,3.2 solid color enhanced lw 2.0 "Times-Roman" 32 

set termoption enhanced
set encoding iso_8859_1
#set key right top
#set key right top samplen 1.4 spacing 1.0 font ",28"
set key at 1,11.2 right top samplen 1.4 spacing 1.0 font ",28"

set key vertical maxrows 5

set bmargin 4

set output "fig-all-rmsd_pca_mglur1.ps"

set multiplot


set origin 0,1
set macros
POS2 = "at graph 0.0001,1.08 font ',36'"
POS3 = "at graph 0.3,1.08 font ',36'"
set label 1 'A' @POS2
set label 2 'Protomer A' @POS3
#set xlabel "" offset 0,-0.8 font ",50"
set xlabel "PC1 (\305)" offset 0,0.1 font ",40"
set ylabel "PC2 (\305)" offset 0,0.1 font ",40"
# 3wvf-woloop
set border linewidth 2
set xrange [-2:5]
set yrange [-2:5]
set xtics 2
set ytics 2
set nocbtics
#set arrow from X1,Y1 to X2,Y2 lc rgb "#00ff00" nohead
#set arrow from -4,2.5 to 2.5,-4 lc rgb "#00ff00" lw 2 nohead
unset colorbox
set key
#set palette model RGB defined (0 "#ffb6c1",402 "#ff0000",403 "#add8e6",809 "#0000ff", 810 "#ff80ff", 1250 "#f055f0")
set palette model RGB defined (0 "#ffb6c1",402 "#ff0000",403 "#add8e6",809 "#0000ff", 810 "#ff80ff", 1250 "#f055f0")
#set label 2 "Mglur1" 
#set title "Protomer A"
plot \
"/Scratch/ugochi/mglur1/analysis/PCA/PROA/projection-proa1.txt" using 1:2:0 with p ps 1 lt 7 palette notitle,

set origin 0,0
set label 1 'D' @POS2
unset label 2 'Protomer A' @POS3
#set xlabel "" offset 0,-0.8 font ",50"
set xlabel "Time ({/Symbol m}s)" offset 0,0.1 font ",40"
set ylabel "RMSD (\305)" offset 0,0.1 font ",40"
# 3wvf-woloop
set border linewidth 2
set xrange [0:1]
set yrange [0:6]
set xtics .2
set ytics 1
set nocbtics
unset colorbox
set key
#set palette model RGB defined (0 "#ffb6c1",402 "#ff0000")
unset label 2
unset title
plot \
"/Scratch/ugochi/mglur1/analysis/rmsd/0perW7_rmsd_PROA.txt" u (\$1*1/402):2 w l lc rgb "#ff0000" notitle,"/Scratch/ugochi/mglur1/analysis/rmsd/10perW7_rmsd_PROA.txt" u (\$1*1/407):2 w l lc rgb "#0000ff" notitle,"/Scratch/ugochi/mglur1/analysis/rmsd/25perW7_rmsd_PROA.txt" u (\$1*1/407):2 w l lc rgb "#ff00ff" notitle,
#################################################################################
set origin 1,1
set label 1 'B' @POS2
set label 2 'Protomer B' @POS3
set xlabel "" offset 0,-0.8 font ",50"
set xlabel "PC1 (\305)" offset 0,0.1 font ",40"
set ylabel "PC2 (\305)" offset 0,0.1 font ",40"
# 3wvf-woloop
set border linewidth 2
set xrange [-2:5]
set yrange [-2:5]
set xtics 2
set ytics 2
set nocbtics
unset ylabel
unset colorbox
set key
set palette model RGB defined (0 "#ffb6c1",402 "#ff0000",403 "#add8e6",809 "#0000ff", 810 "#ff80ff", 1250 "#f055f0")
#set label 2 "MgluR1"
#set title "Protomer B"
plot \
"/Scratch/ugochi/mglur1/analysis/PCA/PROA/projection-prob1.txt" using 1:2:0 with p ps 1 lt 7 palette notitle,

set origin 1,0
set label 1 'E' @POS2
unset label 2 'Protomer B' @POS3
set xlabel "Time ({/Symbol m}s)" offset 0,0.1 font ",40"
set ylabel "RMSD (\305)" offset 0,0.1 font ",40"
# 3wvf-woloop
set border linewidth 2
set xrange [0:1]
set yrange [0:6]
set xtics .2
set ytics 1
set nocbtics
unset colorbox
set key
#set palette model RGB defined (0 "#ffb6c1",402 "#ff0000")
unset label 2
unset title
unset ylabel
plot \
"/Scratch/ugochi/mglur1/analysis/rmsd/0perW7_rmsd_PROB.txt" u (\$1*1/402):2 w l lc rgb "#ff0000" t "0%CHOL","/Scratch/ugochi/mglur1/analysis/rmsd/10perW7_rmsd_PROB.txt" u (\$1*1/407):2 w l lc rgb "#0000ff" t "10%CHOL","/Scratch/ugochi/mglur1/analysis/rmsd/25perW7_rmsd_PROB.txt" u (\$1*1/407):2 w l lc rgb "#ff00ff" t "25%CHOL",
#####################################################################################
set origin 2,1
set label 1 'C' @POS2
set label 2 'Protein' @POS3
set xlabel "" offset 0,-0.8 font ",50"
set xlabel "PC1 (\305)" offset 0,0.1 font ",40"
set ylabel "PC2 (\305)" offset 0,0.1 font ",40"
# 3wvf-woloop
set border linewidth 2
set xrange [-2:5]
set yrange [-2:5]
set xtics 2
set ytics 2
set nocbtics
unset colorbox
set key
unset ylabel
set palette model RGB defined (0 "#ffb6c1",402 "#ff0000",403 "#add8e6",809 "#0000ff", 810 "#ff80ff", 1250 "#f055f0")
#set label 2 "Mglur1"
#set title "Protein" 
plot \
"/Scratch/ugochi/mglur1/analysis/PCA/PROA/projection-all1.txt" using 1:2:0 with p ps 1 lt 7 palette notitle,

set origin 2,0
set label 1 'F' @POS2
unset label 2 'Protein' @POS3
set xlabel "Time ({/Symbol m}s)" offset 0,0.1 font ",40"
set ylabel "RMSD (\305)" offset 0,0.1 font ",40"
# 3wvf-woloop
set border linewidth 2
set xrange [0:1]
set yrange [0:6]
set xtics .2
set ytics 1
set nocbtics
unset colorbox
set key
#set palette model RGB defined (0 "#ffb6c1",402 "#ff0000")
unset label 2
unset title
unset ylabel
plot \
"/Scratch/ugochi/mglur1/analysis/rmsd/0perW7_rmsd_protein.txt" u (\$1*1/402):2 w l lc rgb "#ff0000" notitle,"/Scratch/ugochi/mglur1/analysis/rmsd/10perW7_rmsd_protein.txt" u (\$1*1/407):2 w l lc rgb "#0000ff" notitle,"/Scratch/ugochi/mglur1/analysis/rmsd/25perW7_rmsd_protein.txt" u (\$1*1/407):2 w l lc rgb "#ff00ff" notitle,

#####################################################################################################################################################

set nomultiplot

EOF

ps2epsi fig-all-rmsd_pca_mglur1.ps
epstopdf fig-all-rmsd_pca_mglur1.epsi
rm *ps *psi
gnome-open fig-all-rmsd_pca_mglur1.pdf

