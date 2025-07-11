#!/bin/bash

gnuplot << EOF

set size 1.3, 1.5
set terminal postscript eps solid color enhanced lw 1.0 "Times-Roman" 24
set encoding iso_8859_1

set output "fig-proa-pca.ps"
set termoption enhanced
set encoding iso_8859_1
set multiplot layout 1,1
set xtics 1
set ytics out
set xtics nomirror
set ytics nomirror
set xzeroaxis linetype 2 linewidth 1.5
show xzeroaxis
# 3wvf-woloop
set border linewidth 2
set xrange [-2:4]
set yrange [-2:5]
set xlabel "PC1"
set ylabel "PC2"
set nocbtics
unset colorbox
set key
set palette model RGB defined (0 "#ffb6c1",402 "#ff0000",403 "#add8e6",809 "#0000ff", 810 "#ff80ff", 1250 "#f055f0")
set title "protomer A"
plot \
"/Scratch/ugochi/mglur1/analysis/PCA/PROA/projection-proa1.txt" using 1:2:0 with p ps 3 lt 7 palette title "",

set nomultiplot

EOF



ps2epsi fig-proa-pca.ps
epstopdf fig-proa-pca.epsi
rm fig-proa-pca.ps fig-proa-pca.epsi

plot.sh
Displaying plot.sh.
