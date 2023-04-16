#!/bin/bash

echo name
read dir_name

mkdir $dir_name
cp -r ~/modfem_my_scripts/. $dir_name

ls
echo -n "copy .dat .jk from "
read from

./copy_dat_jk.sh "$from" $dir_name
