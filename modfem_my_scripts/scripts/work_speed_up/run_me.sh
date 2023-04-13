#!/bin/bash
dest=~/DATA

if [ -d $dest ]; then
    echo -n ""
  else 
    mkdir $dest
fi

previous_path=$PWD
cd $dest
rm *.txt
cd $previous_path

limit_m=1
if [[ $1 -ne 0 ]];
  then   
  limit_m=$1
fi

for (( c=0; c<=$limit_m; c++ ))
 do
    ./from_folder_to_one_big_folder_modfem_prism_std.sh $c $c
 done
