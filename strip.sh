#!/bin/bash

#vmd -dispdev text -e indices.tcl 2> indices.txt

SAV=/Scratch/ugochi/mglur1/analysis/PCA/PROA
DIR=/Scratch/ugochi/mglur1/0perW7/dcd
DIR2=/Scratch/ugochi/mglur1/10perW7/dcd
DIR3=/Scratch/ugochi/mglur1/25perW7/dcd
s=""
for i in `seq 0 0`
do

    catdcd -o $SAV/0.proa.ca.dcd -i indices0perW7_proa.txt $DIR/0perW7.dcd
    catdcd -o $SAV/0.prob.ca.dcd -i indices0perW7_prob.txt $DIR/0perW7.dcd
    catdcd -o $SAV/0.all.ca.dcd -i indices0perW7_all.txt $DIR/0perW7.dcd
    catdcd -o $SAV/10.proa.ca.dcd -i indices10perW7_proa.txt $DIR2/10perW7.dcd
    catdcd -o $SAV/10.prob.ca.dcd -i indices10perW7_prob.txt $DIR2/10perW7.dcd
    catdcd -o $SAV/10.all.ca.dcd -i indices10perW7_all.txt $DIR2/10perW7.dcd
    catdcd -o $SAV/25.proa.ca.dcd -i indices25perW7_proa.txt $DIR3/25perW7.dcd
    catdcd -o $SAV/25.prob.ca.dcd -i indices25perW7_prob.txt $DIR3/25perW7.dcd
    catdcd -o $SAV/25.all.ca.dcd -i indices25perW7_all.txt $DIR3/25perW7.dcd
    s="$s $SAV/$i/SM.$j.ca.dcd"
done

sudo prody catdcd -o proa_all.dcd --psf 0perW7_proa.ca.psf --stride 1 0.proa.ca.dcd 10.proa.ca.dcd 25.proa.ca.dcd
sudo prody catdcd -o prob_all.dcd --psf 0perW7_prob.ca.psf --stride 1 0.prob.ca.dcd 10.prob.ca.dcd 25.prob.ca.dcd
sudo prody catdcd -o all_all.dcd --psf 0perW7_all.ca.psf --stride 1 0.all.ca.dcd 10.all.ca.dcd 25.all.ca.dcd
