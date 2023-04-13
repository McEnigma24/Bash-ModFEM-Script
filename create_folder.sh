#!/bin/bash

echo name
read dir_name

mkdir $dir_name
mkdir $dir_name/scripts
cp -r ~/modfem_my_scripts/. $dir_name/scripts
cp ~/create_folder.sh $dir_name
