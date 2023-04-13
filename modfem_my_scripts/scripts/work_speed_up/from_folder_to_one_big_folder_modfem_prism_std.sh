#!/bin/bash

path=~/ModFEM/bin_cmake/wojciech_mackowiak_nompi_none_gcc_g++/MOD_FEM_heat_prism_std
dest=~/DATA

main_path=$PWD

if [ -d $dest ]; then
    echo -n ""
  else 
    mkdir $dest
fi

#odbieranie parametru
how_many_m=1
if [[ "$1" -gt "-1" ]];
  then
    how_many_m=$1
fi

iteration=1
if [[ "$2" -gt "-1" ]];
  then
    iteration=$2
fi

#echo how_many_m $how_many_m
echo iteration $iteration

##################################################################
# How much time for adaptation #
#__________________________________________________________________

#------------------------------------------------------------------
cd ..
cd ..
echo "unnecessary_ModFEM_info.txt" > input_interactive.txt

for (( c=0; c<$how_many_m; c++))
do    
    echo "m" >> input_interactive.txt
done
echo "q" >> input_interactive.txt
#__________________________________________________________________

#cat input_interactive.txt

{ time $path > "$dest"/output_from_modfem_"$iteration".txt ; } 2> time.txt
( grep 'real' time.txt | cut -d "	" -f2 ) > numbers

cut numbers -d "m" -f1 > m
cut numbers -d "m" -f2 > se
cut se -d "s" -f1 > s

sed -i 's/,/./g' s

S_adaptation=$(cat s)
M_adaptation=$(cat m)

rm time.txt
rm numbers; rm m; rm se; rm s;

#------------------------------------------------------------------
#cd folder_with_scripts
##################################################################

##################################################################
# How much time for everything #
#__________________________________________________________________

#------------------------------------------------------------------
#cd ..
echo "unnecessary_ModFEM_info.txt" > input_interactive.txt

for (( c=0; c<$how_many_m; c++))
do
  echo "m" >> input_interactive.txt
done
echo "s" >> input_interactive.txt


#echo "v" >> input_interactive.txt
echo "q" >> input_interactive.txt

#cat input_interactive.txt
#__________________________________________________________________

echo -n "ModFEM starting... "

{ time $path > "$dest"/output_from_modfem_"$iteration".txt ; } 2> time.txt
( grep 'real' time.txt | cut -d "	" -f2 ) > numbers
#rm unnecessary_ModFEM_info.txt

cut numbers -d "m" -f1 > m
cut numbers -d "m" -f2 > se
cut se -d "s" -f1 > s

sed -i 's/,/./g' s

S_full=$(cat s)
M_full=$(cat m)

S=`echo $S_full - $S_adaptation | bc`
M=$((M_full - M_adaptation))

#intSS=${S%.*}

echo " " >> "$dest"/output_from_modfem_"$iteration".txt
echo -n $M m " " >> "$dest"/output_from_modfem_"$iteration".txt
if (( $(echo "$S <  1.0" |bc -l) ));
then
    echo -n "0" >> "$dest"/output_from_modfem_"$iteration".txt
fi
echo $S s >> "$dest"/output_from_modfem_"$iteration".txt

# proba pozbycia sie "-" przed pierwszą iteracją
#if (( $(echo "$S <  0.0" |bc -l) ));
#  then    
#    S=$(( (-1.0)*S ))
#fi

M=$(( 60*M ))
S=`echo $S + $M | bc`

#intS=${S%.*}

echo -n "Total time: "
if (( $(echo "$S <  1.0" |bc -l) ));
then
    echo -n "0"
fi

echo $S > tmp
cut tmp -d "-" -f2 > tmpp
S=$(cat tmpp)
rm tmp; rm tmpp
echo $S

echo -n "Total time in sec: " >> "$dest"/output_from_modfem_"$iteration".txt
if (( $(echo "$S <  1.0" |bc -l) ));
then
    echo -n "0" >> "$dest"/output_from_modfem_"$iteration".txt
fi

echo $S >> "$dest"/output_from_modfem_"$iteration".txt

##################################################################

rm numbers; rm m; rm se; rm s;
rm time.txt
#rm heat*

#------------------------------------------------------------------
#cd folder_with_scripts
rm input_interactive.txt

echo " "

cd $main_path
./param_analize.sh "$dest"/output_from_modfem_"$iteration".txt $iteration

echo " "
echo " "
#echo All done
