#!/bin/sh
export OMP_NUM_THREADS=1,1
export MKL_NUM_THREADS=1
export OMP_STACKSIZE=4G
ulimit -s unlimited

time xtb --input C280.xtb C280.xyz -P 1 --gfn 2 --opt --alpb water > C280.out
