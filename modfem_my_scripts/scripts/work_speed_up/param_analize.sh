#!/bin/bash

dest=~/DATA

if [ $# -eq 0 ];
  then   
  echo  "No file to analize"
else

iteration=$2
#if [[ "$2" -gt "-1" ]];
#  then   
#  iteration=$2
#fi

grep "Convergence in GMRES after" $1 > "$dest"/"$iteration"_analized.txt
grep "Norm of preconditioned residual" $1 >> "$dest"/"$iteration"_analized.txt
grep "Total convergence rate" $1 >> "$dest"/"$iteration"_analized.txt
grep "Current ratio" $1 >> "$dest"/"$iteration"_analized.txt
grep "Total time in sec:" $1 >> "$dest"/"$iteration"_analized.txt

cat "$dest"/"$iteration"_analized.txt
fi