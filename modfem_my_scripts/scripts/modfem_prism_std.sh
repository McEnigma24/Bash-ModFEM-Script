#!/bin/bash

cd work_speed_up
imie_nazwisko=$(cat imie_nazwiko_config)
cd ..

path=~/ModFEM/bin_cmake/"$imie_nazwisko"_nompi_none_gcc_g++/MOD_FEM_heat_prism_std

previous_path=$PWD

#odbieranie parametru
if [ $# -eq 0 ];
  then
    how_many_m=0
else
    how_many_m=$1
fi

##################################################################
# How much time for adaptation #
#__________________________________________________________________
cd ..
echo "unnecessary_ModFEM_info.txt" > input_interactive.txt

for (( c=0; c<$how_many_m; c++))
do
    echo "m" >> input_interactive.txt
done
echo "q" >> input_interactive.txt
#__________________________________________________________________

{ time $path > output_from_modfem.txt ; } 2> time.txt
( grep 'real' time.txt | cut -d "	" -f2 ) > numbers

cut numbers -d "m" -f1 > m
cut numbers -d "m" -f2 > se
cut se -d "s" -f1 > s

sed -i 's/,/./g' s

S_adaptation=$(cat s)
M_adaptation=$(cat m)

rm time.txt
rm numbers; rm m; rm se; rm s;
##################################################################

##################################################################
# How much time for everything #
#__________________________________________________________________
echo "unnecessary_ModFEM_info.txt" > input_interactive.txt

for (( c=0; c<$how_many_m; c++))
do
  echo "m" >> input_interactive.txt
done
echo "s" >> input_interactive.txt


#echo "v" >> input_interactive.txt
echo "q" >> input_interactive.txt
#__________________________________________________________________

echo $how_many_m adaptations
echo -n "ModFEM starting... "
{ time $path > output_from_modfem.txt ; } 2> time.txt
( grep 'real' time.txt | cut -d "	" -f2 ) > numbers

cut numbers -d "m" -f1 > m
cut numbers -d "m" -f2 > se
cut se -d "s" -f1 > s

sed -i 's/,/./g' s

S_full=$(cat s)
M_full=$(cat m)

S=`echo $S_full - $S_adaptation | bc`
M=$((M_full - M_adaptation))

echo " " >> output_from_modfem.txt
echo -n $M m " " >> output_from_modfem.txt
if (( $(echo "$S <  1.0" |bc -l) ));
then
    echo -n "0" >> output_from_modfem.txt
fi
echo $S s >> output_from_modfem.txt

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

echo -n "Total time in sec: " >> output_from_modfem.txt
if [[ $intS -lt 1 ]];
then
    echo -n "0" >> output_from_modfem.txt
fi

echo $S >> output_from_modfem.txt
##################################################################



rm numbers; rm m; rm se; rm s;
rm time.txt
rm input_interactive.txt
rm unnecessary_ModFEM_info.txt
#rm heat*

echo " "
cd $previous_path
./analize.sh

echo " "
echo All done
