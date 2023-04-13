#!/bin/bash

cd ..
grep "Convergence in GMRES after" output_from_modfem.txt > analized_output.txt
grep "Norm of preconditioned residual" output_from_modfem.txt >> analized_output.txt
grep "Total convergence rate" output_from_modfem.txt >> analized_output.txt
grep "Current ratio" output_from_modfem.txt >> analized_output.txt
grep "Total time in sec:" output_from_modfem.txt >> analized_output.txt

cat analized_output.txt
