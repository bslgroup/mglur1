awk "NR>=0 && NR<=402" projection-all1.txt > 0_all.txt
awk "NR>=403 && NR<=809" projection-all1.txt > 10_all.txt
awk "NR>=809 && NR<=1250" projection-all1.txt > 25_all.txt

awk "NR>=0 && NR<=402" projection-proa1.txt > 0_proa.txt
awk "NR>=403 && NR<=809" projection-proa1.txt > 10_proa.txt
awk "NR>=809 && NR<=1250" projection-proa1.txt > 25_proa.txt

awk "NR>=0 && NR<=402" projection-prob1.txt > 0_prob.txt
awk "NR>=403 && NR<=809" projection-prob1.txt > 10_prob.txt
awk "NR>=809 && NR<=1250" projection-prob1.txt > 25_prob.txt
