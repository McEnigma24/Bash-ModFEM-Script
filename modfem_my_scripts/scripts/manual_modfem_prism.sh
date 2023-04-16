#!/bin/bash

cd work_speed_up
imie_nazwisko=$(cat imie_nazwiko_config)
cd ..

echo ModFEM starting...
cd ..
 ~/ModFEM/bin_cmake/"$imie_nazwisko"_nompi_none_gcc_g++/MOD_FEM_heat_prism_std .
