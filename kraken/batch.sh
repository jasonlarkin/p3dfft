#!/bin/csh
#PBS -q small
#PBS -N p3dfft-test
#PBS -l size=1032
#PBS -l walltime=0:20:00
#PBS -V
#PBS -M djchen@ucsd.edu
#PBS -m abe
#PBS -o /lustre/scratch/djchen/logs/output
#PBS -e /lustre/scratch/djchen/logs/error
cd /lustre/scratch/djchen/p3dfft-test
cd /lustre/scratch/djchen/p3dfft-test/test0-default/sample
echo 3 2 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t0-default-3_2-1024_1024_1024_1024_2_1-test_inverse_c.x.log
aprun -n 6 test_inverse_c.x > /lustre/scratch/djchen/logs/t0-default-3_2-1024_1024_1024_1024_2_1-test_inverse_c.x.log
if($? > 0) then
echo t0-default-3_2-1024_1024_1024_1024_2_1-test_inverse_c.x ERROR
else
echo t0-default-3_2-1024_1024_1024_1024_2_1-test_inverse_c.x OK
endif
echo 2 3 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t0-default-2_3-1024_1024_1024_1024_2_1-test_inverse_c.x.log
aprun -n 6 test_inverse_c.x > /lustre/scratch/djchen/logs/t0-default-2_3-1024_1024_1024_1024_2_1-test_inverse_c.x.log
if($? > 0) then
echo t0-default-2_3-1024_1024_1024_1024_2_1-test_inverse_c.x ERROR
else
echo t0-default-2_3-1024_1024_1024_1024_2_1-test_inverse_c.x OK
endif
echo 2 2 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t0-default-2_2-1024_1024_1024_1024_2_1-test_inverse_c.x.log
aprun -n 4 test_inverse_c.x > /lustre/scratch/djchen/logs/t0-default-2_2-1024_1024_1024_1024_2_1-test_inverse_c.x.log
if($? > 0) then
echo t0-default-2_2-1024_1024_1024_1024_2_1-test_inverse_c.x ERROR
else
echo t0-default-2_2-1024_1024_1024_1024_2_1-test_inverse_c.x OK
endif
echo 1 4 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t0-default-1_4-1024_1024_1024_1024_2_1-test_inverse_c.x.log
aprun -n 4 test_inverse_c.x > /lustre/scratch/djchen/logs/t0-default-1_4-1024_1024_1024_1024_2_1-test_inverse_c.x.log
if($? > 0) then
echo t0-default-1_4-1024_1024_1024_1024_2_1-test_inverse_c.x ERROR
else
echo t0-default-1_4-1024_1024_1024_1024_2_1-test_inverse_c.x OK
endif
echo 4 1 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t0-default-4_1-1024_1024_1024_1024_2_1-test_inverse_c.x.log
aprun -n 4 test_inverse_c.x > /lustre/scratch/djchen/logs/t0-default-4_1-1024_1024_1024_1024_2_1-test_inverse_c.x.log
if($? > 0) then
echo t0-default-4_1-1024_1024_1024_1024_2_1-test_inverse_c.x ERROR
else
echo t0-default-4_1-1024_1024_1024_1024_2_1-test_inverse_c.x OK
endif
echo 1 1 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t0-default-1_1-1024_1024_1024_1024_2_1-test_inverse_c.x.log
aprun -n 1 test_inverse_c.x > /lustre/scratch/djchen/logs/t0-default-1_1-1024_1024_1024_1024_2_1-test_inverse_c.x.log
if($? > 0) then
echo t0-default-1_1-1024_1024_1024_1024_2_1-test_inverse_c.x ERROR
else
echo t0-default-1_1-1024_1024_1024_1024_2_1-test_inverse_c.x OK
endif
echo 3 2 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t0-default-3_2-1024_1024_1024_1024_2_1-test_inverse_f.x.log
aprun -n 6 test_inverse_f.x > /lustre/scratch/djchen/logs/t0-default-3_2-1024_1024_1024_1024_2_1-test_inverse_f.x.log
if($? > 0) then
echo t0-default-3_2-1024_1024_1024_1024_2_1-test_inverse_f.x ERROR
else
echo t0-default-3_2-1024_1024_1024_1024_2_1-test_inverse_f.x OK
endif
echo 2 3 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t0-default-2_3-1024_1024_1024_1024_2_1-test_inverse_f.x.log
aprun -n 6 test_inverse_f.x > /lustre/scratch/djchen/logs/t0-default-2_3-1024_1024_1024_1024_2_1-test_inverse_f.x.log
if($? > 0) then
echo t0-default-2_3-1024_1024_1024_1024_2_1-test_inverse_f.x ERROR
else
echo t0-default-2_3-1024_1024_1024_1024_2_1-test_inverse_f.x OK
endif
echo 2 2 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t0-default-2_2-1024_1024_1024_1024_2_1-test_inverse_f.x.log
aprun -n 4 test_inverse_f.x > /lustre/scratch/djchen/logs/t0-default-2_2-1024_1024_1024_1024_2_1-test_inverse_f.x.log
if($? > 0) then
echo t0-default-2_2-1024_1024_1024_1024_2_1-test_inverse_f.x ERROR
else
echo t0-default-2_2-1024_1024_1024_1024_2_1-test_inverse_f.x OK
endif
echo 1 4 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t0-default-1_4-1024_1024_1024_1024_2_1-test_inverse_f.x.log
aprun -n 4 test_inverse_f.x > /lustre/scratch/djchen/logs/t0-default-1_4-1024_1024_1024_1024_2_1-test_inverse_f.x.log
if($? > 0) then
echo t0-default-1_4-1024_1024_1024_1024_2_1-test_inverse_f.x ERROR
else
echo t0-default-1_4-1024_1024_1024_1024_2_1-test_inverse_f.x OK
endif
echo 4 1 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t0-default-4_1-1024_1024_1024_1024_2_1-test_inverse_f.x.log
aprun -n 4 test_inverse_f.x > /lustre/scratch/djchen/logs/t0-default-4_1-1024_1024_1024_1024_2_1-test_inverse_f.x.log
if($? > 0) then
echo t0-default-4_1-1024_1024_1024_1024_2_1-test_inverse_f.x ERROR
else
echo t0-default-4_1-1024_1024_1024_1024_2_1-test_inverse_f.x OK
endif
echo 1 1 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t0-default-1_1-1024_1024_1024_1024_2_1-test_inverse_f.x.log
aprun -n 1 test_inverse_f.x > /lustre/scratch/djchen/logs/t0-default-1_1-1024_1024_1024_1024_2_1-test_inverse_f.x.log
if($? > 0) then
echo t0-default-1_1-1024_1024_1024_1024_2_1-test_inverse_f.x ERROR
else
echo t0-default-1_1-1024_1024_1024_1024_2_1-test_inverse_f.x OK
endif
echo 3 2 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t0-default-3_2-1024_1024_1024_1024_2_1-test_rand_c.x.log
aprun -n 6 test_rand_c.x > /lustre/scratch/djchen/logs/t0-default-3_2-1024_1024_1024_1024_2_1-test_rand_c.x.log
if($? > 0) then
echo t0-default-3_2-1024_1024_1024_1024_2_1-test_rand_c.x ERROR
else
echo t0-default-3_2-1024_1024_1024_1024_2_1-test_rand_c.x OK
endif
echo 2 3 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t0-default-2_3-1024_1024_1024_1024_2_1-test_rand_c.x.log
aprun -n 6 test_rand_c.x > /lustre/scratch/djchen/logs/t0-default-2_3-1024_1024_1024_1024_2_1-test_rand_c.x.log
if($? > 0) then
echo t0-default-2_3-1024_1024_1024_1024_2_1-test_rand_c.x ERROR
else
echo t0-default-2_3-1024_1024_1024_1024_2_1-test_rand_c.x OK
endif
echo 2 2 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t0-default-2_2-1024_1024_1024_1024_2_1-test_rand_c.x.log
aprun -n 4 test_rand_c.x > /lustre/scratch/djchen/logs/t0-default-2_2-1024_1024_1024_1024_2_1-test_rand_c.x.log
if($? > 0) then
echo t0-default-2_2-1024_1024_1024_1024_2_1-test_rand_c.x ERROR
else
echo t0-default-2_2-1024_1024_1024_1024_2_1-test_rand_c.x OK
endif
echo 1 4 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t0-default-1_4-1024_1024_1024_1024_2_1-test_rand_c.x.log
aprun -n 4 test_rand_c.x > /lustre/scratch/djchen/logs/t0-default-1_4-1024_1024_1024_1024_2_1-test_rand_c.x.log
if($? > 0) then
echo t0-default-1_4-1024_1024_1024_1024_2_1-test_rand_c.x ERROR
else
echo t0-default-1_4-1024_1024_1024_1024_2_1-test_rand_c.x OK
endif
echo 4 1 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t0-default-4_1-1024_1024_1024_1024_2_1-test_rand_c.x.log
aprun -n 4 test_rand_c.x > /lustre/scratch/djchen/logs/t0-default-4_1-1024_1024_1024_1024_2_1-test_rand_c.x.log
if($? > 0) then
echo t0-default-4_1-1024_1024_1024_1024_2_1-test_rand_c.x ERROR
else
echo t0-default-4_1-1024_1024_1024_1024_2_1-test_rand_c.x OK
endif
echo 1 1 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t0-default-1_1-1024_1024_1024_1024_2_1-test_rand_c.x.log
aprun -n 1 test_rand_c.x > /lustre/scratch/djchen/logs/t0-default-1_1-1024_1024_1024_1024_2_1-test_rand_c.x.log
if($? > 0) then
echo t0-default-1_1-1024_1024_1024_1024_2_1-test_rand_c.x ERROR
else
echo t0-default-1_1-1024_1024_1024_1024_2_1-test_rand_c.x OK
endif
echo 3 2 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t0-default-3_2-1024_1024_1024_1024_2_1-test_rand_f.x.log
aprun -n 6 test_rand_f.x > /lustre/scratch/djchen/logs/t0-default-3_2-1024_1024_1024_1024_2_1-test_rand_f.x.log
if($? > 0) then
echo t0-default-3_2-1024_1024_1024_1024_2_1-test_rand_f.x ERROR
else
echo t0-default-3_2-1024_1024_1024_1024_2_1-test_rand_f.x OK
endif
echo 2 3 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t0-default-2_3-1024_1024_1024_1024_2_1-test_rand_f.x.log
aprun -n 6 test_rand_f.x > /lustre/scratch/djchen/logs/t0-default-2_3-1024_1024_1024_1024_2_1-test_rand_f.x.log
if($? > 0) then
echo t0-default-2_3-1024_1024_1024_1024_2_1-test_rand_f.x ERROR
else
echo t0-default-2_3-1024_1024_1024_1024_2_1-test_rand_f.x OK
endif
echo 2 2 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t0-default-2_2-1024_1024_1024_1024_2_1-test_rand_f.x.log
aprun -n 4 test_rand_f.x > /lustre/scratch/djchen/logs/t0-default-2_2-1024_1024_1024_1024_2_1-test_rand_f.x.log
if($? > 0) then
echo t0-default-2_2-1024_1024_1024_1024_2_1-test_rand_f.x ERROR
else
echo t0-default-2_2-1024_1024_1024_1024_2_1-test_rand_f.x OK
endif
echo 1 4 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t0-default-1_4-1024_1024_1024_1024_2_1-test_rand_f.x.log
aprun -n 4 test_rand_f.x > /lustre/scratch/djchen/logs/t0-default-1_4-1024_1024_1024_1024_2_1-test_rand_f.x.log
if($? > 0) then
echo t0-default-1_4-1024_1024_1024_1024_2_1-test_rand_f.x ERROR
else
echo t0-default-1_4-1024_1024_1024_1024_2_1-test_rand_f.x OK
endif
echo 4 1 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t0-default-4_1-1024_1024_1024_1024_2_1-test_rand_f.x.log
aprun -n 4 test_rand_f.x > /lustre/scratch/djchen/logs/t0-default-4_1-1024_1024_1024_1024_2_1-test_rand_f.x.log
if($? > 0) then
echo t0-default-4_1-1024_1024_1024_1024_2_1-test_rand_f.x ERROR
else
echo t0-default-4_1-1024_1024_1024_1024_2_1-test_rand_f.x OK
endif
echo 1 1 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t0-default-1_1-1024_1024_1024_1024_2_1-test_rand_f.x.log
aprun -n 1 test_rand_f.x > /lustre/scratch/djchen/logs/t0-default-1_1-1024_1024_1024_1024_2_1-test_rand_f.x.log
if($? > 0) then
echo t0-default-1_1-1024_1024_1024_1024_2_1-test_rand_f.x ERROR
else
echo t0-default-1_1-1024_1024_1024_1024_2_1-test_rand_f.x OK
endif
echo 3 2 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t0-default-3_2-1024_1024_1024_1024_2_1-test_sine_c.x.log
aprun -n 6 test_sine_c.x > /lustre/scratch/djchen/logs/t0-default-3_2-1024_1024_1024_1024_2_1-test_sine_c.x.log
if($? > 0) then
echo t0-default-3_2-1024_1024_1024_1024_2_1-test_sine_c.x ERROR
else
echo t0-default-3_2-1024_1024_1024_1024_2_1-test_sine_c.x OK
endif
echo 2 3 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t0-default-2_3-1024_1024_1024_1024_2_1-test_sine_c.x.log
aprun -n 6 test_sine_c.x > /lustre/scratch/djchen/logs/t0-default-2_3-1024_1024_1024_1024_2_1-test_sine_c.x.log
if($? > 0) then
echo t0-default-2_3-1024_1024_1024_1024_2_1-test_sine_c.x ERROR
else
echo t0-default-2_3-1024_1024_1024_1024_2_1-test_sine_c.x OK
endif
echo 2 2 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t0-default-2_2-1024_1024_1024_1024_2_1-test_sine_c.x.log
aprun -n 4 test_sine_c.x > /lustre/scratch/djchen/logs/t0-default-2_2-1024_1024_1024_1024_2_1-test_sine_c.x.log
if($? > 0) then
echo t0-default-2_2-1024_1024_1024_1024_2_1-test_sine_c.x ERROR
else
echo t0-default-2_2-1024_1024_1024_1024_2_1-test_sine_c.x OK
endif
echo 1 4 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t0-default-1_4-1024_1024_1024_1024_2_1-test_sine_c.x.log
aprun -n 4 test_sine_c.x > /lustre/scratch/djchen/logs/t0-default-1_4-1024_1024_1024_1024_2_1-test_sine_c.x.log
if($? > 0) then
echo t0-default-1_4-1024_1024_1024_1024_2_1-test_sine_c.x ERROR
else
echo t0-default-1_4-1024_1024_1024_1024_2_1-test_sine_c.x OK
endif
echo 4 1 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t0-default-4_1-1024_1024_1024_1024_2_1-test_sine_c.x.log
aprun -n 4 test_sine_c.x > /lustre/scratch/djchen/logs/t0-default-4_1-1024_1024_1024_1024_2_1-test_sine_c.x.log
if($? > 0) then
echo t0-default-4_1-1024_1024_1024_1024_2_1-test_sine_c.x ERROR
else
echo t0-default-4_1-1024_1024_1024_1024_2_1-test_sine_c.x OK
endif
echo 1 1 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t0-default-1_1-1024_1024_1024_1024_2_1-test_sine_c.x.log
aprun -n 1 test_sine_c.x > /lustre/scratch/djchen/logs/t0-default-1_1-1024_1024_1024_1024_2_1-test_sine_c.x.log
if($? > 0) then
echo t0-default-1_1-1024_1024_1024_1024_2_1-test_sine_c.x ERROR
else
echo t0-default-1_1-1024_1024_1024_1024_2_1-test_sine_c.x OK
endif
echo 3 2 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t0-default-3_2-1024_1024_1024_1024_2_1-test_sine_f.x.log
aprun -n 6 test_sine_f.x > /lustre/scratch/djchen/logs/t0-default-3_2-1024_1024_1024_1024_2_1-test_sine_f.x.log
if($? > 0) then
echo t0-default-3_2-1024_1024_1024_1024_2_1-test_sine_f.x ERROR
else
echo t0-default-3_2-1024_1024_1024_1024_2_1-test_sine_f.x OK
endif
echo 2 3 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t0-default-2_3-1024_1024_1024_1024_2_1-test_sine_f.x.log
aprun -n 6 test_sine_f.x > /lustre/scratch/djchen/logs/t0-default-2_3-1024_1024_1024_1024_2_1-test_sine_f.x.log
if($? > 0) then
echo t0-default-2_3-1024_1024_1024_1024_2_1-test_sine_f.x ERROR
else
echo t0-default-2_3-1024_1024_1024_1024_2_1-test_sine_f.x OK
endif
echo 2 2 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t0-default-2_2-1024_1024_1024_1024_2_1-test_sine_f.x.log
aprun -n 4 test_sine_f.x > /lustre/scratch/djchen/logs/t0-default-2_2-1024_1024_1024_1024_2_1-test_sine_f.x.log
if($? > 0) then
echo t0-default-2_2-1024_1024_1024_1024_2_1-test_sine_f.x ERROR
else
echo t0-default-2_2-1024_1024_1024_1024_2_1-test_sine_f.x OK
endif
echo 1 4 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t0-default-1_4-1024_1024_1024_1024_2_1-test_sine_f.x.log
aprun -n 4 test_sine_f.x > /lustre/scratch/djchen/logs/t0-default-1_4-1024_1024_1024_1024_2_1-test_sine_f.x.log
if($? > 0) then
echo t0-default-1_4-1024_1024_1024_1024_2_1-test_sine_f.x ERROR
else
echo t0-default-1_4-1024_1024_1024_1024_2_1-test_sine_f.x OK
endif
echo 4 1 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t0-default-4_1-1024_1024_1024_1024_2_1-test_sine_f.x.log
aprun -n 4 test_sine_f.x > /lustre/scratch/djchen/logs/t0-default-4_1-1024_1024_1024_1024_2_1-test_sine_f.x.log
if($? > 0) then
echo t0-default-4_1-1024_1024_1024_1024_2_1-test_sine_f.x ERROR
else
echo t0-default-4_1-1024_1024_1024_1024_2_1-test_sine_f.x OK
endif
echo 1 1 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t0-default-1_1-1024_1024_1024_1024_2_1-test_sine_f.x.log
aprun -n 1 test_sine_f.x > /lustre/scratch/djchen/logs/t0-default-1_1-1024_1024_1024_1024_2_1-test_sine_f.x.log
if($? > 0) then
echo t0-default-1_1-1024_1024_1024_1024_2_1-test_sine_f.x ERROR
else
echo t0-default-1_1-1024_1024_1024_1024_2_1-test_sine_f.x OK
endif
echo 3 2 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t0-default-3_2-1024_1024_1024_1024_2_1-test_sine_inplace_c.x.log
aprun -n 6 test_sine_inplace_c.x > /lustre/scratch/djchen/logs/t0-default-3_2-1024_1024_1024_1024_2_1-test_sine_inplace_c.x.log
if($? > 0) then
echo t0-default-3_2-1024_1024_1024_1024_2_1-test_sine_inplace_c.x ERROR
else
echo t0-default-3_2-1024_1024_1024_1024_2_1-test_sine_inplace_c.x OK
endif
echo 2 3 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t0-default-2_3-1024_1024_1024_1024_2_1-test_sine_inplace_c.x.log
aprun -n 6 test_sine_inplace_c.x > /lustre/scratch/djchen/logs/t0-default-2_3-1024_1024_1024_1024_2_1-test_sine_inplace_c.x.log
if($? > 0) then
echo t0-default-2_3-1024_1024_1024_1024_2_1-test_sine_inplace_c.x ERROR
else
echo t0-default-2_3-1024_1024_1024_1024_2_1-test_sine_inplace_c.x OK
endif
echo 2 2 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t0-default-2_2-1024_1024_1024_1024_2_1-test_sine_inplace_c.x.log
aprun -n 4 test_sine_inplace_c.x > /lustre/scratch/djchen/logs/t0-default-2_2-1024_1024_1024_1024_2_1-test_sine_inplace_c.x.log
if($? > 0) then
echo t0-default-2_2-1024_1024_1024_1024_2_1-test_sine_inplace_c.x ERROR
else
echo t0-default-2_2-1024_1024_1024_1024_2_1-test_sine_inplace_c.x OK
endif
echo 1 4 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t0-default-1_4-1024_1024_1024_1024_2_1-test_sine_inplace_c.x.log
aprun -n 4 test_sine_inplace_c.x > /lustre/scratch/djchen/logs/t0-default-1_4-1024_1024_1024_1024_2_1-test_sine_inplace_c.x.log
if($? > 0) then
echo t0-default-1_4-1024_1024_1024_1024_2_1-test_sine_inplace_c.x ERROR
else
echo t0-default-1_4-1024_1024_1024_1024_2_1-test_sine_inplace_c.x OK
endif
echo 4 1 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t0-default-4_1-1024_1024_1024_1024_2_1-test_sine_inplace_c.x.log
aprun -n 4 test_sine_inplace_c.x > /lustre/scratch/djchen/logs/t0-default-4_1-1024_1024_1024_1024_2_1-test_sine_inplace_c.x.log
if($? > 0) then
echo t0-default-4_1-1024_1024_1024_1024_2_1-test_sine_inplace_c.x ERROR
else
echo t0-default-4_1-1024_1024_1024_1024_2_1-test_sine_inplace_c.x OK
endif
echo 1 1 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t0-default-1_1-1024_1024_1024_1024_2_1-test_sine_inplace_c.x.log
aprun -n 1 test_sine_inplace_c.x > /lustre/scratch/djchen/logs/t0-default-1_1-1024_1024_1024_1024_2_1-test_sine_inplace_c.x.log
if($? > 0) then
echo t0-default-1_1-1024_1024_1024_1024_2_1-test_sine_inplace_c.x ERROR
else
echo t0-default-1_1-1024_1024_1024_1024_2_1-test_sine_inplace_c.x OK
endif
echo 3 2 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t0-default-3_2-1024_1024_1024_1024_2_1-test_sine_inplace_f.x.log
aprun -n 6 test_sine_inplace_f.x > /lustre/scratch/djchen/logs/t0-default-3_2-1024_1024_1024_1024_2_1-test_sine_inplace_f.x.log
if($? > 0) then
echo t0-default-3_2-1024_1024_1024_1024_2_1-test_sine_inplace_f.x ERROR
else
echo t0-default-3_2-1024_1024_1024_1024_2_1-test_sine_inplace_f.x OK
endif
echo 2 3 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t0-default-2_3-1024_1024_1024_1024_2_1-test_sine_inplace_f.x.log
aprun -n 6 test_sine_inplace_f.x > /lustre/scratch/djchen/logs/t0-default-2_3-1024_1024_1024_1024_2_1-test_sine_inplace_f.x.log
if($? > 0) then
echo t0-default-2_3-1024_1024_1024_1024_2_1-test_sine_inplace_f.x ERROR
else
echo t0-default-2_3-1024_1024_1024_1024_2_1-test_sine_inplace_f.x OK
endif
echo 2 2 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t0-default-2_2-1024_1024_1024_1024_2_1-test_sine_inplace_f.x.log
aprun -n 4 test_sine_inplace_f.x > /lustre/scratch/djchen/logs/t0-default-2_2-1024_1024_1024_1024_2_1-test_sine_inplace_f.x.log
if($? > 0) then
echo t0-default-2_2-1024_1024_1024_1024_2_1-test_sine_inplace_f.x ERROR
else
echo t0-default-2_2-1024_1024_1024_1024_2_1-test_sine_inplace_f.x OK
endif
echo 1 4 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t0-default-1_4-1024_1024_1024_1024_2_1-test_sine_inplace_f.x.log
aprun -n 4 test_sine_inplace_f.x > /lustre/scratch/djchen/logs/t0-default-1_4-1024_1024_1024_1024_2_1-test_sine_inplace_f.x.log
if($? > 0) then
echo t0-default-1_4-1024_1024_1024_1024_2_1-test_sine_inplace_f.x ERROR
else
echo t0-default-1_4-1024_1024_1024_1024_2_1-test_sine_inplace_f.x OK
endif
echo 4 1 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t0-default-4_1-1024_1024_1024_1024_2_1-test_sine_inplace_f.x.log
aprun -n 4 test_sine_inplace_f.x > /lustre/scratch/djchen/logs/t0-default-4_1-1024_1024_1024_1024_2_1-test_sine_inplace_f.x.log
if($? > 0) then
echo t0-default-4_1-1024_1024_1024_1024_2_1-test_sine_inplace_f.x ERROR
else
echo t0-default-4_1-1024_1024_1024_1024_2_1-test_sine_inplace_f.x OK
endif
echo 1 1 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t0-default-1_1-1024_1024_1024_1024_2_1-test_sine_inplace_f.x.log
aprun -n 1 test_sine_inplace_f.x > /lustre/scratch/djchen/logs/t0-default-1_1-1024_1024_1024_1024_2_1-test_sine_inplace_f.x.log
if($? > 0) then
echo t0-default-1_1-1024_1024_1024_1024_2_1-test_sine_inplace_f.x ERROR
else
echo t0-default-1_1-1024_1024_1024_1024_2_1-test_sine_inplace_f.x OK
endif
echo 3 2 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t0-default-3_2-1024_1024_1024_1024_2_1-test_spec_c.x.log
aprun -n 6 test_spec_c.x > /lustre/scratch/djchen/logs/t0-default-3_2-1024_1024_1024_1024_2_1-test_spec_c.x.log
if($? > 0) then
echo t0-default-3_2-1024_1024_1024_1024_2_1-test_spec_c.x ERROR
else
echo t0-default-3_2-1024_1024_1024_1024_2_1-test_spec_c.x OK
endif
echo 2 3 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t0-default-2_3-1024_1024_1024_1024_2_1-test_spec_c.x.log
aprun -n 6 test_spec_c.x > /lustre/scratch/djchen/logs/t0-default-2_3-1024_1024_1024_1024_2_1-test_spec_c.x.log
if($? > 0) then
echo t0-default-2_3-1024_1024_1024_1024_2_1-test_spec_c.x ERROR
else
echo t0-default-2_3-1024_1024_1024_1024_2_1-test_spec_c.x OK
endif
echo 2 2 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t0-default-2_2-1024_1024_1024_1024_2_1-test_spec_c.x.log
aprun -n 4 test_spec_c.x > /lustre/scratch/djchen/logs/t0-default-2_2-1024_1024_1024_1024_2_1-test_spec_c.x.log
if($? > 0) then
echo t0-default-2_2-1024_1024_1024_1024_2_1-test_spec_c.x ERROR
else
echo t0-default-2_2-1024_1024_1024_1024_2_1-test_spec_c.x OK
endif
echo 1 4 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t0-default-1_4-1024_1024_1024_1024_2_1-test_spec_c.x.log
aprun -n 4 test_spec_c.x > /lustre/scratch/djchen/logs/t0-default-1_4-1024_1024_1024_1024_2_1-test_spec_c.x.log
if($? > 0) then
echo t0-default-1_4-1024_1024_1024_1024_2_1-test_spec_c.x ERROR
else
echo t0-default-1_4-1024_1024_1024_1024_2_1-test_spec_c.x OK
endif
echo 4 1 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t0-default-4_1-1024_1024_1024_1024_2_1-test_spec_c.x.log
aprun -n 4 test_spec_c.x > /lustre/scratch/djchen/logs/t0-default-4_1-1024_1024_1024_1024_2_1-test_spec_c.x.log
if($? > 0) then
echo t0-default-4_1-1024_1024_1024_1024_2_1-test_spec_c.x ERROR
else
echo t0-default-4_1-1024_1024_1024_1024_2_1-test_spec_c.x OK
endif
echo 1 1 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t0-default-1_1-1024_1024_1024_1024_2_1-test_spec_c.x.log
aprun -n 1 test_spec_c.x > /lustre/scratch/djchen/logs/t0-default-1_1-1024_1024_1024_1024_2_1-test_spec_c.x.log
if($? > 0) then
echo t0-default-1_1-1024_1024_1024_1024_2_1-test_spec_c.x ERROR
else
echo t0-default-1_1-1024_1024_1024_1024_2_1-test_spec_c.x OK
endif
echo 3 2 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t0-default-3_2-1024_1024_1024_1024_2_1-test_spec_f.x.log
aprun -n 6 test_spec_f.x > /lustre/scratch/djchen/logs/t0-default-3_2-1024_1024_1024_1024_2_1-test_spec_f.x.log
if($? > 0) then
echo t0-default-3_2-1024_1024_1024_1024_2_1-test_spec_f.x ERROR
else
echo t0-default-3_2-1024_1024_1024_1024_2_1-test_spec_f.x OK
endif
echo 2 3 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t0-default-2_3-1024_1024_1024_1024_2_1-test_spec_f.x.log
aprun -n 6 test_spec_f.x > /lustre/scratch/djchen/logs/t0-default-2_3-1024_1024_1024_1024_2_1-test_spec_f.x.log
if($? > 0) then
echo t0-default-2_3-1024_1024_1024_1024_2_1-test_spec_f.x ERROR
else
echo t0-default-2_3-1024_1024_1024_1024_2_1-test_spec_f.x OK
endif
echo 2 2 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t0-default-2_2-1024_1024_1024_1024_2_1-test_spec_f.x.log
aprun -n 4 test_spec_f.x > /lustre/scratch/djchen/logs/t0-default-2_2-1024_1024_1024_1024_2_1-test_spec_f.x.log
if($? > 0) then
echo t0-default-2_2-1024_1024_1024_1024_2_1-test_spec_f.x ERROR
else
echo t0-default-2_2-1024_1024_1024_1024_2_1-test_spec_f.x OK
endif
echo 1 4 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t0-default-1_4-1024_1024_1024_1024_2_1-test_spec_f.x.log
aprun -n 4 test_spec_f.x > /lustre/scratch/djchen/logs/t0-default-1_4-1024_1024_1024_1024_2_1-test_spec_f.x.log
if($? > 0) then
echo t0-default-1_4-1024_1024_1024_1024_2_1-test_spec_f.x ERROR
else
echo t0-default-1_4-1024_1024_1024_1024_2_1-test_spec_f.x OK
endif
echo 4 1 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t0-default-4_1-1024_1024_1024_1024_2_1-test_spec_f.x.log
aprun -n 4 test_spec_f.x > /lustre/scratch/djchen/logs/t0-default-4_1-1024_1024_1024_1024_2_1-test_spec_f.x.log
if($? > 0) then
echo t0-default-4_1-1024_1024_1024_1024_2_1-test_spec_f.x ERROR
else
echo t0-default-4_1-1024_1024_1024_1024_2_1-test_spec_f.x OK
endif
echo 1 1 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t0-default-1_1-1024_1024_1024_1024_2_1-test_spec_f.x.log
aprun -n 1 test_spec_f.x > /lustre/scratch/djchen/logs/t0-default-1_1-1024_1024_1024_1024_2_1-test_spec_f.x.log
if($? > 0) then
echo t0-default-1_1-1024_1024_1024_1024_2_1-test_spec_f.x ERROR
else
echo t0-default-1_1-1024_1024_1024_1024_2_1-test_spec_f.x OK
endif
cd /lustre/scratch/djchen/p3dfft-test/test0-even/sample
echo 3 2 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t0-even-3_2-1024_1024_1024_1024_2_1-test_inverse_c.x.log
aprun -n 6 test_inverse_c.x > /lustre/scratch/djchen/logs/t0-even-3_2-1024_1024_1024_1024_2_1-test_inverse_c.x.log
if($? > 0) then
echo t0-even-3_2-1024_1024_1024_1024_2_1-test_inverse_c.x ERROR
else
echo t0-even-3_2-1024_1024_1024_1024_2_1-test_inverse_c.x OK
endif
echo 2 3 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t0-even-2_3-1024_1024_1024_1024_2_1-test_inverse_c.x.log
aprun -n 6 test_inverse_c.x > /lustre/scratch/djchen/logs/t0-even-2_3-1024_1024_1024_1024_2_1-test_inverse_c.x.log
if($? > 0) then
echo t0-even-2_3-1024_1024_1024_1024_2_1-test_inverse_c.x ERROR
else
echo t0-even-2_3-1024_1024_1024_1024_2_1-test_inverse_c.x OK
endif
echo 2 2 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t0-even-2_2-1024_1024_1024_1024_2_1-test_inverse_c.x.log
aprun -n 4 test_inverse_c.x > /lustre/scratch/djchen/logs/t0-even-2_2-1024_1024_1024_1024_2_1-test_inverse_c.x.log
if($? > 0) then
echo t0-even-2_2-1024_1024_1024_1024_2_1-test_inverse_c.x ERROR
else
echo t0-even-2_2-1024_1024_1024_1024_2_1-test_inverse_c.x OK
endif
echo 1 4 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t0-even-1_4-1024_1024_1024_1024_2_1-test_inverse_c.x.log
aprun -n 4 test_inverse_c.x > /lustre/scratch/djchen/logs/t0-even-1_4-1024_1024_1024_1024_2_1-test_inverse_c.x.log
if($? > 0) then
echo t0-even-1_4-1024_1024_1024_1024_2_1-test_inverse_c.x ERROR
else
echo t0-even-1_4-1024_1024_1024_1024_2_1-test_inverse_c.x OK
endif
echo 4 1 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t0-even-4_1-1024_1024_1024_1024_2_1-test_inverse_c.x.log
aprun -n 4 test_inverse_c.x > /lustre/scratch/djchen/logs/t0-even-4_1-1024_1024_1024_1024_2_1-test_inverse_c.x.log
if($? > 0) then
echo t0-even-4_1-1024_1024_1024_1024_2_1-test_inverse_c.x ERROR
else
echo t0-even-4_1-1024_1024_1024_1024_2_1-test_inverse_c.x OK
endif
echo 1 1 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t0-even-1_1-1024_1024_1024_1024_2_1-test_inverse_c.x.log
aprun -n 1 test_inverse_c.x > /lustre/scratch/djchen/logs/t0-even-1_1-1024_1024_1024_1024_2_1-test_inverse_c.x.log
if($? > 0) then
echo t0-even-1_1-1024_1024_1024_1024_2_1-test_inverse_c.x ERROR
else
echo t0-even-1_1-1024_1024_1024_1024_2_1-test_inverse_c.x OK
endif
echo 3 2 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t0-even-3_2-1024_1024_1024_1024_2_1-test_inverse_f.x.log
aprun -n 6 test_inverse_f.x > /lustre/scratch/djchen/logs/t0-even-3_2-1024_1024_1024_1024_2_1-test_inverse_f.x.log
if($? > 0) then
echo t0-even-3_2-1024_1024_1024_1024_2_1-test_inverse_f.x ERROR
else
echo t0-even-3_2-1024_1024_1024_1024_2_1-test_inverse_f.x OK
endif
echo 2 3 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t0-even-2_3-1024_1024_1024_1024_2_1-test_inverse_f.x.log
aprun -n 6 test_inverse_f.x > /lustre/scratch/djchen/logs/t0-even-2_3-1024_1024_1024_1024_2_1-test_inverse_f.x.log
if($? > 0) then
echo t0-even-2_3-1024_1024_1024_1024_2_1-test_inverse_f.x ERROR
else
echo t0-even-2_3-1024_1024_1024_1024_2_1-test_inverse_f.x OK
endif
echo 2 2 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t0-even-2_2-1024_1024_1024_1024_2_1-test_inverse_f.x.log
aprun -n 4 test_inverse_f.x > /lustre/scratch/djchen/logs/t0-even-2_2-1024_1024_1024_1024_2_1-test_inverse_f.x.log
if($? > 0) then
echo t0-even-2_2-1024_1024_1024_1024_2_1-test_inverse_f.x ERROR
else
echo t0-even-2_2-1024_1024_1024_1024_2_1-test_inverse_f.x OK
endif
echo 1 4 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t0-even-1_4-1024_1024_1024_1024_2_1-test_inverse_f.x.log
aprun -n 4 test_inverse_f.x > /lustre/scratch/djchen/logs/t0-even-1_4-1024_1024_1024_1024_2_1-test_inverse_f.x.log
if($? > 0) then
echo t0-even-1_4-1024_1024_1024_1024_2_1-test_inverse_f.x ERROR
else
echo t0-even-1_4-1024_1024_1024_1024_2_1-test_inverse_f.x OK
endif
echo 4 1 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t0-even-4_1-1024_1024_1024_1024_2_1-test_inverse_f.x.log
aprun -n 4 test_inverse_f.x > /lustre/scratch/djchen/logs/t0-even-4_1-1024_1024_1024_1024_2_1-test_inverse_f.x.log
if($? > 0) then
echo t0-even-4_1-1024_1024_1024_1024_2_1-test_inverse_f.x ERROR
else
echo t0-even-4_1-1024_1024_1024_1024_2_1-test_inverse_f.x OK
endif
echo 1 1 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t0-even-1_1-1024_1024_1024_1024_2_1-test_inverse_f.x.log
aprun -n 1 test_inverse_f.x > /lustre/scratch/djchen/logs/t0-even-1_1-1024_1024_1024_1024_2_1-test_inverse_f.x.log
if($? > 0) then
echo t0-even-1_1-1024_1024_1024_1024_2_1-test_inverse_f.x ERROR
else
echo t0-even-1_1-1024_1024_1024_1024_2_1-test_inverse_f.x OK
endif
echo 3 2 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t0-even-3_2-1024_1024_1024_1024_2_1-test_rand_c.x.log
aprun -n 6 test_rand_c.x > /lustre/scratch/djchen/logs/t0-even-3_2-1024_1024_1024_1024_2_1-test_rand_c.x.log
if($? > 0) then
echo t0-even-3_2-1024_1024_1024_1024_2_1-test_rand_c.x ERROR
else
echo t0-even-3_2-1024_1024_1024_1024_2_1-test_rand_c.x OK
endif
echo 2 3 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t0-even-2_3-1024_1024_1024_1024_2_1-test_rand_c.x.log
aprun -n 6 test_rand_c.x > /lustre/scratch/djchen/logs/t0-even-2_3-1024_1024_1024_1024_2_1-test_rand_c.x.log
if($? > 0) then
echo t0-even-2_3-1024_1024_1024_1024_2_1-test_rand_c.x ERROR
else
echo t0-even-2_3-1024_1024_1024_1024_2_1-test_rand_c.x OK
endif
echo 2 2 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t0-even-2_2-1024_1024_1024_1024_2_1-test_rand_c.x.log
aprun -n 4 test_rand_c.x > /lustre/scratch/djchen/logs/t0-even-2_2-1024_1024_1024_1024_2_1-test_rand_c.x.log
if($? > 0) then
echo t0-even-2_2-1024_1024_1024_1024_2_1-test_rand_c.x ERROR
else
echo t0-even-2_2-1024_1024_1024_1024_2_1-test_rand_c.x OK
endif
echo 1 4 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t0-even-1_4-1024_1024_1024_1024_2_1-test_rand_c.x.log
aprun -n 4 test_rand_c.x > /lustre/scratch/djchen/logs/t0-even-1_4-1024_1024_1024_1024_2_1-test_rand_c.x.log
if($? > 0) then
echo t0-even-1_4-1024_1024_1024_1024_2_1-test_rand_c.x ERROR
else
echo t0-even-1_4-1024_1024_1024_1024_2_1-test_rand_c.x OK
endif
echo 4 1 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t0-even-4_1-1024_1024_1024_1024_2_1-test_rand_c.x.log
aprun -n 4 test_rand_c.x > /lustre/scratch/djchen/logs/t0-even-4_1-1024_1024_1024_1024_2_1-test_rand_c.x.log
if($? > 0) then
echo t0-even-4_1-1024_1024_1024_1024_2_1-test_rand_c.x ERROR
else
echo t0-even-4_1-1024_1024_1024_1024_2_1-test_rand_c.x OK
endif
echo 1 1 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t0-even-1_1-1024_1024_1024_1024_2_1-test_rand_c.x.log
aprun -n 1 test_rand_c.x > /lustre/scratch/djchen/logs/t0-even-1_1-1024_1024_1024_1024_2_1-test_rand_c.x.log
if($? > 0) then
echo t0-even-1_1-1024_1024_1024_1024_2_1-test_rand_c.x ERROR
else
echo t0-even-1_1-1024_1024_1024_1024_2_1-test_rand_c.x OK
endif
echo 3 2 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t0-even-3_2-1024_1024_1024_1024_2_1-test_rand_f.x.log
aprun -n 6 test_rand_f.x > /lustre/scratch/djchen/logs/t0-even-3_2-1024_1024_1024_1024_2_1-test_rand_f.x.log
if($? > 0) then
echo t0-even-3_2-1024_1024_1024_1024_2_1-test_rand_f.x ERROR
else
echo t0-even-3_2-1024_1024_1024_1024_2_1-test_rand_f.x OK
endif
echo 2 3 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t0-even-2_3-1024_1024_1024_1024_2_1-test_rand_f.x.log
aprun -n 6 test_rand_f.x > /lustre/scratch/djchen/logs/t0-even-2_3-1024_1024_1024_1024_2_1-test_rand_f.x.log
if($? > 0) then
echo t0-even-2_3-1024_1024_1024_1024_2_1-test_rand_f.x ERROR
else
echo t0-even-2_3-1024_1024_1024_1024_2_1-test_rand_f.x OK
endif
echo 2 2 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t0-even-2_2-1024_1024_1024_1024_2_1-test_rand_f.x.log
aprun -n 4 test_rand_f.x > /lustre/scratch/djchen/logs/t0-even-2_2-1024_1024_1024_1024_2_1-test_rand_f.x.log
if($? > 0) then
echo t0-even-2_2-1024_1024_1024_1024_2_1-test_rand_f.x ERROR
else
echo t0-even-2_2-1024_1024_1024_1024_2_1-test_rand_f.x OK
endif
echo 1 4 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t0-even-1_4-1024_1024_1024_1024_2_1-test_rand_f.x.log
aprun -n 4 test_rand_f.x > /lustre/scratch/djchen/logs/t0-even-1_4-1024_1024_1024_1024_2_1-test_rand_f.x.log
if($? > 0) then
echo t0-even-1_4-1024_1024_1024_1024_2_1-test_rand_f.x ERROR
else
echo t0-even-1_4-1024_1024_1024_1024_2_1-test_rand_f.x OK
endif
echo 4 1 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t0-even-4_1-1024_1024_1024_1024_2_1-test_rand_f.x.log
aprun -n 4 test_rand_f.x > /lustre/scratch/djchen/logs/t0-even-4_1-1024_1024_1024_1024_2_1-test_rand_f.x.log
if($? > 0) then
echo t0-even-4_1-1024_1024_1024_1024_2_1-test_rand_f.x ERROR
else
echo t0-even-4_1-1024_1024_1024_1024_2_1-test_rand_f.x OK
endif
echo 1 1 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t0-even-1_1-1024_1024_1024_1024_2_1-test_rand_f.x.log
aprun -n 1 test_rand_f.x > /lustre/scratch/djchen/logs/t0-even-1_1-1024_1024_1024_1024_2_1-test_rand_f.x.log
if($? > 0) then
echo t0-even-1_1-1024_1024_1024_1024_2_1-test_rand_f.x ERROR
else
echo t0-even-1_1-1024_1024_1024_1024_2_1-test_rand_f.x OK
endif
echo 3 2 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t0-even-3_2-1024_1024_1024_1024_2_1-test_sine_c.x.log
aprun -n 6 test_sine_c.x > /lustre/scratch/djchen/logs/t0-even-3_2-1024_1024_1024_1024_2_1-test_sine_c.x.log
if($? > 0) then
echo t0-even-3_2-1024_1024_1024_1024_2_1-test_sine_c.x ERROR
else
echo t0-even-3_2-1024_1024_1024_1024_2_1-test_sine_c.x OK
endif
echo 2 3 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t0-even-2_3-1024_1024_1024_1024_2_1-test_sine_c.x.log
aprun -n 6 test_sine_c.x > /lustre/scratch/djchen/logs/t0-even-2_3-1024_1024_1024_1024_2_1-test_sine_c.x.log
if($? > 0) then
echo t0-even-2_3-1024_1024_1024_1024_2_1-test_sine_c.x ERROR
else
echo t0-even-2_3-1024_1024_1024_1024_2_1-test_sine_c.x OK
endif
echo 2 2 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t0-even-2_2-1024_1024_1024_1024_2_1-test_sine_c.x.log
aprun -n 4 test_sine_c.x > /lustre/scratch/djchen/logs/t0-even-2_2-1024_1024_1024_1024_2_1-test_sine_c.x.log
if($? > 0) then
echo t0-even-2_2-1024_1024_1024_1024_2_1-test_sine_c.x ERROR
else
echo t0-even-2_2-1024_1024_1024_1024_2_1-test_sine_c.x OK
endif
echo 1 4 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t0-even-1_4-1024_1024_1024_1024_2_1-test_sine_c.x.log
aprun -n 4 test_sine_c.x > /lustre/scratch/djchen/logs/t0-even-1_4-1024_1024_1024_1024_2_1-test_sine_c.x.log
if($? > 0) then
echo t0-even-1_4-1024_1024_1024_1024_2_1-test_sine_c.x ERROR
else
echo t0-even-1_4-1024_1024_1024_1024_2_1-test_sine_c.x OK
endif
echo 4 1 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t0-even-4_1-1024_1024_1024_1024_2_1-test_sine_c.x.log
aprun -n 4 test_sine_c.x > /lustre/scratch/djchen/logs/t0-even-4_1-1024_1024_1024_1024_2_1-test_sine_c.x.log
if($? > 0) then
echo t0-even-4_1-1024_1024_1024_1024_2_1-test_sine_c.x ERROR
else
echo t0-even-4_1-1024_1024_1024_1024_2_1-test_sine_c.x OK
endif
echo 1 1 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t0-even-1_1-1024_1024_1024_1024_2_1-test_sine_c.x.log
aprun -n 1 test_sine_c.x > /lustre/scratch/djchen/logs/t0-even-1_1-1024_1024_1024_1024_2_1-test_sine_c.x.log
if($? > 0) then
echo t0-even-1_1-1024_1024_1024_1024_2_1-test_sine_c.x ERROR
else
echo t0-even-1_1-1024_1024_1024_1024_2_1-test_sine_c.x OK
endif
echo 3 2 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t0-even-3_2-1024_1024_1024_1024_2_1-test_sine_f.x.log
aprun -n 6 test_sine_f.x > /lustre/scratch/djchen/logs/t0-even-3_2-1024_1024_1024_1024_2_1-test_sine_f.x.log
if($? > 0) then
echo t0-even-3_2-1024_1024_1024_1024_2_1-test_sine_f.x ERROR
else
echo t0-even-3_2-1024_1024_1024_1024_2_1-test_sine_f.x OK
endif
echo 2 3 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t0-even-2_3-1024_1024_1024_1024_2_1-test_sine_f.x.log
aprun -n 6 test_sine_f.x > /lustre/scratch/djchen/logs/t0-even-2_3-1024_1024_1024_1024_2_1-test_sine_f.x.log
if($? > 0) then
echo t0-even-2_3-1024_1024_1024_1024_2_1-test_sine_f.x ERROR
else
echo t0-even-2_3-1024_1024_1024_1024_2_1-test_sine_f.x OK
endif
echo 2 2 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t0-even-2_2-1024_1024_1024_1024_2_1-test_sine_f.x.log
aprun -n 4 test_sine_f.x > /lustre/scratch/djchen/logs/t0-even-2_2-1024_1024_1024_1024_2_1-test_sine_f.x.log
if($? > 0) then
echo t0-even-2_2-1024_1024_1024_1024_2_1-test_sine_f.x ERROR
else
echo t0-even-2_2-1024_1024_1024_1024_2_1-test_sine_f.x OK
endif
echo 1 4 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t0-even-1_4-1024_1024_1024_1024_2_1-test_sine_f.x.log
aprun -n 4 test_sine_f.x > /lustre/scratch/djchen/logs/t0-even-1_4-1024_1024_1024_1024_2_1-test_sine_f.x.log
if($? > 0) then
echo t0-even-1_4-1024_1024_1024_1024_2_1-test_sine_f.x ERROR
else
echo t0-even-1_4-1024_1024_1024_1024_2_1-test_sine_f.x OK
endif
echo 4 1 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t0-even-4_1-1024_1024_1024_1024_2_1-test_sine_f.x.log
aprun -n 4 test_sine_f.x > /lustre/scratch/djchen/logs/t0-even-4_1-1024_1024_1024_1024_2_1-test_sine_f.x.log
if($? > 0) then
echo t0-even-4_1-1024_1024_1024_1024_2_1-test_sine_f.x ERROR
else
echo t0-even-4_1-1024_1024_1024_1024_2_1-test_sine_f.x OK
endif
echo 1 1 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t0-even-1_1-1024_1024_1024_1024_2_1-test_sine_f.x.log
aprun -n 1 test_sine_f.x > /lustre/scratch/djchen/logs/t0-even-1_1-1024_1024_1024_1024_2_1-test_sine_f.x.log
if($? > 0) then
echo t0-even-1_1-1024_1024_1024_1024_2_1-test_sine_f.x ERROR
else
echo t0-even-1_1-1024_1024_1024_1024_2_1-test_sine_f.x OK
endif
echo 3 2 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t0-even-3_2-1024_1024_1024_1024_2_1-test_sine_inplace_c.x.log
aprun -n 6 test_sine_inplace_c.x > /lustre/scratch/djchen/logs/t0-even-3_2-1024_1024_1024_1024_2_1-test_sine_inplace_c.x.log
if($? > 0) then
echo t0-even-3_2-1024_1024_1024_1024_2_1-test_sine_inplace_c.x ERROR
else
echo t0-even-3_2-1024_1024_1024_1024_2_1-test_sine_inplace_c.x OK
endif
echo 2 3 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t0-even-2_3-1024_1024_1024_1024_2_1-test_sine_inplace_c.x.log
aprun -n 6 test_sine_inplace_c.x > /lustre/scratch/djchen/logs/t0-even-2_3-1024_1024_1024_1024_2_1-test_sine_inplace_c.x.log
if($? > 0) then
echo t0-even-2_3-1024_1024_1024_1024_2_1-test_sine_inplace_c.x ERROR
else
echo t0-even-2_3-1024_1024_1024_1024_2_1-test_sine_inplace_c.x OK
endif
echo 2 2 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t0-even-2_2-1024_1024_1024_1024_2_1-test_sine_inplace_c.x.log
aprun -n 4 test_sine_inplace_c.x > /lustre/scratch/djchen/logs/t0-even-2_2-1024_1024_1024_1024_2_1-test_sine_inplace_c.x.log
if($? > 0) then
echo t0-even-2_2-1024_1024_1024_1024_2_1-test_sine_inplace_c.x ERROR
else
echo t0-even-2_2-1024_1024_1024_1024_2_1-test_sine_inplace_c.x OK
endif
echo 1 4 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t0-even-1_4-1024_1024_1024_1024_2_1-test_sine_inplace_c.x.log
aprun -n 4 test_sine_inplace_c.x > /lustre/scratch/djchen/logs/t0-even-1_4-1024_1024_1024_1024_2_1-test_sine_inplace_c.x.log
if($? > 0) then
echo t0-even-1_4-1024_1024_1024_1024_2_1-test_sine_inplace_c.x ERROR
else
echo t0-even-1_4-1024_1024_1024_1024_2_1-test_sine_inplace_c.x OK
endif
echo 4 1 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t0-even-4_1-1024_1024_1024_1024_2_1-test_sine_inplace_c.x.log
aprun -n 4 test_sine_inplace_c.x > /lustre/scratch/djchen/logs/t0-even-4_1-1024_1024_1024_1024_2_1-test_sine_inplace_c.x.log
if($? > 0) then
echo t0-even-4_1-1024_1024_1024_1024_2_1-test_sine_inplace_c.x ERROR
else
echo t0-even-4_1-1024_1024_1024_1024_2_1-test_sine_inplace_c.x OK
endif
echo 1 1 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t0-even-1_1-1024_1024_1024_1024_2_1-test_sine_inplace_c.x.log
aprun -n 1 test_sine_inplace_c.x > /lustre/scratch/djchen/logs/t0-even-1_1-1024_1024_1024_1024_2_1-test_sine_inplace_c.x.log
if($? > 0) then
echo t0-even-1_1-1024_1024_1024_1024_2_1-test_sine_inplace_c.x ERROR
else
echo t0-even-1_1-1024_1024_1024_1024_2_1-test_sine_inplace_c.x OK
endif
echo 3 2 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t0-even-3_2-1024_1024_1024_1024_2_1-test_sine_inplace_f.x.log
aprun -n 6 test_sine_inplace_f.x > /lustre/scratch/djchen/logs/t0-even-3_2-1024_1024_1024_1024_2_1-test_sine_inplace_f.x.log
if($? > 0) then
echo t0-even-3_2-1024_1024_1024_1024_2_1-test_sine_inplace_f.x ERROR
else
echo t0-even-3_2-1024_1024_1024_1024_2_1-test_sine_inplace_f.x OK
endif
echo 2 3 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t0-even-2_3-1024_1024_1024_1024_2_1-test_sine_inplace_f.x.log
aprun -n 6 test_sine_inplace_f.x > /lustre/scratch/djchen/logs/t0-even-2_3-1024_1024_1024_1024_2_1-test_sine_inplace_f.x.log
if($? > 0) then
echo t0-even-2_3-1024_1024_1024_1024_2_1-test_sine_inplace_f.x ERROR
else
echo t0-even-2_3-1024_1024_1024_1024_2_1-test_sine_inplace_f.x OK
endif
echo 2 2 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t0-even-2_2-1024_1024_1024_1024_2_1-test_sine_inplace_f.x.log
aprun -n 4 test_sine_inplace_f.x > /lustre/scratch/djchen/logs/t0-even-2_2-1024_1024_1024_1024_2_1-test_sine_inplace_f.x.log
if($? > 0) then
echo t0-even-2_2-1024_1024_1024_1024_2_1-test_sine_inplace_f.x ERROR
else
echo t0-even-2_2-1024_1024_1024_1024_2_1-test_sine_inplace_f.x OK
endif
echo 1 4 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t0-even-1_4-1024_1024_1024_1024_2_1-test_sine_inplace_f.x.log
aprun -n 4 test_sine_inplace_f.x > /lustre/scratch/djchen/logs/t0-even-1_4-1024_1024_1024_1024_2_1-test_sine_inplace_f.x.log
if($? > 0) then
echo t0-even-1_4-1024_1024_1024_1024_2_1-test_sine_inplace_f.x ERROR
else
echo t0-even-1_4-1024_1024_1024_1024_2_1-test_sine_inplace_f.x OK
endif
echo 4 1 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t0-even-4_1-1024_1024_1024_1024_2_1-test_sine_inplace_f.x.log
aprun -n 4 test_sine_inplace_f.x > /lustre/scratch/djchen/logs/t0-even-4_1-1024_1024_1024_1024_2_1-test_sine_inplace_f.x.log
if($? > 0) then
echo t0-even-4_1-1024_1024_1024_1024_2_1-test_sine_inplace_f.x ERROR
else
echo t0-even-4_1-1024_1024_1024_1024_2_1-test_sine_inplace_f.x OK
endif
echo 1 1 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t0-even-1_1-1024_1024_1024_1024_2_1-test_sine_inplace_f.x.log
aprun -n 1 test_sine_inplace_f.x > /lustre/scratch/djchen/logs/t0-even-1_1-1024_1024_1024_1024_2_1-test_sine_inplace_f.x.log
if($? > 0) then
echo t0-even-1_1-1024_1024_1024_1024_2_1-test_sine_inplace_f.x ERROR
else
echo t0-even-1_1-1024_1024_1024_1024_2_1-test_sine_inplace_f.x OK
endif
echo 3 2 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t0-even-3_2-1024_1024_1024_1024_2_1-test_spec_c.x.log
aprun -n 6 test_spec_c.x > /lustre/scratch/djchen/logs/t0-even-3_2-1024_1024_1024_1024_2_1-test_spec_c.x.log
if($? > 0) then
echo t0-even-3_2-1024_1024_1024_1024_2_1-test_spec_c.x ERROR
else
echo t0-even-3_2-1024_1024_1024_1024_2_1-test_spec_c.x OK
endif
echo 2 3 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t0-even-2_3-1024_1024_1024_1024_2_1-test_spec_c.x.log
aprun -n 6 test_spec_c.x > /lustre/scratch/djchen/logs/t0-even-2_3-1024_1024_1024_1024_2_1-test_spec_c.x.log
if($? > 0) then
echo t0-even-2_3-1024_1024_1024_1024_2_1-test_spec_c.x ERROR
else
echo t0-even-2_3-1024_1024_1024_1024_2_1-test_spec_c.x OK
endif
echo 2 2 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t0-even-2_2-1024_1024_1024_1024_2_1-test_spec_c.x.log
aprun -n 4 test_spec_c.x > /lustre/scratch/djchen/logs/t0-even-2_2-1024_1024_1024_1024_2_1-test_spec_c.x.log
if($? > 0) then
echo t0-even-2_2-1024_1024_1024_1024_2_1-test_spec_c.x ERROR
else
echo t0-even-2_2-1024_1024_1024_1024_2_1-test_spec_c.x OK
endif
echo 1 4 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t0-even-1_4-1024_1024_1024_1024_2_1-test_spec_c.x.log
aprun -n 4 test_spec_c.x > /lustre/scratch/djchen/logs/t0-even-1_4-1024_1024_1024_1024_2_1-test_spec_c.x.log
if($? > 0) then
echo t0-even-1_4-1024_1024_1024_1024_2_1-test_spec_c.x ERROR
else
echo t0-even-1_4-1024_1024_1024_1024_2_1-test_spec_c.x OK
endif
echo 4 1 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t0-even-4_1-1024_1024_1024_1024_2_1-test_spec_c.x.log
aprun -n 4 test_spec_c.x > /lustre/scratch/djchen/logs/t0-even-4_1-1024_1024_1024_1024_2_1-test_spec_c.x.log
if($? > 0) then
echo t0-even-4_1-1024_1024_1024_1024_2_1-test_spec_c.x ERROR
else
echo t0-even-4_1-1024_1024_1024_1024_2_1-test_spec_c.x OK
endif
echo 1 1 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t0-even-1_1-1024_1024_1024_1024_2_1-test_spec_c.x.log
aprun -n 1 test_spec_c.x > /lustre/scratch/djchen/logs/t0-even-1_1-1024_1024_1024_1024_2_1-test_spec_c.x.log
if($? > 0) then
echo t0-even-1_1-1024_1024_1024_1024_2_1-test_spec_c.x ERROR
else
echo t0-even-1_1-1024_1024_1024_1024_2_1-test_spec_c.x OK
endif
echo 3 2 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t0-even-3_2-1024_1024_1024_1024_2_1-test_spec_f.x.log
aprun -n 6 test_spec_f.x > /lustre/scratch/djchen/logs/t0-even-3_2-1024_1024_1024_1024_2_1-test_spec_f.x.log
if($? > 0) then
echo t0-even-3_2-1024_1024_1024_1024_2_1-test_spec_f.x ERROR
else
echo t0-even-3_2-1024_1024_1024_1024_2_1-test_spec_f.x OK
endif
echo 2 3 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t0-even-2_3-1024_1024_1024_1024_2_1-test_spec_f.x.log
aprun -n 6 test_spec_f.x > /lustre/scratch/djchen/logs/t0-even-2_3-1024_1024_1024_1024_2_1-test_spec_f.x.log
if($? > 0) then
echo t0-even-2_3-1024_1024_1024_1024_2_1-test_spec_f.x ERROR
else
echo t0-even-2_3-1024_1024_1024_1024_2_1-test_spec_f.x OK
endif
echo 2 2 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t0-even-2_2-1024_1024_1024_1024_2_1-test_spec_f.x.log
aprun -n 4 test_spec_f.x > /lustre/scratch/djchen/logs/t0-even-2_2-1024_1024_1024_1024_2_1-test_spec_f.x.log
if($? > 0) then
echo t0-even-2_2-1024_1024_1024_1024_2_1-test_spec_f.x ERROR
else
echo t0-even-2_2-1024_1024_1024_1024_2_1-test_spec_f.x OK
endif
echo 1 4 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t0-even-1_4-1024_1024_1024_1024_2_1-test_spec_f.x.log
aprun -n 4 test_spec_f.x > /lustre/scratch/djchen/logs/t0-even-1_4-1024_1024_1024_1024_2_1-test_spec_f.x.log
if($? > 0) then
echo t0-even-1_4-1024_1024_1024_1024_2_1-test_spec_f.x ERROR
else
echo t0-even-1_4-1024_1024_1024_1024_2_1-test_spec_f.x OK
endif
echo 4 1 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t0-even-4_1-1024_1024_1024_1024_2_1-test_spec_f.x.log
aprun -n 4 test_spec_f.x > /lustre/scratch/djchen/logs/t0-even-4_1-1024_1024_1024_1024_2_1-test_spec_f.x.log
if($? > 0) then
echo t0-even-4_1-1024_1024_1024_1024_2_1-test_spec_f.x ERROR
else
echo t0-even-4_1-1024_1024_1024_1024_2_1-test_spec_f.x OK
endif
echo 1 1 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t0-even-1_1-1024_1024_1024_1024_2_1-test_spec_f.x.log
aprun -n 1 test_spec_f.x > /lustre/scratch/djchen/logs/t0-even-1_1-1024_1024_1024_1024_2_1-test_spec_f.x.log
if($? > 0) then
echo t0-even-1_1-1024_1024_1024_1024_2_1-test_spec_f.x ERROR
else
echo t0-even-1_1-1024_1024_1024_1024_2_1-test_spec_f.x OK
endif
cd /lustre/scratch/djchen/p3dfft-test/test0-stride1/sample
echo 3 2 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t0-stride1-3_2-1024_1024_1024_1024_2_1-test_inverse_c.x.log
aprun -n 6 test_inverse_c.x > /lustre/scratch/djchen/logs/t0-stride1-3_2-1024_1024_1024_1024_2_1-test_inverse_c.x.log
if($? > 0) then
echo t0-stride1-3_2-1024_1024_1024_1024_2_1-test_inverse_c.x ERROR
else
echo t0-stride1-3_2-1024_1024_1024_1024_2_1-test_inverse_c.x OK
endif
echo 2 3 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t0-stride1-2_3-1024_1024_1024_1024_2_1-test_inverse_c.x.log
aprun -n 6 test_inverse_c.x > /lustre/scratch/djchen/logs/t0-stride1-2_3-1024_1024_1024_1024_2_1-test_inverse_c.x.log
if($? > 0) then
echo t0-stride1-2_3-1024_1024_1024_1024_2_1-test_inverse_c.x ERROR
else
echo t0-stride1-2_3-1024_1024_1024_1024_2_1-test_inverse_c.x OK
endif
echo 2 2 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t0-stride1-2_2-1024_1024_1024_1024_2_1-test_inverse_c.x.log
aprun -n 4 test_inverse_c.x > /lustre/scratch/djchen/logs/t0-stride1-2_2-1024_1024_1024_1024_2_1-test_inverse_c.x.log
if($? > 0) then
echo t0-stride1-2_2-1024_1024_1024_1024_2_1-test_inverse_c.x ERROR
else
echo t0-stride1-2_2-1024_1024_1024_1024_2_1-test_inverse_c.x OK
endif
echo 1 4 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t0-stride1-1_4-1024_1024_1024_1024_2_1-test_inverse_c.x.log
aprun -n 4 test_inverse_c.x > /lustre/scratch/djchen/logs/t0-stride1-1_4-1024_1024_1024_1024_2_1-test_inverse_c.x.log
if($? > 0) then
echo t0-stride1-1_4-1024_1024_1024_1024_2_1-test_inverse_c.x ERROR
else
echo t0-stride1-1_4-1024_1024_1024_1024_2_1-test_inverse_c.x OK
endif
echo 4 1 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t0-stride1-4_1-1024_1024_1024_1024_2_1-test_inverse_c.x.log
aprun -n 4 test_inverse_c.x > /lustre/scratch/djchen/logs/t0-stride1-4_1-1024_1024_1024_1024_2_1-test_inverse_c.x.log
if($? > 0) then
echo t0-stride1-4_1-1024_1024_1024_1024_2_1-test_inverse_c.x ERROR
else
echo t0-stride1-4_1-1024_1024_1024_1024_2_1-test_inverse_c.x OK
endif
echo 1 1 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t0-stride1-1_1-1024_1024_1024_1024_2_1-test_inverse_c.x.log
aprun -n 1 test_inverse_c.x > /lustre/scratch/djchen/logs/t0-stride1-1_1-1024_1024_1024_1024_2_1-test_inverse_c.x.log
if($? > 0) then
echo t0-stride1-1_1-1024_1024_1024_1024_2_1-test_inverse_c.x ERROR
else
echo t0-stride1-1_1-1024_1024_1024_1024_2_1-test_inverse_c.x OK
endif
echo 3 2 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t0-stride1-3_2-1024_1024_1024_1024_2_1-test_inverse_f.x.log
aprun -n 6 test_inverse_f.x > /lustre/scratch/djchen/logs/t0-stride1-3_2-1024_1024_1024_1024_2_1-test_inverse_f.x.log
if($? > 0) then
echo t0-stride1-3_2-1024_1024_1024_1024_2_1-test_inverse_f.x ERROR
else
echo t0-stride1-3_2-1024_1024_1024_1024_2_1-test_inverse_f.x OK
endif
echo 2 3 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t0-stride1-2_3-1024_1024_1024_1024_2_1-test_inverse_f.x.log
aprun -n 6 test_inverse_f.x > /lustre/scratch/djchen/logs/t0-stride1-2_3-1024_1024_1024_1024_2_1-test_inverse_f.x.log
if($? > 0) then
echo t0-stride1-2_3-1024_1024_1024_1024_2_1-test_inverse_f.x ERROR
else
echo t0-stride1-2_3-1024_1024_1024_1024_2_1-test_inverse_f.x OK
endif
echo 2 2 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t0-stride1-2_2-1024_1024_1024_1024_2_1-test_inverse_f.x.log
aprun -n 4 test_inverse_f.x > /lustre/scratch/djchen/logs/t0-stride1-2_2-1024_1024_1024_1024_2_1-test_inverse_f.x.log
if($? > 0) then
echo t0-stride1-2_2-1024_1024_1024_1024_2_1-test_inverse_f.x ERROR
else
echo t0-stride1-2_2-1024_1024_1024_1024_2_1-test_inverse_f.x OK
endif
echo 1 4 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t0-stride1-1_4-1024_1024_1024_1024_2_1-test_inverse_f.x.log
aprun -n 4 test_inverse_f.x > /lustre/scratch/djchen/logs/t0-stride1-1_4-1024_1024_1024_1024_2_1-test_inverse_f.x.log
if($? > 0) then
echo t0-stride1-1_4-1024_1024_1024_1024_2_1-test_inverse_f.x ERROR
else
echo t0-stride1-1_4-1024_1024_1024_1024_2_1-test_inverse_f.x OK
endif
echo 4 1 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t0-stride1-4_1-1024_1024_1024_1024_2_1-test_inverse_f.x.log
aprun -n 4 test_inverse_f.x > /lustre/scratch/djchen/logs/t0-stride1-4_1-1024_1024_1024_1024_2_1-test_inverse_f.x.log
if($? > 0) then
echo t0-stride1-4_1-1024_1024_1024_1024_2_1-test_inverse_f.x ERROR
else
echo t0-stride1-4_1-1024_1024_1024_1024_2_1-test_inverse_f.x OK
endif
echo 1 1 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t0-stride1-1_1-1024_1024_1024_1024_2_1-test_inverse_f.x.log
aprun -n 1 test_inverse_f.x > /lustre/scratch/djchen/logs/t0-stride1-1_1-1024_1024_1024_1024_2_1-test_inverse_f.x.log
if($? > 0) then
echo t0-stride1-1_1-1024_1024_1024_1024_2_1-test_inverse_f.x ERROR
else
echo t0-stride1-1_1-1024_1024_1024_1024_2_1-test_inverse_f.x OK
endif
echo 3 2 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t0-stride1-3_2-1024_1024_1024_1024_2_1-test_rand_c.x.log
aprun -n 6 test_rand_c.x > /lustre/scratch/djchen/logs/t0-stride1-3_2-1024_1024_1024_1024_2_1-test_rand_c.x.log
if($? > 0) then
echo t0-stride1-3_2-1024_1024_1024_1024_2_1-test_rand_c.x ERROR
else
echo t0-stride1-3_2-1024_1024_1024_1024_2_1-test_rand_c.x OK
endif
echo 2 3 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t0-stride1-2_3-1024_1024_1024_1024_2_1-test_rand_c.x.log
aprun -n 6 test_rand_c.x > /lustre/scratch/djchen/logs/t0-stride1-2_3-1024_1024_1024_1024_2_1-test_rand_c.x.log
if($? > 0) then
echo t0-stride1-2_3-1024_1024_1024_1024_2_1-test_rand_c.x ERROR
else
echo t0-stride1-2_3-1024_1024_1024_1024_2_1-test_rand_c.x OK
endif
echo 2 2 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t0-stride1-2_2-1024_1024_1024_1024_2_1-test_rand_c.x.log
aprun -n 4 test_rand_c.x > /lustre/scratch/djchen/logs/t0-stride1-2_2-1024_1024_1024_1024_2_1-test_rand_c.x.log
if($? > 0) then
echo t0-stride1-2_2-1024_1024_1024_1024_2_1-test_rand_c.x ERROR
else
echo t0-stride1-2_2-1024_1024_1024_1024_2_1-test_rand_c.x OK
endif
echo 1 4 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t0-stride1-1_4-1024_1024_1024_1024_2_1-test_rand_c.x.log
aprun -n 4 test_rand_c.x > /lustre/scratch/djchen/logs/t0-stride1-1_4-1024_1024_1024_1024_2_1-test_rand_c.x.log
if($? > 0) then
echo t0-stride1-1_4-1024_1024_1024_1024_2_1-test_rand_c.x ERROR
else
echo t0-stride1-1_4-1024_1024_1024_1024_2_1-test_rand_c.x OK
endif
echo 4 1 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t0-stride1-4_1-1024_1024_1024_1024_2_1-test_rand_c.x.log
aprun -n 4 test_rand_c.x > /lustre/scratch/djchen/logs/t0-stride1-4_1-1024_1024_1024_1024_2_1-test_rand_c.x.log
if($? > 0) then
echo t0-stride1-4_1-1024_1024_1024_1024_2_1-test_rand_c.x ERROR
else
echo t0-stride1-4_1-1024_1024_1024_1024_2_1-test_rand_c.x OK
endif
echo 1 1 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t0-stride1-1_1-1024_1024_1024_1024_2_1-test_rand_c.x.log
aprun -n 1 test_rand_c.x > /lustre/scratch/djchen/logs/t0-stride1-1_1-1024_1024_1024_1024_2_1-test_rand_c.x.log
if($? > 0) then
echo t0-stride1-1_1-1024_1024_1024_1024_2_1-test_rand_c.x ERROR
else
echo t0-stride1-1_1-1024_1024_1024_1024_2_1-test_rand_c.x OK
endif
echo 3 2 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t0-stride1-3_2-1024_1024_1024_1024_2_1-test_rand_f.x.log
aprun -n 6 test_rand_f.x > /lustre/scratch/djchen/logs/t0-stride1-3_2-1024_1024_1024_1024_2_1-test_rand_f.x.log
if($? > 0) then
echo t0-stride1-3_2-1024_1024_1024_1024_2_1-test_rand_f.x ERROR
else
echo t0-stride1-3_2-1024_1024_1024_1024_2_1-test_rand_f.x OK
endif
echo 2 3 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t0-stride1-2_3-1024_1024_1024_1024_2_1-test_rand_f.x.log
aprun -n 6 test_rand_f.x > /lustre/scratch/djchen/logs/t0-stride1-2_3-1024_1024_1024_1024_2_1-test_rand_f.x.log
if($? > 0) then
echo t0-stride1-2_3-1024_1024_1024_1024_2_1-test_rand_f.x ERROR
else
echo t0-stride1-2_3-1024_1024_1024_1024_2_1-test_rand_f.x OK
endif
echo 2 2 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t0-stride1-2_2-1024_1024_1024_1024_2_1-test_rand_f.x.log
aprun -n 4 test_rand_f.x > /lustre/scratch/djchen/logs/t0-stride1-2_2-1024_1024_1024_1024_2_1-test_rand_f.x.log
if($? > 0) then
echo t0-stride1-2_2-1024_1024_1024_1024_2_1-test_rand_f.x ERROR
else
echo t0-stride1-2_2-1024_1024_1024_1024_2_1-test_rand_f.x OK
endif
echo 1 4 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t0-stride1-1_4-1024_1024_1024_1024_2_1-test_rand_f.x.log
aprun -n 4 test_rand_f.x > /lustre/scratch/djchen/logs/t0-stride1-1_4-1024_1024_1024_1024_2_1-test_rand_f.x.log
if($? > 0) then
echo t0-stride1-1_4-1024_1024_1024_1024_2_1-test_rand_f.x ERROR
else
echo t0-stride1-1_4-1024_1024_1024_1024_2_1-test_rand_f.x OK
endif
echo 4 1 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t0-stride1-4_1-1024_1024_1024_1024_2_1-test_rand_f.x.log
aprun -n 4 test_rand_f.x > /lustre/scratch/djchen/logs/t0-stride1-4_1-1024_1024_1024_1024_2_1-test_rand_f.x.log
if($? > 0) then
echo t0-stride1-4_1-1024_1024_1024_1024_2_1-test_rand_f.x ERROR
else
echo t0-stride1-4_1-1024_1024_1024_1024_2_1-test_rand_f.x OK
endif
echo 1 1 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t0-stride1-1_1-1024_1024_1024_1024_2_1-test_rand_f.x.log
aprun -n 1 test_rand_f.x > /lustre/scratch/djchen/logs/t0-stride1-1_1-1024_1024_1024_1024_2_1-test_rand_f.x.log
if($? > 0) then
echo t0-stride1-1_1-1024_1024_1024_1024_2_1-test_rand_f.x ERROR
else
echo t0-stride1-1_1-1024_1024_1024_1024_2_1-test_rand_f.x OK
endif
echo 3 2 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t0-stride1-3_2-1024_1024_1024_1024_2_1-test_sine_c.x.log
aprun -n 6 test_sine_c.x > /lustre/scratch/djchen/logs/t0-stride1-3_2-1024_1024_1024_1024_2_1-test_sine_c.x.log
if($? > 0) then
echo t0-stride1-3_2-1024_1024_1024_1024_2_1-test_sine_c.x ERROR
else
echo t0-stride1-3_2-1024_1024_1024_1024_2_1-test_sine_c.x OK
endif
echo 2 3 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t0-stride1-2_3-1024_1024_1024_1024_2_1-test_sine_c.x.log
aprun -n 6 test_sine_c.x > /lustre/scratch/djchen/logs/t0-stride1-2_3-1024_1024_1024_1024_2_1-test_sine_c.x.log
if($? > 0) then
echo t0-stride1-2_3-1024_1024_1024_1024_2_1-test_sine_c.x ERROR
else
echo t0-stride1-2_3-1024_1024_1024_1024_2_1-test_sine_c.x OK
endif
echo 2 2 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t0-stride1-2_2-1024_1024_1024_1024_2_1-test_sine_c.x.log
aprun -n 4 test_sine_c.x > /lustre/scratch/djchen/logs/t0-stride1-2_2-1024_1024_1024_1024_2_1-test_sine_c.x.log
if($? > 0) then
echo t0-stride1-2_2-1024_1024_1024_1024_2_1-test_sine_c.x ERROR
else
echo t0-stride1-2_2-1024_1024_1024_1024_2_1-test_sine_c.x OK
endif
echo 1 4 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t0-stride1-1_4-1024_1024_1024_1024_2_1-test_sine_c.x.log
aprun -n 4 test_sine_c.x > /lustre/scratch/djchen/logs/t0-stride1-1_4-1024_1024_1024_1024_2_1-test_sine_c.x.log
if($? > 0) then
echo t0-stride1-1_4-1024_1024_1024_1024_2_1-test_sine_c.x ERROR
else
echo t0-stride1-1_4-1024_1024_1024_1024_2_1-test_sine_c.x OK
endif
echo 4 1 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t0-stride1-4_1-1024_1024_1024_1024_2_1-test_sine_c.x.log
aprun -n 4 test_sine_c.x > /lustre/scratch/djchen/logs/t0-stride1-4_1-1024_1024_1024_1024_2_1-test_sine_c.x.log
if($? > 0) then
echo t0-stride1-4_1-1024_1024_1024_1024_2_1-test_sine_c.x ERROR
else
echo t0-stride1-4_1-1024_1024_1024_1024_2_1-test_sine_c.x OK
endif
echo 1 1 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t0-stride1-1_1-1024_1024_1024_1024_2_1-test_sine_c.x.log
aprun -n 1 test_sine_c.x > /lustre/scratch/djchen/logs/t0-stride1-1_1-1024_1024_1024_1024_2_1-test_sine_c.x.log
if($? > 0) then
echo t0-stride1-1_1-1024_1024_1024_1024_2_1-test_sine_c.x ERROR
else
echo t0-stride1-1_1-1024_1024_1024_1024_2_1-test_sine_c.x OK
endif
echo 3 2 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t0-stride1-3_2-1024_1024_1024_1024_2_1-test_sine_f.x.log
aprun -n 6 test_sine_f.x > /lustre/scratch/djchen/logs/t0-stride1-3_2-1024_1024_1024_1024_2_1-test_sine_f.x.log
if($? > 0) then
echo t0-stride1-3_2-1024_1024_1024_1024_2_1-test_sine_f.x ERROR
else
echo t0-stride1-3_2-1024_1024_1024_1024_2_1-test_sine_f.x OK
endif
echo 2 3 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t0-stride1-2_3-1024_1024_1024_1024_2_1-test_sine_f.x.log
aprun -n 6 test_sine_f.x > /lustre/scratch/djchen/logs/t0-stride1-2_3-1024_1024_1024_1024_2_1-test_sine_f.x.log
if($? > 0) then
echo t0-stride1-2_3-1024_1024_1024_1024_2_1-test_sine_f.x ERROR
else
echo t0-stride1-2_3-1024_1024_1024_1024_2_1-test_sine_f.x OK
endif
echo 2 2 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t0-stride1-2_2-1024_1024_1024_1024_2_1-test_sine_f.x.log
aprun -n 4 test_sine_f.x > /lustre/scratch/djchen/logs/t0-stride1-2_2-1024_1024_1024_1024_2_1-test_sine_f.x.log
if($? > 0) then
echo t0-stride1-2_2-1024_1024_1024_1024_2_1-test_sine_f.x ERROR
else
echo t0-stride1-2_2-1024_1024_1024_1024_2_1-test_sine_f.x OK
endif
echo 1 4 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t0-stride1-1_4-1024_1024_1024_1024_2_1-test_sine_f.x.log
aprun -n 4 test_sine_f.x > /lustre/scratch/djchen/logs/t0-stride1-1_4-1024_1024_1024_1024_2_1-test_sine_f.x.log
if($? > 0) then
echo t0-stride1-1_4-1024_1024_1024_1024_2_1-test_sine_f.x ERROR
else
echo t0-stride1-1_4-1024_1024_1024_1024_2_1-test_sine_f.x OK
endif
echo 4 1 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t0-stride1-4_1-1024_1024_1024_1024_2_1-test_sine_f.x.log
aprun -n 4 test_sine_f.x > /lustre/scratch/djchen/logs/t0-stride1-4_1-1024_1024_1024_1024_2_1-test_sine_f.x.log
if($? > 0) then
echo t0-stride1-4_1-1024_1024_1024_1024_2_1-test_sine_f.x ERROR
else
echo t0-stride1-4_1-1024_1024_1024_1024_2_1-test_sine_f.x OK
endif
echo 1 1 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t0-stride1-1_1-1024_1024_1024_1024_2_1-test_sine_f.x.log
aprun -n 1 test_sine_f.x > /lustre/scratch/djchen/logs/t0-stride1-1_1-1024_1024_1024_1024_2_1-test_sine_f.x.log
if($? > 0) then
echo t0-stride1-1_1-1024_1024_1024_1024_2_1-test_sine_f.x ERROR
else
echo t0-stride1-1_1-1024_1024_1024_1024_2_1-test_sine_f.x OK
endif
echo 3 2 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t0-stride1-3_2-1024_1024_1024_1024_2_1-test_sine_inplace_c.x.log
aprun -n 6 test_sine_inplace_c.x > /lustre/scratch/djchen/logs/t0-stride1-3_2-1024_1024_1024_1024_2_1-test_sine_inplace_c.x.log
if($? > 0) then
echo t0-stride1-3_2-1024_1024_1024_1024_2_1-test_sine_inplace_c.x ERROR
else
echo t0-stride1-3_2-1024_1024_1024_1024_2_1-test_sine_inplace_c.x OK
endif
echo 2 3 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t0-stride1-2_3-1024_1024_1024_1024_2_1-test_sine_inplace_c.x.log
aprun -n 6 test_sine_inplace_c.x > /lustre/scratch/djchen/logs/t0-stride1-2_3-1024_1024_1024_1024_2_1-test_sine_inplace_c.x.log
if($? > 0) then
echo t0-stride1-2_3-1024_1024_1024_1024_2_1-test_sine_inplace_c.x ERROR
else
echo t0-stride1-2_3-1024_1024_1024_1024_2_1-test_sine_inplace_c.x OK
endif
echo 2 2 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t0-stride1-2_2-1024_1024_1024_1024_2_1-test_sine_inplace_c.x.log
aprun -n 4 test_sine_inplace_c.x > /lustre/scratch/djchen/logs/t0-stride1-2_2-1024_1024_1024_1024_2_1-test_sine_inplace_c.x.log
if($? > 0) then
echo t0-stride1-2_2-1024_1024_1024_1024_2_1-test_sine_inplace_c.x ERROR
else
echo t0-stride1-2_2-1024_1024_1024_1024_2_1-test_sine_inplace_c.x OK
endif
echo 1 4 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t0-stride1-1_4-1024_1024_1024_1024_2_1-test_sine_inplace_c.x.log
aprun -n 4 test_sine_inplace_c.x > /lustre/scratch/djchen/logs/t0-stride1-1_4-1024_1024_1024_1024_2_1-test_sine_inplace_c.x.log
if($? > 0) then
echo t0-stride1-1_4-1024_1024_1024_1024_2_1-test_sine_inplace_c.x ERROR
else
echo t0-stride1-1_4-1024_1024_1024_1024_2_1-test_sine_inplace_c.x OK
endif
echo 4 1 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t0-stride1-4_1-1024_1024_1024_1024_2_1-test_sine_inplace_c.x.log
aprun -n 4 test_sine_inplace_c.x > /lustre/scratch/djchen/logs/t0-stride1-4_1-1024_1024_1024_1024_2_1-test_sine_inplace_c.x.log
if($? > 0) then
echo t0-stride1-4_1-1024_1024_1024_1024_2_1-test_sine_inplace_c.x ERROR
else
echo t0-stride1-4_1-1024_1024_1024_1024_2_1-test_sine_inplace_c.x OK
endif
echo 1 1 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t0-stride1-1_1-1024_1024_1024_1024_2_1-test_sine_inplace_c.x.log
aprun -n 1 test_sine_inplace_c.x > /lustre/scratch/djchen/logs/t0-stride1-1_1-1024_1024_1024_1024_2_1-test_sine_inplace_c.x.log
if($? > 0) then
echo t0-stride1-1_1-1024_1024_1024_1024_2_1-test_sine_inplace_c.x ERROR
else
echo t0-stride1-1_1-1024_1024_1024_1024_2_1-test_sine_inplace_c.x OK
endif
echo 3 2 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t0-stride1-3_2-1024_1024_1024_1024_2_1-test_sine_inplace_f.x.log
aprun -n 6 test_sine_inplace_f.x > /lustre/scratch/djchen/logs/t0-stride1-3_2-1024_1024_1024_1024_2_1-test_sine_inplace_f.x.log
if($? > 0) then
echo t0-stride1-3_2-1024_1024_1024_1024_2_1-test_sine_inplace_f.x ERROR
else
echo t0-stride1-3_2-1024_1024_1024_1024_2_1-test_sine_inplace_f.x OK
endif
echo 2 3 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t0-stride1-2_3-1024_1024_1024_1024_2_1-test_sine_inplace_f.x.log
aprun -n 6 test_sine_inplace_f.x > /lustre/scratch/djchen/logs/t0-stride1-2_3-1024_1024_1024_1024_2_1-test_sine_inplace_f.x.log
if($? > 0) then
echo t0-stride1-2_3-1024_1024_1024_1024_2_1-test_sine_inplace_f.x ERROR
else
echo t0-stride1-2_3-1024_1024_1024_1024_2_1-test_sine_inplace_f.x OK
endif
echo 2 2 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t0-stride1-2_2-1024_1024_1024_1024_2_1-test_sine_inplace_f.x.log
aprun -n 4 test_sine_inplace_f.x > /lustre/scratch/djchen/logs/t0-stride1-2_2-1024_1024_1024_1024_2_1-test_sine_inplace_f.x.log
if($? > 0) then
echo t0-stride1-2_2-1024_1024_1024_1024_2_1-test_sine_inplace_f.x ERROR
else
echo t0-stride1-2_2-1024_1024_1024_1024_2_1-test_sine_inplace_f.x OK
endif
echo 1 4 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t0-stride1-1_4-1024_1024_1024_1024_2_1-test_sine_inplace_f.x.log
aprun -n 4 test_sine_inplace_f.x > /lustre/scratch/djchen/logs/t0-stride1-1_4-1024_1024_1024_1024_2_1-test_sine_inplace_f.x.log
if($? > 0) then
echo t0-stride1-1_4-1024_1024_1024_1024_2_1-test_sine_inplace_f.x ERROR
else
echo t0-stride1-1_4-1024_1024_1024_1024_2_1-test_sine_inplace_f.x OK
endif
echo 4 1 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t0-stride1-4_1-1024_1024_1024_1024_2_1-test_sine_inplace_f.x.log
aprun -n 4 test_sine_inplace_f.x > /lustre/scratch/djchen/logs/t0-stride1-4_1-1024_1024_1024_1024_2_1-test_sine_inplace_f.x.log
if($? > 0) then
echo t0-stride1-4_1-1024_1024_1024_1024_2_1-test_sine_inplace_f.x ERROR
else
echo t0-stride1-4_1-1024_1024_1024_1024_2_1-test_sine_inplace_f.x OK
endif
echo 1 1 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t0-stride1-1_1-1024_1024_1024_1024_2_1-test_sine_inplace_f.x.log
aprun -n 1 test_sine_inplace_f.x > /lustre/scratch/djchen/logs/t0-stride1-1_1-1024_1024_1024_1024_2_1-test_sine_inplace_f.x.log
if($? > 0) then
echo t0-stride1-1_1-1024_1024_1024_1024_2_1-test_sine_inplace_f.x ERROR
else
echo t0-stride1-1_1-1024_1024_1024_1024_2_1-test_sine_inplace_f.x OK
endif
echo 3 2 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t0-stride1-3_2-1024_1024_1024_1024_2_1-test_spec_c.x.log
aprun -n 6 test_spec_c.x > /lustre/scratch/djchen/logs/t0-stride1-3_2-1024_1024_1024_1024_2_1-test_spec_c.x.log
if($? > 0) then
echo t0-stride1-3_2-1024_1024_1024_1024_2_1-test_spec_c.x ERROR
else
echo t0-stride1-3_2-1024_1024_1024_1024_2_1-test_spec_c.x OK
endif
echo 2 3 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t0-stride1-2_3-1024_1024_1024_1024_2_1-test_spec_c.x.log
aprun -n 6 test_spec_c.x > /lustre/scratch/djchen/logs/t0-stride1-2_3-1024_1024_1024_1024_2_1-test_spec_c.x.log
if($? > 0) then
echo t0-stride1-2_3-1024_1024_1024_1024_2_1-test_spec_c.x ERROR
else
echo t0-stride1-2_3-1024_1024_1024_1024_2_1-test_spec_c.x OK
endif
echo 2 2 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t0-stride1-2_2-1024_1024_1024_1024_2_1-test_spec_c.x.log
aprun -n 4 test_spec_c.x > /lustre/scratch/djchen/logs/t0-stride1-2_2-1024_1024_1024_1024_2_1-test_spec_c.x.log
if($? > 0) then
echo t0-stride1-2_2-1024_1024_1024_1024_2_1-test_spec_c.x ERROR
else
echo t0-stride1-2_2-1024_1024_1024_1024_2_1-test_spec_c.x OK
endif
echo 1 4 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t0-stride1-1_4-1024_1024_1024_1024_2_1-test_spec_c.x.log
aprun -n 4 test_spec_c.x > /lustre/scratch/djchen/logs/t0-stride1-1_4-1024_1024_1024_1024_2_1-test_spec_c.x.log
if($? > 0) then
echo t0-stride1-1_4-1024_1024_1024_1024_2_1-test_spec_c.x ERROR
else
echo t0-stride1-1_4-1024_1024_1024_1024_2_1-test_spec_c.x OK
endif
echo 4 1 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t0-stride1-4_1-1024_1024_1024_1024_2_1-test_spec_c.x.log
aprun -n 4 test_spec_c.x > /lustre/scratch/djchen/logs/t0-stride1-4_1-1024_1024_1024_1024_2_1-test_spec_c.x.log
if($? > 0) then
echo t0-stride1-4_1-1024_1024_1024_1024_2_1-test_spec_c.x ERROR
else
echo t0-stride1-4_1-1024_1024_1024_1024_2_1-test_spec_c.x OK
endif
echo 1 1 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t0-stride1-1_1-1024_1024_1024_1024_2_1-test_spec_c.x.log
aprun -n 1 test_spec_c.x > /lustre/scratch/djchen/logs/t0-stride1-1_1-1024_1024_1024_1024_2_1-test_spec_c.x.log
if($? > 0) then
echo t0-stride1-1_1-1024_1024_1024_1024_2_1-test_spec_c.x ERROR
else
echo t0-stride1-1_1-1024_1024_1024_1024_2_1-test_spec_c.x OK
endif
echo 3 2 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t0-stride1-3_2-1024_1024_1024_1024_2_1-test_spec_f.x.log
aprun -n 6 test_spec_f.x > /lustre/scratch/djchen/logs/t0-stride1-3_2-1024_1024_1024_1024_2_1-test_spec_f.x.log
if($? > 0) then
echo t0-stride1-3_2-1024_1024_1024_1024_2_1-test_spec_f.x ERROR
else
echo t0-stride1-3_2-1024_1024_1024_1024_2_1-test_spec_f.x OK
endif
echo 2 3 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t0-stride1-2_3-1024_1024_1024_1024_2_1-test_spec_f.x.log
aprun -n 6 test_spec_f.x > /lustre/scratch/djchen/logs/t0-stride1-2_3-1024_1024_1024_1024_2_1-test_spec_f.x.log
if($? > 0) then
echo t0-stride1-2_3-1024_1024_1024_1024_2_1-test_spec_f.x ERROR
else
echo t0-stride1-2_3-1024_1024_1024_1024_2_1-test_spec_f.x OK
endif
echo 2 2 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t0-stride1-2_2-1024_1024_1024_1024_2_1-test_spec_f.x.log
aprun -n 4 test_spec_f.x > /lustre/scratch/djchen/logs/t0-stride1-2_2-1024_1024_1024_1024_2_1-test_spec_f.x.log
if($? > 0) then
echo t0-stride1-2_2-1024_1024_1024_1024_2_1-test_spec_f.x ERROR
else
echo t0-stride1-2_2-1024_1024_1024_1024_2_1-test_spec_f.x OK
endif
echo 1 4 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t0-stride1-1_4-1024_1024_1024_1024_2_1-test_spec_f.x.log
aprun -n 4 test_spec_f.x > /lustre/scratch/djchen/logs/t0-stride1-1_4-1024_1024_1024_1024_2_1-test_spec_f.x.log
if($? > 0) then
echo t0-stride1-1_4-1024_1024_1024_1024_2_1-test_spec_f.x ERROR
else
echo t0-stride1-1_4-1024_1024_1024_1024_2_1-test_spec_f.x OK
endif
echo 4 1 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t0-stride1-4_1-1024_1024_1024_1024_2_1-test_spec_f.x.log
aprun -n 4 test_spec_f.x > /lustre/scratch/djchen/logs/t0-stride1-4_1-1024_1024_1024_1024_2_1-test_spec_f.x.log
if($? > 0) then
echo t0-stride1-4_1-1024_1024_1024_1024_2_1-test_spec_f.x ERROR
else
echo t0-stride1-4_1-1024_1024_1024_1024_2_1-test_spec_f.x OK
endif
echo 1 1 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t0-stride1-1_1-1024_1024_1024_1024_2_1-test_spec_f.x.log
aprun -n 1 test_spec_f.x > /lustre/scratch/djchen/logs/t0-stride1-1_1-1024_1024_1024_1024_2_1-test_spec_f.x.log
if($? > 0) then
echo t0-stride1-1_1-1024_1024_1024_1024_2_1-test_spec_f.x ERROR
else
echo t0-stride1-1_1-1024_1024_1024_1024_2_1-test_spec_f.x OK
endif
cd /lustre/scratch/djchen/p3dfft-test/test0-even-stride1/sample
echo 3 2 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t0-even-stride1-3_2-1024_1024_1024_1024_2_1-test_inverse_c.x.log
aprun -n 6 test_inverse_c.x > /lustre/scratch/djchen/logs/t0-even-stride1-3_2-1024_1024_1024_1024_2_1-test_inverse_c.x.log
if($? > 0) then
echo t0-even-stride1-3_2-1024_1024_1024_1024_2_1-test_inverse_c.x ERROR
else
echo t0-even-stride1-3_2-1024_1024_1024_1024_2_1-test_inverse_c.x OK
endif
echo 2 3 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t0-even-stride1-2_3-1024_1024_1024_1024_2_1-test_inverse_c.x.log
aprun -n 6 test_inverse_c.x > /lustre/scratch/djchen/logs/t0-even-stride1-2_3-1024_1024_1024_1024_2_1-test_inverse_c.x.log
if($? > 0) then
echo t0-even-stride1-2_3-1024_1024_1024_1024_2_1-test_inverse_c.x ERROR
else
echo t0-even-stride1-2_3-1024_1024_1024_1024_2_1-test_inverse_c.x OK
endif
echo 2 2 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t0-even-stride1-2_2-1024_1024_1024_1024_2_1-test_inverse_c.x.log
aprun -n 4 test_inverse_c.x > /lustre/scratch/djchen/logs/t0-even-stride1-2_2-1024_1024_1024_1024_2_1-test_inverse_c.x.log
if($? > 0) then
echo t0-even-stride1-2_2-1024_1024_1024_1024_2_1-test_inverse_c.x ERROR
else
echo t0-even-stride1-2_2-1024_1024_1024_1024_2_1-test_inverse_c.x OK
endif
echo 1 4 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t0-even-stride1-1_4-1024_1024_1024_1024_2_1-test_inverse_c.x.log
aprun -n 4 test_inverse_c.x > /lustre/scratch/djchen/logs/t0-even-stride1-1_4-1024_1024_1024_1024_2_1-test_inverse_c.x.log
if($? > 0) then
echo t0-even-stride1-1_4-1024_1024_1024_1024_2_1-test_inverse_c.x ERROR
else
echo t0-even-stride1-1_4-1024_1024_1024_1024_2_1-test_inverse_c.x OK
endif
echo 4 1 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t0-even-stride1-4_1-1024_1024_1024_1024_2_1-test_inverse_c.x.log
aprun -n 4 test_inverse_c.x > /lustre/scratch/djchen/logs/t0-even-stride1-4_1-1024_1024_1024_1024_2_1-test_inverse_c.x.log
if($? > 0) then
echo t0-even-stride1-4_1-1024_1024_1024_1024_2_1-test_inverse_c.x ERROR
else
echo t0-even-stride1-4_1-1024_1024_1024_1024_2_1-test_inverse_c.x OK
endif
echo 1 1 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t0-even-stride1-1_1-1024_1024_1024_1024_2_1-test_inverse_c.x.log
aprun -n 1 test_inverse_c.x > /lustre/scratch/djchen/logs/t0-even-stride1-1_1-1024_1024_1024_1024_2_1-test_inverse_c.x.log
if($? > 0) then
echo t0-even-stride1-1_1-1024_1024_1024_1024_2_1-test_inverse_c.x ERROR
else
echo t0-even-stride1-1_1-1024_1024_1024_1024_2_1-test_inverse_c.x OK
endif
echo 3 2 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t0-even-stride1-3_2-1024_1024_1024_1024_2_1-test_inverse_f.x.log
aprun -n 6 test_inverse_f.x > /lustre/scratch/djchen/logs/t0-even-stride1-3_2-1024_1024_1024_1024_2_1-test_inverse_f.x.log
if($? > 0) then
echo t0-even-stride1-3_2-1024_1024_1024_1024_2_1-test_inverse_f.x ERROR
else
echo t0-even-stride1-3_2-1024_1024_1024_1024_2_1-test_inverse_f.x OK
endif
echo 2 3 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t0-even-stride1-2_3-1024_1024_1024_1024_2_1-test_inverse_f.x.log
aprun -n 6 test_inverse_f.x > /lustre/scratch/djchen/logs/t0-even-stride1-2_3-1024_1024_1024_1024_2_1-test_inverse_f.x.log
if($? > 0) then
echo t0-even-stride1-2_3-1024_1024_1024_1024_2_1-test_inverse_f.x ERROR
else
echo t0-even-stride1-2_3-1024_1024_1024_1024_2_1-test_inverse_f.x OK
endif
echo 2 2 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t0-even-stride1-2_2-1024_1024_1024_1024_2_1-test_inverse_f.x.log
aprun -n 4 test_inverse_f.x > /lustre/scratch/djchen/logs/t0-even-stride1-2_2-1024_1024_1024_1024_2_1-test_inverse_f.x.log
if($? > 0) then
echo t0-even-stride1-2_2-1024_1024_1024_1024_2_1-test_inverse_f.x ERROR
else
echo t0-even-stride1-2_2-1024_1024_1024_1024_2_1-test_inverse_f.x OK
endif
echo 1 4 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t0-even-stride1-1_4-1024_1024_1024_1024_2_1-test_inverse_f.x.log
aprun -n 4 test_inverse_f.x > /lustre/scratch/djchen/logs/t0-even-stride1-1_4-1024_1024_1024_1024_2_1-test_inverse_f.x.log
if($? > 0) then
echo t0-even-stride1-1_4-1024_1024_1024_1024_2_1-test_inverse_f.x ERROR
else
echo t0-even-stride1-1_4-1024_1024_1024_1024_2_1-test_inverse_f.x OK
endif
echo 4 1 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t0-even-stride1-4_1-1024_1024_1024_1024_2_1-test_inverse_f.x.log
aprun -n 4 test_inverse_f.x > /lustre/scratch/djchen/logs/t0-even-stride1-4_1-1024_1024_1024_1024_2_1-test_inverse_f.x.log
if($? > 0) then
echo t0-even-stride1-4_1-1024_1024_1024_1024_2_1-test_inverse_f.x ERROR
else
echo t0-even-stride1-4_1-1024_1024_1024_1024_2_1-test_inverse_f.x OK
endif
echo 1 1 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t0-even-stride1-1_1-1024_1024_1024_1024_2_1-test_inverse_f.x.log
aprun -n 1 test_inverse_f.x > /lustre/scratch/djchen/logs/t0-even-stride1-1_1-1024_1024_1024_1024_2_1-test_inverse_f.x.log
if($? > 0) then
echo t0-even-stride1-1_1-1024_1024_1024_1024_2_1-test_inverse_f.x ERROR
else
echo t0-even-stride1-1_1-1024_1024_1024_1024_2_1-test_inverse_f.x OK
endif
echo 3 2 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t0-even-stride1-3_2-1024_1024_1024_1024_2_1-test_rand_c.x.log
aprun -n 6 test_rand_c.x > /lustre/scratch/djchen/logs/t0-even-stride1-3_2-1024_1024_1024_1024_2_1-test_rand_c.x.log
if($? > 0) then
echo t0-even-stride1-3_2-1024_1024_1024_1024_2_1-test_rand_c.x ERROR
else
echo t0-even-stride1-3_2-1024_1024_1024_1024_2_1-test_rand_c.x OK
endif
echo 2 3 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t0-even-stride1-2_3-1024_1024_1024_1024_2_1-test_rand_c.x.log
aprun -n 6 test_rand_c.x > /lustre/scratch/djchen/logs/t0-even-stride1-2_3-1024_1024_1024_1024_2_1-test_rand_c.x.log
if($? > 0) then
echo t0-even-stride1-2_3-1024_1024_1024_1024_2_1-test_rand_c.x ERROR
else
echo t0-even-stride1-2_3-1024_1024_1024_1024_2_1-test_rand_c.x OK
endif
echo 2 2 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t0-even-stride1-2_2-1024_1024_1024_1024_2_1-test_rand_c.x.log
aprun -n 4 test_rand_c.x > /lustre/scratch/djchen/logs/t0-even-stride1-2_2-1024_1024_1024_1024_2_1-test_rand_c.x.log
if($? > 0) then
echo t0-even-stride1-2_2-1024_1024_1024_1024_2_1-test_rand_c.x ERROR
else
echo t0-even-stride1-2_2-1024_1024_1024_1024_2_1-test_rand_c.x OK
endif
echo 1 4 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t0-even-stride1-1_4-1024_1024_1024_1024_2_1-test_rand_c.x.log
aprun -n 4 test_rand_c.x > /lustre/scratch/djchen/logs/t0-even-stride1-1_4-1024_1024_1024_1024_2_1-test_rand_c.x.log
if($? > 0) then
echo t0-even-stride1-1_4-1024_1024_1024_1024_2_1-test_rand_c.x ERROR
else
echo t0-even-stride1-1_4-1024_1024_1024_1024_2_1-test_rand_c.x OK
endif
echo 4 1 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t0-even-stride1-4_1-1024_1024_1024_1024_2_1-test_rand_c.x.log
aprun -n 4 test_rand_c.x > /lustre/scratch/djchen/logs/t0-even-stride1-4_1-1024_1024_1024_1024_2_1-test_rand_c.x.log
if($? > 0) then
echo t0-even-stride1-4_1-1024_1024_1024_1024_2_1-test_rand_c.x ERROR
else
echo t0-even-stride1-4_1-1024_1024_1024_1024_2_1-test_rand_c.x OK
endif
echo 1 1 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t0-even-stride1-1_1-1024_1024_1024_1024_2_1-test_rand_c.x.log
aprun -n 1 test_rand_c.x > /lustre/scratch/djchen/logs/t0-even-stride1-1_1-1024_1024_1024_1024_2_1-test_rand_c.x.log
if($? > 0) then
echo t0-even-stride1-1_1-1024_1024_1024_1024_2_1-test_rand_c.x ERROR
else
echo t0-even-stride1-1_1-1024_1024_1024_1024_2_1-test_rand_c.x OK
endif
echo 3 2 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t0-even-stride1-3_2-1024_1024_1024_1024_2_1-test_rand_f.x.log
aprun -n 6 test_rand_f.x > /lustre/scratch/djchen/logs/t0-even-stride1-3_2-1024_1024_1024_1024_2_1-test_rand_f.x.log
if($? > 0) then
echo t0-even-stride1-3_2-1024_1024_1024_1024_2_1-test_rand_f.x ERROR
else
echo t0-even-stride1-3_2-1024_1024_1024_1024_2_1-test_rand_f.x OK
endif
echo 2 3 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t0-even-stride1-2_3-1024_1024_1024_1024_2_1-test_rand_f.x.log
aprun -n 6 test_rand_f.x > /lustre/scratch/djchen/logs/t0-even-stride1-2_3-1024_1024_1024_1024_2_1-test_rand_f.x.log
if($? > 0) then
echo t0-even-stride1-2_3-1024_1024_1024_1024_2_1-test_rand_f.x ERROR
else
echo t0-even-stride1-2_3-1024_1024_1024_1024_2_1-test_rand_f.x OK
endif
echo 2 2 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t0-even-stride1-2_2-1024_1024_1024_1024_2_1-test_rand_f.x.log
aprun -n 4 test_rand_f.x > /lustre/scratch/djchen/logs/t0-even-stride1-2_2-1024_1024_1024_1024_2_1-test_rand_f.x.log
if($? > 0) then
echo t0-even-stride1-2_2-1024_1024_1024_1024_2_1-test_rand_f.x ERROR
else
echo t0-even-stride1-2_2-1024_1024_1024_1024_2_1-test_rand_f.x OK
endif
echo 1 4 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t0-even-stride1-1_4-1024_1024_1024_1024_2_1-test_rand_f.x.log
aprun -n 4 test_rand_f.x > /lustre/scratch/djchen/logs/t0-even-stride1-1_4-1024_1024_1024_1024_2_1-test_rand_f.x.log
if($? > 0) then
echo t0-even-stride1-1_4-1024_1024_1024_1024_2_1-test_rand_f.x ERROR
else
echo t0-even-stride1-1_4-1024_1024_1024_1024_2_1-test_rand_f.x OK
endif
echo 4 1 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t0-even-stride1-4_1-1024_1024_1024_1024_2_1-test_rand_f.x.log
aprun -n 4 test_rand_f.x > /lustre/scratch/djchen/logs/t0-even-stride1-4_1-1024_1024_1024_1024_2_1-test_rand_f.x.log
if($? > 0) then
echo t0-even-stride1-4_1-1024_1024_1024_1024_2_1-test_rand_f.x ERROR
else
echo t0-even-stride1-4_1-1024_1024_1024_1024_2_1-test_rand_f.x OK
endif
echo 1 1 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t0-even-stride1-1_1-1024_1024_1024_1024_2_1-test_rand_f.x.log
aprun -n 1 test_rand_f.x > /lustre/scratch/djchen/logs/t0-even-stride1-1_1-1024_1024_1024_1024_2_1-test_rand_f.x.log
if($? > 0) then
echo t0-even-stride1-1_1-1024_1024_1024_1024_2_1-test_rand_f.x ERROR
else
echo t0-even-stride1-1_1-1024_1024_1024_1024_2_1-test_rand_f.x OK
endif
echo 3 2 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t0-even-stride1-3_2-1024_1024_1024_1024_2_1-test_sine_c.x.log
aprun -n 6 test_sine_c.x > /lustre/scratch/djchen/logs/t0-even-stride1-3_2-1024_1024_1024_1024_2_1-test_sine_c.x.log
if($? > 0) then
echo t0-even-stride1-3_2-1024_1024_1024_1024_2_1-test_sine_c.x ERROR
else
echo t0-even-stride1-3_2-1024_1024_1024_1024_2_1-test_sine_c.x OK
endif
echo 2 3 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t0-even-stride1-2_3-1024_1024_1024_1024_2_1-test_sine_c.x.log
aprun -n 6 test_sine_c.x > /lustre/scratch/djchen/logs/t0-even-stride1-2_3-1024_1024_1024_1024_2_1-test_sine_c.x.log
if($? > 0) then
echo t0-even-stride1-2_3-1024_1024_1024_1024_2_1-test_sine_c.x ERROR
else
echo t0-even-stride1-2_3-1024_1024_1024_1024_2_1-test_sine_c.x OK
endif
echo 2 2 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t0-even-stride1-2_2-1024_1024_1024_1024_2_1-test_sine_c.x.log
aprun -n 4 test_sine_c.x > /lustre/scratch/djchen/logs/t0-even-stride1-2_2-1024_1024_1024_1024_2_1-test_sine_c.x.log
if($? > 0) then
echo t0-even-stride1-2_2-1024_1024_1024_1024_2_1-test_sine_c.x ERROR
else
echo t0-even-stride1-2_2-1024_1024_1024_1024_2_1-test_sine_c.x OK
endif
echo 1 4 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t0-even-stride1-1_4-1024_1024_1024_1024_2_1-test_sine_c.x.log
aprun -n 4 test_sine_c.x > /lustre/scratch/djchen/logs/t0-even-stride1-1_4-1024_1024_1024_1024_2_1-test_sine_c.x.log
if($? > 0) then
echo t0-even-stride1-1_4-1024_1024_1024_1024_2_1-test_sine_c.x ERROR
else
echo t0-even-stride1-1_4-1024_1024_1024_1024_2_1-test_sine_c.x OK
endif
echo 4 1 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t0-even-stride1-4_1-1024_1024_1024_1024_2_1-test_sine_c.x.log
aprun -n 4 test_sine_c.x > /lustre/scratch/djchen/logs/t0-even-stride1-4_1-1024_1024_1024_1024_2_1-test_sine_c.x.log
if($? > 0) then
echo t0-even-stride1-4_1-1024_1024_1024_1024_2_1-test_sine_c.x ERROR
else
echo t0-even-stride1-4_1-1024_1024_1024_1024_2_1-test_sine_c.x OK
endif
echo 1 1 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t0-even-stride1-1_1-1024_1024_1024_1024_2_1-test_sine_c.x.log
aprun -n 1 test_sine_c.x > /lustre/scratch/djchen/logs/t0-even-stride1-1_1-1024_1024_1024_1024_2_1-test_sine_c.x.log
if($? > 0) then
echo t0-even-stride1-1_1-1024_1024_1024_1024_2_1-test_sine_c.x ERROR
else
echo t0-even-stride1-1_1-1024_1024_1024_1024_2_1-test_sine_c.x OK
endif
echo 3 2 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t0-even-stride1-3_2-1024_1024_1024_1024_2_1-test_sine_f.x.log
aprun -n 6 test_sine_f.x > /lustre/scratch/djchen/logs/t0-even-stride1-3_2-1024_1024_1024_1024_2_1-test_sine_f.x.log
if($? > 0) then
echo t0-even-stride1-3_2-1024_1024_1024_1024_2_1-test_sine_f.x ERROR
else
echo t0-even-stride1-3_2-1024_1024_1024_1024_2_1-test_sine_f.x OK
endif
echo 2 3 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t0-even-stride1-2_3-1024_1024_1024_1024_2_1-test_sine_f.x.log
aprun -n 6 test_sine_f.x > /lustre/scratch/djchen/logs/t0-even-stride1-2_3-1024_1024_1024_1024_2_1-test_sine_f.x.log
if($? > 0) then
echo t0-even-stride1-2_3-1024_1024_1024_1024_2_1-test_sine_f.x ERROR
else
echo t0-even-stride1-2_3-1024_1024_1024_1024_2_1-test_sine_f.x OK
endif
echo 2 2 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t0-even-stride1-2_2-1024_1024_1024_1024_2_1-test_sine_f.x.log
aprun -n 4 test_sine_f.x > /lustre/scratch/djchen/logs/t0-even-stride1-2_2-1024_1024_1024_1024_2_1-test_sine_f.x.log
if($? > 0) then
echo t0-even-stride1-2_2-1024_1024_1024_1024_2_1-test_sine_f.x ERROR
else
echo t0-even-stride1-2_2-1024_1024_1024_1024_2_1-test_sine_f.x OK
endif
echo 1 4 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t0-even-stride1-1_4-1024_1024_1024_1024_2_1-test_sine_f.x.log
aprun -n 4 test_sine_f.x > /lustre/scratch/djchen/logs/t0-even-stride1-1_4-1024_1024_1024_1024_2_1-test_sine_f.x.log
if($? > 0) then
echo t0-even-stride1-1_4-1024_1024_1024_1024_2_1-test_sine_f.x ERROR
else
echo t0-even-stride1-1_4-1024_1024_1024_1024_2_1-test_sine_f.x OK
endif
echo 4 1 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t0-even-stride1-4_1-1024_1024_1024_1024_2_1-test_sine_f.x.log
aprun -n 4 test_sine_f.x > /lustre/scratch/djchen/logs/t0-even-stride1-4_1-1024_1024_1024_1024_2_1-test_sine_f.x.log
if($? > 0) then
echo t0-even-stride1-4_1-1024_1024_1024_1024_2_1-test_sine_f.x ERROR
else
echo t0-even-stride1-4_1-1024_1024_1024_1024_2_1-test_sine_f.x OK
endif
echo 1 1 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t0-even-stride1-1_1-1024_1024_1024_1024_2_1-test_sine_f.x.log
aprun -n 1 test_sine_f.x > /lustre/scratch/djchen/logs/t0-even-stride1-1_1-1024_1024_1024_1024_2_1-test_sine_f.x.log
if($? > 0) then
echo t0-even-stride1-1_1-1024_1024_1024_1024_2_1-test_sine_f.x ERROR
else
echo t0-even-stride1-1_1-1024_1024_1024_1024_2_1-test_sine_f.x OK
endif
echo 3 2 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t0-even-stride1-3_2-1024_1024_1024_1024_2_1-test_sine_inplace_c.x.log
aprun -n 6 test_sine_inplace_c.x > /lustre/scratch/djchen/logs/t0-even-stride1-3_2-1024_1024_1024_1024_2_1-test_sine_inplace_c.x.log
if($? > 0) then
echo t0-even-stride1-3_2-1024_1024_1024_1024_2_1-test_sine_inplace_c.x ERROR
else
echo t0-even-stride1-3_2-1024_1024_1024_1024_2_1-test_sine_inplace_c.x OK
endif
echo 2 3 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t0-even-stride1-2_3-1024_1024_1024_1024_2_1-test_sine_inplace_c.x.log
aprun -n 6 test_sine_inplace_c.x > /lustre/scratch/djchen/logs/t0-even-stride1-2_3-1024_1024_1024_1024_2_1-test_sine_inplace_c.x.log
if($? > 0) then
echo t0-even-stride1-2_3-1024_1024_1024_1024_2_1-test_sine_inplace_c.x ERROR
else
echo t0-even-stride1-2_3-1024_1024_1024_1024_2_1-test_sine_inplace_c.x OK
endif
echo 2 2 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t0-even-stride1-2_2-1024_1024_1024_1024_2_1-test_sine_inplace_c.x.log
aprun -n 4 test_sine_inplace_c.x > /lustre/scratch/djchen/logs/t0-even-stride1-2_2-1024_1024_1024_1024_2_1-test_sine_inplace_c.x.log
if($? > 0) then
echo t0-even-stride1-2_2-1024_1024_1024_1024_2_1-test_sine_inplace_c.x ERROR
else
echo t0-even-stride1-2_2-1024_1024_1024_1024_2_1-test_sine_inplace_c.x OK
endif
echo 1 4 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t0-even-stride1-1_4-1024_1024_1024_1024_2_1-test_sine_inplace_c.x.log
aprun -n 4 test_sine_inplace_c.x > /lustre/scratch/djchen/logs/t0-even-stride1-1_4-1024_1024_1024_1024_2_1-test_sine_inplace_c.x.log
if($? > 0) then
echo t0-even-stride1-1_4-1024_1024_1024_1024_2_1-test_sine_inplace_c.x ERROR
else
echo t0-even-stride1-1_4-1024_1024_1024_1024_2_1-test_sine_inplace_c.x OK
endif
echo 4 1 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t0-even-stride1-4_1-1024_1024_1024_1024_2_1-test_sine_inplace_c.x.log
aprun -n 4 test_sine_inplace_c.x > /lustre/scratch/djchen/logs/t0-even-stride1-4_1-1024_1024_1024_1024_2_1-test_sine_inplace_c.x.log
if($? > 0) then
echo t0-even-stride1-4_1-1024_1024_1024_1024_2_1-test_sine_inplace_c.x ERROR
else
echo t0-even-stride1-4_1-1024_1024_1024_1024_2_1-test_sine_inplace_c.x OK
endif
echo 1 1 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t0-even-stride1-1_1-1024_1024_1024_1024_2_1-test_sine_inplace_c.x.log
aprun -n 1 test_sine_inplace_c.x > /lustre/scratch/djchen/logs/t0-even-stride1-1_1-1024_1024_1024_1024_2_1-test_sine_inplace_c.x.log
if($? > 0) then
echo t0-even-stride1-1_1-1024_1024_1024_1024_2_1-test_sine_inplace_c.x ERROR
else
echo t0-even-stride1-1_1-1024_1024_1024_1024_2_1-test_sine_inplace_c.x OK
endif
echo 3 2 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t0-even-stride1-3_2-1024_1024_1024_1024_2_1-test_sine_inplace_f.x.log
aprun -n 6 test_sine_inplace_f.x > /lustre/scratch/djchen/logs/t0-even-stride1-3_2-1024_1024_1024_1024_2_1-test_sine_inplace_f.x.log
if($? > 0) then
echo t0-even-stride1-3_2-1024_1024_1024_1024_2_1-test_sine_inplace_f.x ERROR
else
echo t0-even-stride1-3_2-1024_1024_1024_1024_2_1-test_sine_inplace_f.x OK
endif
echo 2 3 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t0-even-stride1-2_3-1024_1024_1024_1024_2_1-test_sine_inplace_f.x.log
aprun -n 6 test_sine_inplace_f.x > /lustre/scratch/djchen/logs/t0-even-stride1-2_3-1024_1024_1024_1024_2_1-test_sine_inplace_f.x.log
if($? > 0) then
echo t0-even-stride1-2_3-1024_1024_1024_1024_2_1-test_sine_inplace_f.x ERROR
else
echo t0-even-stride1-2_3-1024_1024_1024_1024_2_1-test_sine_inplace_f.x OK
endif
echo 2 2 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t0-even-stride1-2_2-1024_1024_1024_1024_2_1-test_sine_inplace_f.x.log
aprun -n 4 test_sine_inplace_f.x > /lustre/scratch/djchen/logs/t0-even-stride1-2_2-1024_1024_1024_1024_2_1-test_sine_inplace_f.x.log
if($? > 0) then
echo t0-even-stride1-2_2-1024_1024_1024_1024_2_1-test_sine_inplace_f.x ERROR
else
echo t0-even-stride1-2_2-1024_1024_1024_1024_2_1-test_sine_inplace_f.x OK
endif
echo 1 4 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t0-even-stride1-1_4-1024_1024_1024_1024_2_1-test_sine_inplace_f.x.log
aprun -n 4 test_sine_inplace_f.x > /lustre/scratch/djchen/logs/t0-even-stride1-1_4-1024_1024_1024_1024_2_1-test_sine_inplace_f.x.log
if($? > 0) then
echo t0-even-stride1-1_4-1024_1024_1024_1024_2_1-test_sine_inplace_f.x ERROR
else
echo t0-even-stride1-1_4-1024_1024_1024_1024_2_1-test_sine_inplace_f.x OK
endif
echo 4 1 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t0-even-stride1-4_1-1024_1024_1024_1024_2_1-test_sine_inplace_f.x.log
aprun -n 4 test_sine_inplace_f.x > /lustre/scratch/djchen/logs/t0-even-stride1-4_1-1024_1024_1024_1024_2_1-test_sine_inplace_f.x.log
if($? > 0) then
echo t0-even-stride1-4_1-1024_1024_1024_1024_2_1-test_sine_inplace_f.x ERROR
else
echo t0-even-stride1-4_1-1024_1024_1024_1024_2_1-test_sine_inplace_f.x OK
endif
echo 1 1 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t0-even-stride1-1_1-1024_1024_1024_1024_2_1-test_sine_inplace_f.x.log
aprun -n 1 test_sine_inplace_f.x > /lustre/scratch/djchen/logs/t0-even-stride1-1_1-1024_1024_1024_1024_2_1-test_sine_inplace_f.x.log
if($? > 0) then
echo t0-even-stride1-1_1-1024_1024_1024_1024_2_1-test_sine_inplace_f.x ERROR
else
echo t0-even-stride1-1_1-1024_1024_1024_1024_2_1-test_sine_inplace_f.x OK
endif
echo 3 2 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t0-even-stride1-3_2-1024_1024_1024_1024_2_1-test_spec_c.x.log
aprun -n 6 test_spec_c.x > /lustre/scratch/djchen/logs/t0-even-stride1-3_2-1024_1024_1024_1024_2_1-test_spec_c.x.log
if($? > 0) then
echo t0-even-stride1-3_2-1024_1024_1024_1024_2_1-test_spec_c.x ERROR
else
echo t0-even-stride1-3_2-1024_1024_1024_1024_2_1-test_spec_c.x OK
endif
echo 2 3 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t0-even-stride1-2_3-1024_1024_1024_1024_2_1-test_spec_c.x.log
aprun -n 6 test_spec_c.x > /lustre/scratch/djchen/logs/t0-even-stride1-2_3-1024_1024_1024_1024_2_1-test_spec_c.x.log
if($? > 0) then
echo t0-even-stride1-2_3-1024_1024_1024_1024_2_1-test_spec_c.x ERROR
else
echo t0-even-stride1-2_3-1024_1024_1024_1024_2_1-test_spec_c.x OK
endif
echo 2 2 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t0-even-stride1-2_2-1024_1024_1024_1024_2_1-test_spec_c.x.log
aprun -n 4 test_spec_c.x > /lustre/scratch/djchen/logs/t0-even-stride1-2_2-1024_1024_1024_1024_2_1-test_spec_c.x.log
if($? > 0) then
echo t0-even-stride1-2_2-1024_1024_1024_1024_2_1-test_spec_c.x ERROR
else
echo t0-even-stride1-2_2-1024_1024_1024_1024_2_1-test_spec_c.x OK
endif
echo 1 4 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t0-even-stride1-1_4-1024_1024_1024_1024_2_1-test_spec_c.x.log
aprun -n 4 test_spec_c.x > /lustre/scratch/djchen/logs/t0-even-stride1-1_4-1024_1024_1024_1024_2_1-test_spec_c.x.log
if($? > 0) then
echo t0-even-stride1-1_4-1024_1024_1024_1024_2_1-test_spec_c.x ERROR
else
echo t0-even-stride1-1_4-1024_1024_1024_1024_2_1-test_spec_c.x OK
endif
echo 4 1 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t0-even-stride1-4_1-1024_1024_1024_1024_2_1-test_spec_c.x.log
aprun -n 4 test_spec_c.x > /lustre/scratch/djchen/logs/t0-even-stride1-4_1-1024_1024_1024_1024_2_1-test_spec_c.x.log
if($? > 0) then
echo t0-even-stride1-4_1-1024_1024_1024_1024_2_1-test_spec_c.x ERROR
else
echo t0-even-stride1-4_1-1024_1024_1024_1024_2_1-test_spec_c.x OK
endif
echo 1 1 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t0-even-stride1-1_1-1024_1024_1024_1024_2_1-test_spec_c.x.log
aprun -n 1 test_spec_c.x > /lustre/scratch/djchen/logs/t0-even-stride1-1_1-1024_1024_1024_1024_2_1-test_spec_c.x.log
if($? > 0) then
echo t0-even-stride1-1_1-1024_1024_1024_1024_2_1-test_spec_c.x ERROR
else
echo t0-even-stride1-1_1-1024_1024_1024_1024_2_1-test_spec_c.x OK
endif
echo 3 2 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t0-even-stride1-3_2-1024_1024_1024_1024_2_1-test_spec_f.x.log
aprun -n 6 test_spec_f.x > /lustre/scratch/djchen/logs/t0-even-stride1-3_2-1024_1024_1024_1024_2_1-test_spec_f.x.log
if($? > 0) then
echo t0-even-stride1-3_2-1024_1024_1024_1024_2_1-test_spec_f.x ERROR
else
echo t0-even-stride1-3_2-1024_1024_1024_1024_2_1-test_spec_f.x OK
endif
echo 2 3 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t0-even-stride1-2_3-1024_1024_1024_1024_2_1-test_spec_f.x.log
aprun -n 6 test_spec_f.x > /lustre/scratch/djchen/logs/t0-even-stride1-2_3-1024_1024_1024_1024_2_1-test_spec_f.x.log
if($? > 0) then
echo t0-even-stride1-2_3-1024_1024_1024_1024_2_1-test_spec_f.x ERROR
else
echo t0-even-stride1-2_3-1024_1024_1024_1024_2_1-test_spec_f.x OK
endif
echo 2 2 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t0-even-stride1-2_2-1024_1024_1024_1024_2_1-test_spec_f.x.log
aprun -n 4 test_spec_f.x > /lustre/scratch/djchen/logs/t0-even-stride1-2_2-1024_1024_1024_1024_2_1-test_spec_f.x.log
if($? > 0) then
echo t0-even-stride1-2_2-1024_1024_1024_1024_2_1-test_spec_f.x ERROR
else
echo t0-even-stride1-2_2-1024_1024_1024_1024_2_1-test_spec_f.x OK
endif
echo 1 4 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t0-even-stride1-1_4-1024_1024_1024_1024_2_1-test_spec_f.x.log
aprun -n 4 test_spec_f.x > /lustre/scratch/djchen/logs/t0-even-stride1-1_4-1024_1024_1024_1024_2_1-test_spec_f.x.log
if($? > 0) then
echo t0-even-stride1-1_4-1024_1024_1024_1024_2_1-test_spec_f.x ERROR
else
echo t0-even-stride1-1_4-1024_1024_1024_1024_2_1-test_spec_f.x OK
endif
echo 4 1 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t0-even-stride1-4_1-1024_1024_1024_1024_2_1-test_spec_f.x.log
aprun -n 4 test_spec_f.x > /lustre/scratch/djchen/logs/t0-even-stride1-4_1-1024_1024_1024_1024_2_1-test_spec_f.x.log
if($? > 0) then
echo t0-even-stride1-4_1-1024_1024_1024_1024_2_1-test_spec_f.x ERROR
else
echo t0-even-stride1-4_1-1024_1024_1024_1024_2_1-test_spec_f.x OK
endif
echo 1 1 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t0-even-stride1-1_1-1024_1024_1024_1024_2_1-test_spec_f.x.log
aprun -n 1 test_spec_f.x > /lustre/scratch/djchen/logs/t0-even-stride1-1_1-1024_1024_1024_1024_2_1-test_spec_f.x.log
if($? > 0) then
echo t0-even-stride1-1_1-1024_1024_1024_1024_2_1-test_spec_f.x ERROR
else
echo t0-even-stride1-1_1-1024_1024_1024_1024_2_1-test_spec_f.x OK
endif
cd /lustre/scratch/djchen/p3dfft-test/test1-default/sample
echo 3 2 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t1-default-3_2-1024_1024_1024_1024_2_1-test_inverse_c.x.log
aprun -n 6 test_inverse_c.x > /lustre/scratch/djchen/logs/t1-default-3_2-1024_1024_1024_1024_2_1-test_inverse_c.x.log
if($? > 0) then
echo t1-default-3_2-1024_1024_1024_1024_2_1-test_inverse_c.x ERROR
else
echo t1-default-3_2-1024_1024_1024_1024_2_1-test_inverse_c.x OK
endif
echo 2 3 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t1-default-2_3-1024_1024_1024_1024_2_1-test_inverse_c.x.log
aprun -n 6 test_inverse_c.x > /lustre/scratch/djchen/logs/t1-default-2_3-1024_1024_1024_1024_2_1-test_inverse_c.x.log
if($? > 0) then
echo t1-default-2_3-1024_1024_1024_1024_2_1-test_inverse_c.x ERROR
else
echo t1-default-2_3-1024_1024_1024_1024_2_1-test_inverse_c.x OK
endif
echo 2 2 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t1-default-2_2-1024_1024_1024_1024_2_1-test_inverse_c.x.log
aprun -n 4 test_inverse_c.x > /lustre/scratch/djchen/logs/t1-default-2_2-1024_1024_1024_1024_2_1-test_inverse_c.x.log
if($? > 0) then
echo t1-default-2_2-1024_1024_1024_1024_2_1-test_inverse_c.x ERROR
else
echo t1-default-2_2-1024_1024_1024_1024_2_1-test_inverse_c.x OK
endif
echo 1 4 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t1-default-1_4-1024_1024_1024_1024_2_1-test_inverse_c.x.log
aprun -n 4 test_inverse_c.x > /lustre/scratch/djchen/logs/t1-default-1_4-1024_1024_1024_1024_2_1-test_inverse_c.x.log
if($? > 0) then
echo t1-default-1_4-1024_1024_1024_1024_2_1-test_inverse_c.x ERROR
else
echo t1-default-1_4-1024_1024_1024_1024_2_1-test_inverse_c.x OK
endif
echo 4 1 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t1-default-4_1-1024_1024_1024_1024_2_1-test_inverse_c.x.log
aprun -n 4 test_inverse_c.x > /lustre/scratch/djchen/logs/t1-default-4_1-1024_1024_1024_1024_2_1-test_inverse_c.x.log
if($? > 0) then
echo t1-default-4_1-1024_1024_1024_1024_2_1-test_inverse_c.x ERROR
else
echo t1-default-4_1-1024_1024_1024_1024_2_1-test_inverse_c.x OK
endif
echo 1 1 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t1-default-1_1-1024_1024_1024_1024_2_1-test_inverse_c.x.log
aprun -n 1 test_inverse_c.x > /lustre/scratch/djchen/logs/t1-default-1_1-1024_1024_1024_1024_2_1-test_inverse_c.x.log
if($? > 0) then
echo t1-default-1_1-1024_1024_1024_1024_2_1-test_inverse_c.x ERROR
else
echo t1-default-1_1-1024_1024_1024_1024_2_1-test_inverse_c.x OK
endif
echo 3 2 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t1-default-3_2-1024_1024_1024_1024_2_1-test_inverse_f.x.log
aprun -n 6 test_inverse_f.x > /lustre/scratch/djchen/logs/t1-default-3_2-1024_1024_1024_1024_2_1-test_inverse_f.x.log
if($? > 0) then
echo t1-default-3_2-1024_1024_1024_1024_2_1-test_inverse_f.x ERROR
else
echo t1-default-3_2-1024_1024_1024_1024_2_1-test_inverse_f.x OK
endif
echo 2 3 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t1-default-2_3-1024_1024_1024_1024_2_1-test_inverse_f.x.log
aprun -n 6 test_inverse_f.x > /lustre/scratch/djchen/logs/t1-default-2_3-1024_1024_1024_1024_2_1-test_inverse_f.x.log
if($? > 0) then
echo t1-default-2_3-1024_1024_1024_1024_2_1-test_inverse_f.x ERROR
else
echo t1-default-2_3-1024_1024_1024_1024_2_1-test_inverse_f.x OK
endif
echo 2 2 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t1-default-2_2-1024_1024_1024_1024_2_1-test_inverse_f.x.log
aprun -n 4 test_inverse_f.x > /lustre/scratch/djchen/logs/t1-default-2_2-1024_1024_1024_1024_2_1-test_inverse_f.x.log
if($? > 0) then
echo t1-default-2_2-1024_1024_1024_1024_2_1-test_inverse_f.x ERROR
else
echo t1-default-2_2-1024_1024_1024_1024_2_1-test_inverse_f.x OK
endif
echo 1 4 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t1-default-1_4-1024_1024_1024_1024_2_1-test_inverse_f.x.log
aprun -n 4 test_inverse_f.x > /lustre/scratch/djchen/logs/t1-default-1_4-1024_1024_1024_1024_2_1-test_inverse_f.x.log
if($? > 0) then
echo t1-default-1_4-1024_1024_1024_1024_2_1-test_inverse_f.x ERROR
else
echo t1-default-1_4-1024_1024_1024_1024_2_1-test_inverse_f.x OK
endif
echo 4 1 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t1-default-4_1-1024_1024_1024_1024_2_1-test_inverse_f.x.log
aprun -n 4 test_inverse_f.x > /lustre/scratch/djchen/logs/t1-default-4_1-1024_1024_1024_1024_2_1-test_inverse_f.x.log
if($? > 0) then
echo t1-default-4_1-1024_1024_1024_1024_2_1-test_inverse_f.x ERROR
else
echo t1-default-4_1-1024_1024_1024_1024_2_1-test_inverse_f.x OK
endif
echo 1 1 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t1-default-1_1-1024_1024_1024_1024_2_1-test_inverse_f.x.log
aprun -n 1 test_inverse_f.x > /lustre/scratch/djchen/logs/t1-default-1_1-1024_1024_1024_1024_2_1-test_inverse_f.x.log
if($? > 0) then
echo t1-default-1_1-1024_1024_1024_1024_2_1-test_inverse_f.x ERROR
else
echo t1-default-1_1-1024_1024_1024_1024_2_1-test_inverse_f.x OK
endif
echo 3 2 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t1-default-3_2-1024_1024_1024_1024_2_1-test_rand_c.x.log
aprun -n 6 test_rand_c.x > /lustre/scratch/djchen/logs/t1-default-3_2-1024_1024_1024_1024_2_1-test_rand_c.x.log
if($? > 0) then
echo t1-default-3_2-1024_1024_1024_1024_2_1-test_rand_c.x ERROR
else
echo t1-default-3_2-1024_1024_1024_1024_2_1-test_rand_c.x OK
endif
echo 2 3 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t1-default-2_3-1024_1024_1024_1024_2_1-test_rand_c.x.log
aprun -n 6 test_rand_c.x > /lustre/scratch/djchen/logs/t1-default-2_3-1024_1024_1024_1024_2_1-test_rand_c.x.log
if($? > 0) then
echo t1-default-2_3-1024_1024_1024_1024_2_1-test_rand_c.x ERROR
else
echo t1-default-2_3-1024_1024_1024_1024_2_1-test_rand_c.x OK
endif
echo 2 2 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t1-default-2_2-1024_1024_1024_1024_2_1-test_rand_c.x.log
aprun -n 4 test_rand_c.x > /lustre/scratch/djchen/logs/t1-default-2_2-1024_1024_1024_1024_2_1-test_rand_c.x.log
if($? > 0) then
echo t1-default-2_2-1024_1024_1024_1024_2_1-test_rand_c.x ERROR
else
echo t1-default-2_2-1024_1024_1024_1024_2_1-test_rand_c.x OK
endif
echo 1 4 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t1-default-1_4-1024_1024_1024_1024_2_1-test_rand_c.x.log
aprun -n 4 test_rand_c.x > /lustre/scratch/djchen/logs/t1-default-1_4-1024_1024_1024_1024_2_1-test_rand_c.x.log
if($? > 0) then
echo t1-default-1_4-1024_1024_1024_1024_2_1-test_rand_c.x ERROR
else
echo t1-default-1_4-1024_1024_1024_1024_2_1-test_rand_c.x OK
endif
echo 4 1 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t1-default-4_1-1024_1024_1024_1024_2_1-test_rand_c.x.log
aprun -n 4 test_rand_c.x > /lustre/scratch/djchen/logs/t1-default-4_1-1024_1024_1024_1024_2_1-test_rand_c.x.log
if($? > 0) then
echo t1-default-4_1-1024_1024_1024_1024_2_1-test_rand_c.x ERROR
else
echo t1-default-4_1-1024_1024_1024_1024_2_1-test_rand_c.x OK
endif
echo 1 1 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t1-default-1_1-1024_1024_1024_1024_2_1-test_rand_c.x.log
aprun -n 1 test_rand_c.x > /lustre/scratch/djchen/logs/t1-default-1_1-1024_1024_1024_1024_2_1-test_rand_c.x.log
if($? > 0) then
echo t1-default-1_1-1024_1024_1024_1024_2_1-test_rand_c.x ERROR
else
echo t1-default-1_1-1024_1024_1024_1024_2_1-test_rand_c.x OK
endif
echo 3 2 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t1-default-3_2-1024_1024_1024_1024_2_1-test_rand_f.x.log
aprun -n 6 test_rand_f.x > /lustre/scratch/djchen/logs/t1-default-3_2-1024_1024_1024_1024_2_1-test_rand_f.x.log
if($? > 0) then
echo t1-default-3_2-1024_1024_1024_1024_2_1-test_rand_f.x ERROR
else
echo t1-default-3_2-1024_1024_1024_1024_2_1-test_rand_f.x OK
endif
echo 2 3 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t1-default-2_3-1024_1024_1024_1024_2_1-test_rand_f.x.log
aprun -n 6 test_rand_f.x > /lustre/scratch/djchen/logs/t1-default-2_3-1024_1024_1024_1024_2_1-test_rand_f.x.log
if($? > 0) then
echo t1-default-2_3-1024_1024_1024_1024_2_1-test_rand_f.x ERROR
else
echo t1-default-2_3-1024_1024_1024_1024_2_1-test_rand_f.x OK
endif
echo 2 2 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t1-default-2_2-1024_1024_1024_1024_2_1-test_rand_f.x.log
aprun -n 4 test_rand_f.x > /lustre/scratch/djchen/logs/t1-default-2_2-1024_1024_1024_1024_2_1-test_rand_f.x.log
if($? > 0) then
echo t1-default-2_2-1024_1024_1024_1024_2_1-test_rand_f.x ERROR
else
echo t1-default-2_2-1024_1024_1024_1024_2_1-test_rand_f.x OK
endif
echo 1 4 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t1-default-1_4-1024_1024_1024_1024_2_1-test_rand_f.x.log
aprun -n 4 test_rand_f.x > /lustre/scratch/djchen/logs/t1-default-1_4-1024_1024_1024_1024_2_1-test_rand_f.x.log
if($? > 0) then
echo t1-default-1_4-1024_1024_1024_1024_2_1-test_rand_f.x ERROR
else
echo t1-default-1_4-1024_1024_1024_1024_2_1-test_rand_f.x OK
endif
echo 4 1 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t1-default-4_1-1024_1024_1024_1024_2_1-test_rand_f.x.log
aprun -n 4 test_rand_f.x > /lustre/scratch/djchen/logs/t1-default-4_1-1024_1024_1024_1024_2_1-test_rand_f.x.log
if($? > 0) then
echo t1-default-4_1-1024_1024_1024_1024_2_1-test_rand_f.x ERROR
else
echo t1-default-4_1-1024_1024_1024_1024_2_1-test_rand_f.x OK
endif
echo 1 1 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t1-default-1_1-1024_1024_1024_1024_2_1-test_rand_f.x.log
aprun -n 1 test_rand_f.x > /lustre/scratch/djchen/logs/t1-default-1_1-1024_1024_1024_1024_2_1-test_rand_f.x.log
if($? > 0) then
echo t1-default-1_1-1024_1024_1024_1024_2_1-test_rand_f.x ERROR
else
echo t1-default-1_1-1024_1024_1024_1024_2_1-test_rand_f.x OK
endif
echo 3 2 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t1-default-3_2-1024_1024_1024_1024_2_1-test_sine_c.x.log
aprun -n 6 test_sine_c.x > /lustre/scratch/djchen/logs/t1-default-3_2-1024_1024_1024_1024_2_1-test_sine_c.x.log
if($? > 0) then
echo t1-default-3_2-1024_1024_1024_1024_2_1-test_sine_c.x ERROR
else
echo t1-default-3_2-1024_1024_1024_1024_2_1-test_sine_c.x OK
endif
echo 2 3 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t1-default-2_3-1024_1024_1024_1024_2_1-test_sine_c.x.log
aprun -n 6 test_sine_c.x > /lustre/scratch/djchen/logs/t1-default-2_3-1024_1024_1024_1024_2_1-test_sine_c.x.log
if($? > 0) then
echo t1-default-2_3-1024_1024_1024_1024_2_1-test_sine_c.x ERROR
else
echo t1-default-2_3-1024_1024_1024_1024_2_1-test_sine_c.x OK
endif
echo 2 2 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t1-default-2_2-1024_1024_1024_1024_2_1-test_sine_c.x.log
aprun -n 4 test_sine_c.x > /lustre/scratch/djchen/logs/t1-default-2_2-1024_1024_1024_1024_2_1-test_sine_c.x.log
if($? > 0) then
echo t1-default-2_2-1024_1024_1024_1024_2_1-test_sine_c.x ERROR
else
echo t1-default-2_2-1024_1024_1024_1024_2_1-test_sine_c.x OK
endif
echo 1 4 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t1-default-1_4-1024_1024_1024_1024_2_1-test_sine_c.x.log
aprun -n 4 test_sine_c.x > /lustre/scratch/djchen/logs/t1-default-1_4-1024_1024_1024_1024_2_1-test_sine_c.x.log
if($? > 0) then
echo t1-default-1_4-1024_1024_1024_1024_2_1-test_sine_c.x ERROR
else
echo t1-default-1_4-1024_1024_1024_1024_2_1-test_sine_c.x OK
endif
echo 4 1 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t1-default-4_1-1024_1024_1024_1024_2_1-test_sine_c.x.log
aprun -n 4 test_sine_c.x > /lustre/scratch/djchen/logs/t1-default-4_1-1024_1024_1024_1024_2_1-test_sine_c.x.log
if($? > 0) then
echo t1-default-4_1-1024_1024_1024_1024_2_1-test_sine_c.x ERROR
else
echo t1-default-4_1-1024_1024_1024_1024_2_1-test_sine_c.x OK
endif
echo 1 1 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t1-default-1_1-1024_1024_1024_1024_2_1-test_sine_c.x.log
aprun -n 1 test_sine_c.x > /lustre/scratch/djchen/logs/t1-default-1_1-1024_1024_1024_1024_2_1-test_sine_c.x.log
if($? > 0) then
echo t1-default-1_1-1024_1024_1024_1024_2_1-test_sine_c.x ERROR
else
echo t1-default-1_1-1024_1024_1024_1024_2_1-test_sine_c.x OK
endif
echo 3 2 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t1-default-3_2-1024_1024_1024_1024_2_1-test_sine_f.x.log
aprun -n 6 test_sine_f.x > /lustre/scratch/djchen/logs/t1-default-3_2-1024_1024_1024_1024_2_1-test_sine_f.x.log
if($? > 0) then
echo t1-default-3_2-1024_1024_1024_1024_2_1-test_sine_f.x ERROR
else
echo t1-default-3_2-1024_1024_1024_1024_2_1-test_sine_f.x OK
endif
echo 2 3 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t1-default-2_3-1024_1024_1024_1024_2_1-test_sine_f.x.log
aprun -n 6 test_sine_f.x > /lustre/scratch/djchen/logs/t1-default-2_3-1024_1024_1024_1024_2_1-test_sine_f.x.log
if($? > 0) then
echo t1-default-2_3-1024_1024_1024_1024_2_1-test_sine_f.x ERROR
else
echo t1-default-2_3-1024_1024_1024_1024_2_1-test_sine_f.x OK
endif
echo 2 2 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t1-default-2_2-1024_1024_1024_1024_2_1-test_sine_f.x.log
aprun -n 4 test_sine_f.x > /lustre/scratch/djchen/logs/t1-default-2_2-1024_1024_1024_1024_2_1-test_sine_f.x.log
if($? > 0) then
echo t1-default-2_2-1024_1024_1024_1024_2_1-test_sine_f.x ERROR
else
echo t1-default-2_2-1024_1024_1024_1024_2_1-test_sine_f.x OK
endif
echo 1 4 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t1-default-1_4-1024_1024_1024_1024_2_1-test_sine_f.x.log
aprun -n 4 test_sine_f.x > /lustre/scratch/djchen/logs/t1-default-1_4-1024_1024_1024_1024_2_1-test_sine_f.x.log
if($? > 0) then
echo t1-default-1_4-1024_1024_1024_1024_2_1-test_sine_f.x ERROR
else
echo t1-default-1_4-1024_1024_1024_1024_2_1-test_sine_f.x OK
endif
echo 4 1 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t1-default-4_1-1024_1024_1024_1024_2_1-test_sine_f.x.log
aprun -n 4 test_sine_f.x > /lustre/scratch/djchen/logs/t1-default-4_1-1024_1024_1024_1024_2_1-test_sine_f.x.log
if($? > 0) then
echo t1-default-4_1-1024_1024_1024_1024_2_1-test_sine_f.x ERROR
else
echo t1-default-4_1-1024_1024_1024_1024_2_1-test_sine_f.x OK
endif
echo 1 1 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t1-default-1_1-1024_1024_1024_1024_2_1-test_sine_f.x.log
aprun -n 1 test_sine_f.x > /lustre/scratch/djchen/logs/t1-default-1_1-1024_1024_1024_1024_2_1-test_sine_f.x.log
if($? > 0) then
echo t1-default-1_1-1024_1024_1024_1024_2_1-test_sine_f.x ERROR
else
echo t1-default-1_1-1024_1024_1024_1024_2_1-test_sine_f.x OK
endif
echo 3 2 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t1-default-3_2-1024_1024_1024_1024_2_1-test_sine_inplace_c.x.log
aprun -n 6 test_sine_inplace_c.x > /lustre/scratch/djchen/logs/t1-default-3_2-1024_1024_1024_1024_2_1-test_sine_inplace_c.x.log
if($? > 0) then
echo t1-default-3_2-1024_1024_1024_1024_2_1-test_sine_inplace_c.x ERROR
else
echo t1-default-3_2-1024_1024_1024_1024_2_1-test_sine_inplace_c.x OK
endif
echo 2 3 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t1-default-2_3-1024_1024_1024_1024_2_1-test_sine_inplace_c.x.log
aprun -n 6 test_sine_inplace_c.x > /lustre/scratch/djchen/logs/t1-default-2_3-1024_1024_1024_1024_2_1-test_sine_inplace_c.x.log
if($? > 0) then
echo t1-default-2_3-1024_1024_1024_1024_2_1-test_sine_inplace_c.x ERROR
else
echo t1-default-2_3-1024_1024_1024_1024_2_1-test_sine_inplace_c.x OK
endif
echo 2 2 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t1-default-2_2-1024_1024_1024_1024_2_1-test_sine_inplace_c.x.log
aprun -n 4 test_sine_inplace_c.x > /lustre/scratch/djchen/logs/t1-default-2_2-1024_1024_1024_1024_2_1-test_sine_inplace_c.x.log
if($? > 0) then
echo t1-default-2_2-1024_1024_1024_1024_2_1-test_sine_inplace_c.x ERROR
else
echo t1-default-2_2-1024_1024_1024_1024_2_1-test_sine_inplace_c.x OK
endif
echo 1 4 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t1-default-1_4-1024_1024_1024_1024_2_1-test_sine_inplace_c.x.log
aprun -n 4 test_sine_inplace_c.x > /lustre/scratch/djchen/logs/t1-default-1_4-1024_1024_1024_1024_2_1-test_sine_inplace_c.x.log
if($? > 0) then
echo t1-default-1_4-1024_1024_1024_1024_2_1-test_sine_inplace_c.x ERROR
else
echo t1-default-1_4-1024_1024_1024_1024_2_1-test_sine_inplace_c.x OK
endif
echo 4 1 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t1-default-4_1-1024_1024_1024_1024_2_1-test_sine_inplace_c.x.log
aprun -n 4 test_sine_inplace_c.x > /lustre/scratch/djchen/logs/t1-default-4_1-1024_1024_1024_1024_2_1-test_sine_inplace_c.x.log
if($? > 0) then
echo t1-default-4_1-1024_1024_1024_1024_2_1-test_sine_inplace_c.x ERROR
else
echo t1-default-4_1-1024_1024_1024_1024_2_1-test_sine_inplace_c.x OK
endif
echo 1 1 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t1-default-1_1-1024_1024_1024_1024_2_1-test_sine_inplace_c.x.log
aprun -n 1 test_sine_inplace_c.x > /lustre/scratch/djchen/logs/t1-default-1_1-1024_1024_1024_1024_2_1-test_sine_inplace_c.x.log
if($? > 0) then
echo t1-default-1_1-1024_1024_1024_1024_2_1-test_sine_inplace_c.x ERROR
else
echo t1-default-1_1-1024_1024_1024_1024_2_1-test_sine_inplace_c.x OK
endif
echo 3 2 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t1-default-3_2-1024_1024_1024_1024_2_1-test_sine_inplace_f.x.log
aprun -n 6 test_sine_inplace_f.x > /lustre/scratch/djchen/logs/t1-default-3_2-1024_1024_1024_1024_2_1-test_sine_inplace_f.x.log
if($? > 0) then
echo t1-default-3_2-1024_1024_1024_1024_2_1-test_sine_inplace_f.x ERROR
else
echo t1-default-3_2-1024_1024_1024_1024_2_1-test_sine_inplace_f.x OK
endif
echo 2 3 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t1-default-2_3-1024_1024_1024_1024_2_1-test_sine_inplace_f.x.log
aprun -n 6 test_sine_inplace_f.x > /lustre/scratch/djchen/logs/t1-default-2_3-1024_1024_1024_1024_2_1-test_sine_inplace_f.x.log
if($? > 0) then
echo t1-default-2_3-1024_1024_1024_1024_2_1-test_sine_inplace_f.x ERROR
else
echo t1-default-2_3-1024_1024_1024_1024_2_1-test_sine_inplace_f.x OK
endif
echo 2 2 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t1-default-2_2-1024_1024_1024_1024_2_1-test_sine_inplace_f.x.log
aprun -n 4 test_sine_inplace_f.x > /lustre/scratch/djchen/logs/t1-default-2_2-1024_1024_1024_1024_2_1-test_sine_inplace_f.x.log
if($? > 0) then
echo t1-default-2_2-1024_1024_1024_1024_2_1-test_sine_inplace_f.x ERROR
else
echo t1-default-2_2-1024_1024_1024_1024_2_1-test_sine_inplace_f.x OK
endif
echo 1 4 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t1-default-1_4-1024_1024_1024_1024_2_1-test_sine_inplace_f.x.log
aprun -n 4 test_sine_inplace_f.x > /lustre/scratch/djchen/logs/t1-default-1_4-1024_1024_1024_1024_2_1-test_sine_inplace_f.x.log
if($? > 0) then
echo t1-default-1_4-1024_1024_1024_1024_2_1-test_sine_inplace_f.x ERROR
else
echo t1-default-1_4-1024_1024_1024_1024_2_1-test_sine_inplace_f.x OK
endif
echo 4 1 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t1-default-4_1-1024_1024_1024_1024_2_1-test_sine_inplace_f.x.log
aprun -n 4 test_sine_inplace_f.x > /lustre/scratch/djchen/logs/t1-default-4_1-1024_1024_1024_1024_2_1-test_sine_inplace_f.x.log
if($? > 0) then
echo t1-default-4_1-1024_1024_1024_1024_2_1-test_sine_inplace_f.x ERROR
else
echo t1-default-4_1-1024_1024_1024_1024_2_1-test_sine_inplace_f.x OK
endif
echo 1 1 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t1-default-1_1-1024_1024_1024_1024_2_1-test_sine_inplace_f.x.log
aprun -n 1 test_sine_inplace_f.x > /lustre/scratch/djchen/logs/t1-default-1_1-1024_1024_1024_1024_2_1-test_sine_inplace_f.x.log
if($? > 0) then
echo t1-default-1_1-1024_1024_1024_1024_2_1-test_sine_inplace_f.x ERROR
else
echo t1-default-1_1-1024_1024_1024_1024_2_1-test_sine_inplace_f.x OK
endif
echo 3 2 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t1-default-3_2-1024_1024_1024_1024_2_1-test_spec_c.x.log
aprun -n 6 test_spec_c.x > /lustre/scratch/djchen/logs/t1-default-3_2-1024_1024_1024_1024_2_1-test_spec_c.x.log
if($? > 0) then
echo t1-default-3_2-1024_1024_1024_1024_2_1-test_spec_c.x ERROR
else
echo t1-default-3_2-1024_1024_1024_1024_2_1-test_spec_c.x OK
endif
echo 2 3 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t1-default-2_3-1024_1024_1024_1024_2_1-test_spec_c.x.log
aprun -n 6 test_spec_c.x > /lustre/scratch/djchen/logs/t1-default-2_3-1024_1024_1024_1024_2_1-test_spec_c.x.log
if($? > 0) then
echo t1-default-2_3-1024_1024_1024_1024_2_1-test_spec_c.x ERROR
else
echo t1-default-2_3-1024_1024_1024_1024_2_1-test_spec_c.x OK
endif
echo 2 2 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t1-default-2_2-1024_1024_1024_1024_2_1-test_spec_c.x.log
aprun -n 4 test_spec_c.x > /lustre/scratch/djchen/logs/t1-default-2_2-1024_1024_1024_1024_2_1-test_spec_c.x.log
if($? > 0) then
echo t1-default-2_2-1024_1024_1024_1024_2_1-test_spec_c.x ERROR
else
echo t1-default-2_2-1024_1024_1024_1024_2_1-test_spec_c.x OK
endif
echo 1 4 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t1-default-1_4-1024_1024_1024_1024_2_1-test_spec_c.x.log
aprun -n 4 test_spec_c.x > /lustre/scratch/djchen/logs/t1-default-1_4-1024_1024_1024_1024_2_1-test_spec_c.x.log
if($? > 0) then
echo t1-default-1_4-1024_1024_1024_1024_2_1-test_spec_c.x ERROR
else
echo t1-default-1_4-1024_1024_1024_1024_2_1-test_spec_c.x OK
endif
echo 4 1 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t1-default-4_1-1024_1024_1024_1024_2_1-test_spec_c.x.log
aprun -n 4 test_spec_c.x > /lustre/scratch/djchen/logs/t1-default-4_1-1024_1024_1024_1024_2_1-test_spec_c.x.log
if($? > 0) then
echo t1-default-4_1-1024_1024_1024_1024_2_1-test_spec_c.x ERROR
else
echo t1-default-4_1-1024_1024_1024_1024_2_1-test_spec_c.x OK
endif
echo 1 1 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t1-default-1_1-1024_1024_1024_1024_2_1-test_spec_c.x.log
aprun -n 1 test_spec_c.x > /lustre/scratch/djchen/logs/t1-default-1_1-1024_1024_1024_1024_2_1-test_spec_c.x.log
if($? > 0) then
echo t1-default-1_1-1024_1024_1024_1024_2_1-test_spec_c.x ERROR
else
echo t1-default-1_1-1024_1024_1024_1024_2_1-test_spec_c.x OK
endif
echo 3 2 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t1-default-3_2-1024_1024_1024_1024_2_1-test_spec_f.x.log
aprun -n 6 test_spec_f.x > /lustre/scratch/djchen/logs/t1-default-3_2-1024_1024_1024_1024_2_1-test_spec_f.x.log
if($? > 0) then
echo t1-default-3_2-1024_1024_1024_1024_2_1-test_spec_f.x ERROR
else
echo t1-default-3_2-1024_1024_1024_1024_2_1-test_spec_f.x OK
endif
echo 2 3 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t1-default-2_3-1024_1024_1024_1024_2_1-test_spec_f.x.log
aprun -n 6 test_spec_f.x > /lustre/scratch/djchen/logs/t1-default-2_3-1024_1024_1024_1024_2_1-test_spec_f.x.log
if($? > 0) then
echo t1-default-2_3-1024_1024_1024_1024_2_1-test_spec_f.x ERROR
else
echo t1-default-2_3-1024_1024_1024_1024_2_1-test_spec_f.x OK
endif
echo 2 2 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t1-default-2_2-1024_1024_1024_1024_2_1-test_spec_f.x.log
aprun -n 4 test_spec_f.x > /lustre/scratch/djchen/logs/t1-default-2_2-1024_1024_1024_1024_2_1-test_spec_f.x.log
if($? > 0) then
echo t1-default-2_2-1024_1024_1024_1024_2_1-test_spec_f.x ERROR
else
echo t1-default-2_2-1024_1024_1024_1024_2_1-test_spec_f.x OK
endif
echo 1 4 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t1-default-1_4-1024_1024_1024_1024_2_1-test_spec_f.x.log
aprun -n 4 test_spec_f.x > /lustre/scratch/djchen/logs/t1-default-1_4-1024_1024_1024_1024_2_1-test_spec_f.x.log
if($? > 0) then
echo t1-default-1_4-1024_1024_1024_1024_2_1-test_spec_f.x ERROR
else
echo t1-default-1_4-1024_1024_1024_1024_2_1-test_spec_f.x OK
endif
echo 4 1 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t1-default-4_1-1024_1024_1024_1024_2_1-test_spec_f.x.log
aprun -n 4 test_spec_f.x > /lustre/scratch/djchen/logs/t1-default-4_1-1024_1024_1024_1024_2_1-test_spec_f.x.log
if($? > 0) then
echo t1-default-4_1-1024_1024_1024_1024_2_1-test_spec_f.x ERROR
else
echo t1-default-4_1-1024_1024_1024_1024_2_1-test_spec_f.x OK
endif
echo 1 1 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t1-default-1_1-1024_1024_1024_1024_2_1-test_spec_f.x.log
aprun -n 1 test_spec_f.x > /lustre/scratch/djchen/logs/t1-default-1_1-1024_1024_1024_1024_2_1-test_spec_f.x.log
if($? > 0) then
echo t1-default-1_1-1024_1024_1024_1024_2_1-test_spec_f.x ERROR
else
echo t1-default-1_1-1024_1024_1024_1024_2_1-test_spec_f.x OK
endif
cd /lustre/scratch/djchen/p3dfft-test/test1-even/sample
echo 3 2 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t1-even-3_2-1024_1024_1024_1024_2_1-test_inverse_c.x.log
aprun -n 6 test_inverse_c.x > /lustre/scratch/djchen/logs/t1-even-3_2-1024_1024_1024_1024_2_1-test_inverse_c.x.log
if($? > 0) then
echo t1-even-3_2-1024_1024_1024_1024_2_1-test_inverse_c.x ERROR
else
echo t1-even-3_2-1024_1024_1024_1024_2_1-test_inverse_c.x OK
endif
echo 2 3 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t1-even-2_3-1024_1024_1024_1024_2_1-test_inverse_c.x.log
aprun -n 6 test_inverse_c.x > /lustre/scratch/djchen/logs/t1-even-2_3-1024_1024_1024_1024_2_1-test_inverse_c.x.log
if($? > 0) then
echo t1-even-2_3-1024_1024_1024_1024_2_1-test_inverse_c.x ERROR
else
echo t1-even-2_3-1024_1024_1024_1024_2_1-test_inverse_c.x OK
endif
echo 2 2 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t1-even-2_2-1024_1024_1024_1024_2_1-test_inverse_c.x.log
aprun -n 4 test_inverse_c.x > /lustre/scratch/djchen/logs/t1-even-2_2-1024_1024_1024_1024_2_1-test_inverse_c.x.log
if($? > 0) then
echo t1-even-2_2-1024_1024_1024_1024_2_1-test_inverse_c.x ERROR
else
echo t1-even-2_2-1024_1024_1024_1024_2_1-test_inverse_c.x OK
endif
echo 1 4 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t1-even-1_4-1024_1024_1024_1024_2_1-test_inverse_c.x.log
aprun -n 4 test_inverse_c.x > /lustre/scratch/djchen/logs/t1-even-1_4-1024_1024_1024_1024_2_1-test_inverse_c.x.log
if($? > 0) then
echo t1-even-1_4-1024_1024_1024_1024_2_1-test_inverse_c.x ERROR
else
echo t1-even-1_4-1024_1024_1024_1024_2_1-test_inverse_c.x OK
endif
echo 4 1 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t1-even-4_1-1024_1024_1024_1024_2_1-test_inverse_c.x.log
aprun -n 4 test_inverse_c.x > /lustre/scratch/djchen/logs/t1-even-4_1-1024_1024_1024_1024_2_1-test_inverse_c.x.log
if($? > 0) then
echo t1-even-4_1-1024_1024_1024_1024_2_1-test_inverse_c.x ERROR
else
echo t1-even-4_1-1024_1024_1024_1024_2_1-test_inverse_c.x OK
endif
echo 1 1 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t1-even-1_1-1024_1024_1024_1024_2_1-test_inverse_c.x.log
aprun -n 1 test_inverse_c.x > /lustre/scratch/djchen/logs/t1-even-1_1-1024_1024_1024_1024_2_1-test_inverse_c.x.log
if($? > 0) then
echo t1-even-1_1-1024_1024_1024_1024_2_1-test_inverse_c.x ERROR
else
echo t1-even-1_1-1024_1024_1024_1024_2_1-test_inverse_c.x OK
endif
echo 3 2 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t1-even-3_2-1024_1024_1024_1024_2_1-test_inverse_f.x.log
aprun -n 6 test_inverse_f.x > /lustre/scratch/djchen/logs/t1-even-3_2-1024_1024_1024_1024_2_1-test_inverse_f.x.log
if($? > 0) then
echo t1-even-3_2-1024_1024_1024_1024_2_1-test_inverse_f.x ERROR
else
echo t1-even-3_2-1024_1024_1024_1024_2_1-test_inverse_f.x OK
endif
echo 2 3 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t1-even-2_3-1024_1024_1024_1024_2_1-test_inverse_f.x.log
aprun -n 6 test_inverse_f.x > /lustre/scratch/djchen/logs/t1-even-2_3-1024_1024_1024_1024_2_1-test_inverse_f.x.log
if($? > 0) then
echo t1-even-2_3-1024_1024_1024_1024_2_1-test_inverse_f.x ERROR
else
echo t1-even-2_3-1024_1024_1024_1024_2_1-test_inverse_f.x OK
endif
echo 2 2 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t1-even-2_2-1024_1024_1024_1024_2_1-test_inverse_f.x.log
aprun -n 4 test_inverse_f.x > /lustre/scratch/djchen/logs/t1-even-2_2-1024_1024_1024_1024_2_1-test_inverse_f.x.log
if($? > 0) then
echo t1-even-2_2-1024_1024_1024_1024_2_1-test_inverse_f.x ERROR
else
echo t1-even-2_2-1024_1024_1024_1024_2_1-test_inverse_f.x OK
endif
echo 1 4 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t1-even-1_4-1024_1024_1024_1024_2_1-test_inverse_f.x.log
aprun -n 4 test_inverse_f.x > /lustre/scratch/djchen/logs/t1-even-1_4-1024_1024_1024_1024_2_1-test_inverse_f.x.log
if($? > 0) then
echo t1-even-1_4-1024_1024_1024_1024_2_1-test_inverse_f.x ERROR
else
echo t1-even-1_4-1024_1024_1024_1024_2_1-test_inverse_f.x OK
endif
echo 4 1 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t1-even-4_1-1024_1024_1024_1024_2_1-test_inverse_f.x.log
aprun -n 4 test_inverse_f.x > /lustre/scratch/djchen/logs/t1-even-4_1-1024_1024_1024_1024_2_1-test_inverse_f.x.log
if($? > 0) then
echo t1-even-4_1-1024_1024_1024_1024_2_1-test_inverse_f.x ERROR
else
echo t1-even-4_1-1024_1024_1024_1024_2_1-test_inverse_f.x OK
endif
echo 1 1 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t1-even-1_1-1024_1024_1024_1024_2_1-test_inverse_f.x.log
aprun -n 1 test_inverse_f.x > /lustre/scratch/djchen/logs/t1-even-1_1-1024_1024_1024_1024_2_1-test_inverse_f.x.log
if($? > 0) then
echo t1-even-1_1-1024_1024_1024_1024_2_1-test_inverse_f.x ERROR
else
echo t1-even-1_1-1024_1024_1024_1024_2_1-test_inverse_f.x OK
endif
echo 3 2 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t1-even-3_2-1024_1024_1024_1024_2_1-test_rand_c.x.log
aprun -n 6 test_rand_c.x > /lustre/scratch/djchen/logs/t1-even-3_2-1024_1024_1024_1024_2_1-test_rand_c.x.log
if($? > 0) then
echo t1-even-3_2-1024_1024_1024_1024_2_1-test_rand_c.x ERROR
else
echo t1-even-3_2-1024_1024_1024_1024_2_1-test_rand_c.x OK
endif
echo 2 3 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t1-even-2_3-1024_1024_1024_1024_2_1-test_rand_c.x.log
aprun -n 6 test_rand_c.x > /lustre/scratch/djchen/logs/t1-even-2_3-1024_1024_1024_1024_2_1-test_rand_c.x.log
if($? > 0) then
echo t1-even-2_3-1024_1024_1024_1024_2_1-test_rand_c.x ERROR
else
echo t1-even-2_3-1024_1024_1024_1024_2_1-test_rand_c.x OK
endif
echo 2 2 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t1-even-2_2-1024_1024_1024_1024_2_1-test_rand_c.x.log
aprun -n 4 test_rand_c.x > /lustre/scratch/djchen/logs/t1-even-2_2-1024_1024_1024_1024_2_1-test_rand_c.x.log
if($? > 0) then
echo t1-even-2_2-1024_1024_1024_1024_2_1-test_rand_c.x ERROR
else
echo t1-even-2_2-1024_1024_1024_1024_2_1-test_rand_c.x OK
endif
echo 1 4 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t1-even-1_4-1024_1024_1024_1024_2_1-test_rand_c.x.log
aprun -n 4 test_rand_c.x > /lustre/scratch/djchen/logs/t1-even-1_4-1024_1024_1024_1024_2_1-test_rand_c.x.log
if($? > 0) then
echo t1-even-1_4-1024_1024_1024_1024_2_1-test_rand_c.x ERROR
else
echo t1-even-1_4-1024_1024_1024_1024_2_1-test_rand_c.x OK
endif
echo 4 1 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t1-even-4_1-1024_1024_1024_1024_2_1-test_rand_c.x.log
aprun -n 4 test_rand_c.x > /lustre/scratch/djchen/logs/t1-even-4_1-1024_1024_1024_1024_2_1-test_rand_c.x.log
if($? > 0) then
echo t1-even-4_1-1024_1024_1024_1024_2_1-test_rand_c.x ERROR
else
echo t1-even-4_1-1024_1024_1024_1024_2_1-test_rand_c.x OK
endif
echo 1 1 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t1-even-1_1-1024_1024_1024_1024_2_1-test_rand_c.x.log
aprun -n 1 test_rand_c.x > /lustre/scratch/djchen/logs/t1-even-1_1-1024_1024_1024_1024_2_1-test_rand_c.x.log
if($? > 0) then
echo t1-even-1_1-1024_1024_1024_1024_2_1-test_rand_c.x ERROR
else
echo t1-even-1_1-1024_1024_1024_1024_2_1-test_rand_c.x OK
endif
echo 3 2 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t1-even-3_2-1024_1024_1024_1024_2_1-test_rand_f.x.log
aprun -n 6 test_rand_f.x > /lustre/scratch/djchen/logs/t1-even-3_2-1024_1024_1024_1024_2_1-test_rand_f.x.log
if($? > 0) then
echo t1-even-3_2-1024_1024_1024_1024_2_1-test_rand_f.x ERROR
else
echo t1-even-3_2-1024_1024_1024_1024_2_1-test_rand_f.x OK
endif
echo 2 3 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t1-even-2_3-1024_1024_1024_1024_2_1-test_rand_f.x.log
aprun -n 6 test_rand_f.x > /lustre/scratch/djchen/logs/t1-even-2_3-1024_1024_1024_1024_2_1-test_rand_f.x.log
if($? > 0) then
echo t1-even-2_3-1024_1024_1024_1024_2_1-test_rand_f.x ERROR
else
echo t1-even-2_3-1024_1024_1024_1024_2_1-test_rand_f.x OK
endif
echo 2 2 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t1-even-2_2-1024_1024_1024_1024_2_1-test_rand_f.x.log
aprun -n 4 test_rand_f.x > /lustre/scratch/djchen/logs/t1-even-2_2-1024_1024_1024_1024_2_1-test_rand_f.x.log
if($? > 0) then
echo t1-even-2_2-1024_1024_1024_1024_2_1-test_rand_f.x ERROR
else
echo t1-even-2_2-1024_1024_1024_1024_2_1-test_rand_f.x OK
endif
echo 1 4 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t1-even-1_4-1024_1024_1024_1024_2_1-test_rand_f.x.log
aprun -n 4 test_rand_f.x > /lustre/scratch/djchen/logs/t1-even-1_4-1024_1024_1024_1024_2_1-test_rand_f.x.log
if($? > 0) then
echo t1-even-1_4-1024_1024_1024_1024_2_1-test_rand_f.x ERROR
else
echo t1-even-1_4-1024_1024_1024_1024_2_1-test_rand_f.x OK
endif
echo 4 1 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t1-even-4_1-1024_1024_1024_1024_2_1-test_rand_f.x.log
aprun -n 4 test_rand_f.x > /lustre/scratch/djchen/logs/t1-even-4_1-1024_1024_1024_1024_2_1-test_rand_f.x.log
if($? > 0) then
echo t1-even-4_1-1024_1024_1024_1024_2_1-test_rand_f.x ERROR
else
echo t1-even-4_1-1024_1024_1024_1024_2_1-test_rand_f.x OK
endif
echo 1 1 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t1-even-1_1-1024_1024_1024_1024_2_1-test_rand_f.x.log
aprun -n 1 test_rand_f.x > /lustre/scratch/djchen/logs/t1-even-1_1-1024_1024_1024_1024_2_1-test_rand_f.x.log
if($? > 0) then
echo t1-even-1_1-1024_1024_1024_1024_2_1-test_rand_f.x ERROR
else
echo t1-even-1_1-1024_1024_1024_1024_2_1-test_rand_f.x OK
endif
echo 3 2 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t1-even-3_2-1024_1024_1024_1024_2_1-test_sine_c.x.log
aprun -n 6 test_sine_c.x > /lustre/scratch/djchen/logs/t1-even-3_2-1024_1024_1024_1024_2_1-test_sine_c.x.log
if($? > 0) then
echo t1-even-3_2-1024_1024_1024_1024_2_1-test_sine_c.x ERROR
else
echo t1-even-3_2-1024_1024_1024_1024_2_1-test_sine_c.x OK
endif
echo 2 3 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t1-even-2_3-1024_1024_1024_1024_2_1-test_sine_c.x.log
aprun -n 6 test_sine_c.x > /lustre/scratch/djchen/logs/t1-even-2_3-1024_1024_1024_1024_2_1-test_sine_c.x.log
if($? > 0) then
echo t1-even-2_3-1024_1024_1024_1024_2_1-test_sine_c.x ERROR
else
echo t1-even-2_3-1024_1024_1024_1024_2_1-test_sine_c.x OK
endif
echo 2 2 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t1-even-2_2-1024_1024_1024_1024_2_1-test_sine_c.x.log
aprun -n 4 test_sine_c.x > /lustre/scratch/djchen/logs/t1-even-2_2-1024_1024_1024_1024_2_1-test_sine_c.x.log
if($? > 0) then
echo t1-even-2_2-1024_1024_1024_1024_2_1-test_sine_c.x ERROR
else
echo t1-even-2_2-1024_1024_1024_1024_2_1-test_sine_c.x OK
endif
echo 1 4 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t1-even-1_4-1024_1024_1024_1024_2_1-test_sine_c.x.log
aprun -n 4 test_sine_c.x > /lustre/scratch/djchen/logs/t1-even-1_4-1024_1024_1024_1024_2_1-test_sine_c.x.log
if($? > 0) then
echo t1-even-1_4-1024_1024_1024_1024_2_1-test_sine_c.x ERROR
else
echo t1-even-1_4-1024_1024_1024_1024_2_1-test_sine_c.x OK
endif
echo 4 1 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t1-even-4_1-1024_1024_1024_1024_2_1-test_sine_c.x.log
aprun -n 4 test_sine_c.x > /lustre/scratch/djchen/logs/t1-even-4_1-1024_1024_1024_1024_2_1-test_sine_c.x.log
if($? > 0) then
echo t1-even-4_1-1024_1024_1024_1024_2_1-test_sine_c.x ERROR
else
echo t1-even-4_1-1024_1024_1024_1024_2_1-test_sine_c.x OK
endif
echo 1 1 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t1-even-1_1-1024_1024_1024_1024_2_1-test_sine_c.x.log
aprun -n 1 test_sine_c.x > /lustre/scratch/djchen/logs/t1-even-1_1-1024_1024_1024_1024_2_1-test_sine_c.x.log
if($? > 0) then
echo t1-even-1_1-1024_1024_1024_1024_2_1-test_sine_c.x ERROR
else
echo t1-even-1_1-1024_1024_1024_1024_2_1-test_sine_c.x OK
endif
echo 3 2 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t1-even-3_2-1024_1024_1024_1024_2_1-test_sine_f.x.log
aprun -n 6 test_sine_f.x > /lustre/scratch/djchen/logs/t1-even-3_2-1024_1024_1024_1024_2_1-test_sine_f.x.log
if($? > 0) then
echo t1-even-3_2-1024_1024_1024_1024_2_1-test_sine_f.x ERROR
else
echo t1-even-3_2-1024_1024_1024_1024_2_1-test_sine_f.x OK
endif
echo 2 3 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t1-even-2_3-1024_1024_1024_1024_2_1-test_sine_f.x.log
aprun -n 6 test_sine_f.x > /lustre/scratch/djchen/logs/t1-even-2_3-1024_1024_1024_1024_2_1-test_sine_f.x.log
if($? > 0) then
echo t1-even-2_3-1024_1024_1024_1024_2_1-test_sine_f.x ERROR
else
echo t1-even-2_3-1024_1024_1024_1024_2_1-test_sine_f.x OK
endif
echo 2 2 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t1-even-2_2-1024_1024_1024_1024_2_1-test_sine_f.x.log
aprun -n 4 test_sine_f.x > /lustre/scratch/djchen/logs/t1-even-2_2-1024_1024_1024_1024_2_1-test_sine_f.x.log
if($? > 0) then
echo t1-even-2_2-1024_1024_1024_1024_2_1-test_sine_f.x ERROR
else
echo t1-even-2_2-1024_1024_1024_1024_2_1-test_sine_f.x OK
endif
echo 1 4 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t1-even-1_4-1024_1024_1024_1024_2_1-test_sine_f.x.log
aprun -n 4 test_sine_f.x > /lustre/scratch/djchen/logs/t1-even-1_4-1024_1024_1024_1024_2_1-test_sine_f.x.log
if($? > 0) then
echo t1-even-1_4-1024_1024_1024_1024_2_1-test_sine_f.x ERROR
else
echo t1-even-1_4-1024_1024_1024_1024_2_1-test_sine_f.x OK
endif
echo 4 1 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t1-even-4_1-1024_1024_1024_1024_2_1-test_sine_f.x.log
aprun -n 4 test_sine_f.x > /lustre/scratch/djchen/logs/t1-even-4_1-1024_1024_1024_1024_2_1-test_sine_f.x.log
if($? > 0) then
echo t1-even-4_1-1024_1024_1024_1024_2_1-test_sine_f.x ERROR
else
echo t1-even-4_1-1024_1024_1024_1024_2_1-test_sine_f.x OK
endif
echo 1 1 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t1-even-1_1-1024_1024_1024_1024_2_1-test_sine_f.x.log
aprun -n 1 test_sine_f.x > /lustre/scratch/djchen/logs/t1-even-1_1-1024_1024_1024_1024_2_1-test_sine_f.x.log
if($? > 0) then
echo t1-even-1_1-1024_1024_1024_1024_2_1-test_sine_f.x ERROR
else
echo t1-even-1_1-1024_1024_1024_1024_2_1-test_sine_f.x OK
endif
echo 3 2 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t1-even-3_2-1024_1024_1024_1024_2_1-test_sine_inplace_c.x.log
aprun -n 6 test_sine_inplace_c.x > /lustre/scratch/djchen/logs/t1-even-3_2-1024_1024_1024_1024_2_1-test_sine_inplace_c.x.log
if($? > 0) then
echo t1-even-3_2-1024_1024_1024_1024_2_1-test_sine_inplace_c.x ERROR
else
echo t1-even-3_2-1024_1024_1024_1024_2_1-test_sine_inplace_c.x OK
endif
echo 2 3 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t1-even-2_3-1024_1024_1024_1024_2_1-test_sine_inplace_c.x.log
aprun -n 6 test_sine_inplace_c.x > /lustre/scratch/djchen/logs/t1-even-2_3-1024_1024_1024_1024_2_1-test_sine_inplace_c.x.log
if($? > 0) then
echo t1-even-2_3-1024_1024_1024_1024_2_1-test_sine_inplace_c.x ERROR
else
echo t1-even-2_3-1024_1024_1024_1024_2_1-test_sine_inplace_c.x OK
endif
echo 2 2 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t1-even-2_2-1024_1024_1024_1024_2_1-test_sine_inplace_c.x.log
aprun -n 4 test_sine_inplace_c.x > /lustre/scratch/djchen/logs/t1-even-2_2-1024_1024_1024_1024_2_1-test_sine_inplace_c.x.log
if($? > 0) then
echo t1-even-2_2-1024_1024_1024_1024_2_1-test_sine_inplace_c.x ERROR
else
echo t1-even-2_2-1024_1024_1024_1024_2_1-test_sine_inplace_c.x OK
endif
echo 1 4 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t1-even-1_4-1024_1024_1024_1024_2_1-test_sine_inplace_c.x.log
aprun -n 4 test_sine_inplace_c.x > /lustre/scratch/djchen/logs/t1-even-1_4-1024_1024_1024_1024_2_1-test_sine_inplace_c.x.log
if($? > 0) then
echo t1-even-1_4-1024_1024_1024_1024_2_1-test_sine_inplace_c.x ERROR
else
echo t1-even-1_4-1024_1024_1024_1024_2_1-test_sine_inplace_c.x OK
endif
echo 4 1 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t1-even-4_1-1024_1024_1024_1024_2_1-test_sine_inplace_c.x.log
aprun -n 4 test_sine_inplace_c.x > /lustre/scratch/djchen/logs/t1-even-4_1-1024_1024_1024_1024_2_1-test_sine_inplace_c.x.log
if($? > 0) then
echo t1-even-4_1-1024_1024_1024_1024_2_1-test_sine_inplace_c.x ERROR
else
echo t1-even-4_1-1024_1024_1024_1024_2_1-test_sine_inplace_c.x OK
endif
echo 1 1 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t1-even-1_1-1024_1024_1024_1024_2_1-test_sine_inplace_c.x.log
aprun -n 1 test_sine_inplace_c.x > /lustre/scratch/djchen/logs/t1-even-1_1-1024_1024_1024_1024_2_1-test_sine_inplace_c.x.log
if($? > 0) then
echo t1-even-1_1-1024_1024_1024_1024_2_1-test_sine_inplace_c.x ERROR
else
echo t1-even-1_1-1024_1024_1024_1024_2_1-test_sine_inplace_c.x OK
endif
echo 3 2 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t1-even-3_2-1024_1024_1024_1024_2_1-test_sine_inplace_f.x.log
aprun -n 6 test_sine_inplace_f.x > /lustre/scratch/djchen/logs/t1-even-3_2-1024_1024_1024_1024_2_1-test_sine_inplace_f.x.log
if($? > 0) then
echo t1-even-3_2-1024_1024_1024_1024_2_1-test_sine_inplace_f.x ERROR
else
echo t1-even-3_2-1024_1024_1024_1024_2_1-test_sine_inplace_f.x OK
endif
echo 2 3 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t1-even-2_3-1024_1024_1024_1024_2_1-test_sine_inplace_f.x.log
aprun -n 6 test_sine_inplace_f.x > /lustre/scratch/djchen/logs/t1-even-2_3-1024_1024_1024_1024_2_1-test_sine_inplace_f.x.log
if($? > 0) then
echo t1-even-2_3-1024_1024_1024_1024_2_1-test_sine_inplace_f.x ERROR
else
echo t1-even-2_3-1024_1024_1024_1024_2_1-test_sine_inplace_f.x OK
endif
echo 2 2 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t1-even-2_2-1024_1024_1024_1024_2_1-test_sine_inplace_f.x.log
aprun -n 4 test_sine_inplace_f.x > /lustre/scratch/djchen/logs/t1-even-2_2-1024_1024_1024_1024_2_1-test_sine_inplace_f.x.log
if($? > 0) then
echo t1-even-2_2-1024_1024_1024_1024_2_1-test_sine_inplace_f.x ERROR
else
echo t1-even-2_2-1024_1024_1024_1024_2_1-test_sine_inplace_f.x OK
endif
echo 1 4 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t1-even-1_4-1024_1024_1024_1024_2_1-test_sine_inplace_f.x.log
aprun -n 4 test_sine_inplace_f.x > /lustre/scratch/djchen/logs/t1-even-1_4-1024_1024_1024_1024_2_1-test_sine_inplace_f.x.log
if($? > 0) then
echo t1-even-1_4-1024_1024_1024_1024_2_1-test_sine_inplace_f.x ERROR
else
echo t1-even-1_4-1024_1024_1024_1024_2_1-test_sine_inplace_f.x OK
endif
echo 4 1 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t1-even-4_1-1024_1024_1024_1024_2_1-test_sine_inplace_f.x.log
aprun -n 4 test_sine_inplace_f.x > /lustre/scratch/djchen/logs/t1-even-4_1-1024_1024_1024_1024_2_1-test_sine_inplace_f.x.log
if($? > 0) then
echo t1-even-4_1-1024_1024_1024_1024_2_1-test_sine_inplace_f.x ERROR
else
echo t1-even-4_1-1024_1024_1024_1024_2_1-test_sine_inplace_f.x OK
endif
echo 1 1 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t1-even-1_1-1024_1024_1024_1024_2_1-test_sine_inplace_f.x.log
aprun -n 1 test_sine_inplace_f.x > /lustre/scratch/djchen/logs/t1-even-1_1-1024_1024_1024_1024_2_1-test_sine_inplace_f.x.log
if($? > 0) then
echo t1-even-1_1-1024_1024_1024_1024_2_1-test_sine_inplace_f.x ERROR
else
echo t1-even-1_1-1024_1024_1024_1024_2_1-test_sine_inplace_f.x OK
endif
echo 3 2 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t1-even-3_2-1024_1024_1024_1024_2_1-test_spec_c.x.log
aprun -n 6 test_spec_c.x > /lustre/scratch/djchen/logs/t1-even-3_2-1024_1024_1024_1024_2_1-test_spec_c.x.log
if($? > 0) then
echo t1-even-3_2-1024_1024_1024_1024_2_1-test_spec_c.x ERROR
else
echo t1-even-3_2-1024_1024_1024_1024_2_1-test_spec_c.x OK
endif
echo 2 3 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t1-even-2_3-1024_1024_1024_1024_2_1-test_spec_c.x.log
aprun -n 6 test_spec_c.x > /lustre/scratch/djchen/logs/t1-even-2_3-1024_1024_1024_1024_2_1-test_spec_c.x.log
if($? > 0) then
echo t1-even-2_3-1024_1024_1024_1024_2_1-test_spec_c.x ERROR
else
echo t1-even-2_3-1024_1024_1024_1024_2_1-test_spec_c.x OK
endif
echo 2 2 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t1-even-2_2-1024_1024_1024_1024_2_1-test_spec_c.x.log
aprun -n 4 test_spec_c.x > /lustre/scratch/djchen/logs/t1-even-2_2-1024_1024_1024_1024_2_1-test_spec_c.x.log
if($? > 0) then
echo t1-even-2_2-1024_1024_1024_1024_2_1-test_spec_c.x ERROR
else
echo t1-even-2_2-1024_1024_1024_1024_2_1-test_spec_c.x OK
endif
echo 1 4 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t1-even-1_4-1024_1024_1024_1024_2_1-test_spec_c.x.log
aprun -n 4 test_spec_c.x > /lustre/scratch/djchen/logs/t1-even-1_4-1024_1024_1024_1024_2_1-test_spec_c.x.log
if($? > 0) then
echo t1-even-1_4-1024_1024_1024_1024_2_1-test_spec_c.x ERROR
else
echo t1-even-1_4-1024_1024_1024_1024_2_1-test_spec_c.x OK
endif
echo 4 1 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t1-even-4_1-1024_1024_1024_1024_2_1-test_spec_c.x.log
aprun -n 4 test_spec_c.x > /lustre/scratch/djchen/logs/t1-even-4_1-1024_1024_1024_1024_2_1-test_spec_c.x.log
if($? > 0) then
echo t1-even-4_1-1024_1024_1024_1024_2_1-test_spec_c.x ERROR
else
echo t1-even-4_1-1024_1024_1024_1024_2_1-test_spec_c.x OK
endif
echo 1 1 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t1-even-1_1-1024_1024_1024_1024_2_1-test_spec_c.x.log
aprun -n 1 test_spec_c.x > /lustre/scratch/djchen/logs/t1-even-1_1-1024_1024_1024_1024_2_1-test_spec_c.x.log
if($? > 0) then
echo t1-even-1_1-1024_1024_1024_1024_2_1-test_spec_c.x ERROR
else
echo t1-even-1_1-1024_1024_1024_1024_2_1-test_spec_c.x OK
endif
echo 3 2 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t1-even-3_2-1024_1024_1024_1024_2_1-test_spec_f.x.log
aprun -n 6 test_spec_f.x > /lustre/scratch/djchen/logs/t1-even-3_2-1024_1024_1024_1024_2_1-test_spec_f.x.log
if($? > 0) then
echo t1-even-3_2-1024_1024_1024_1024_2_1-test_spec_f.x ERROR
else
echo t1-even-3_2-1024_1024_1024_1024_2_1-test_spec_f.x OK
endif
echo 2 3 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t1-even-2_3-1024_1024_1024_1024_2_1-test_spec_f.x.log
aprun -n 6 test_spec_f.x > /lustre/scratch/djchen/logs/t1-even-2_3-1024_1024_1024_1024_2_1-test_spec_f.x.log
if($? > 0) then
echo t1-even-2_3-1024_1024_1024_1024_2_1-test_spec_f.x ERROR
else
echo t1-even-2_3-1024_1024_1024_1024_2_1-test_spec_f.x OK
endif
echo 2 2 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t1-even-2_2-1024_1024_1024_1024_2_1-test_spec_f.x.log
aprun -n 4 test_spec_f.x > /lustre/scratch/djchen/logs/t1-even-2_2-1024_1024_1024_1024_2_1-test_spec_f.x.log
if($? > 0) then
echo t1-even-2_2-1024_1024_1024_1024_2_1-test_spec_f.x ERROR
else
echo t1-even-2_2-1024_1024_1024_1024_2_1-test_spec_f.x OK
endif
echo 1 4 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t1-even-1_4-1024_1024_1024_1024_2_1-test_spec_f.x.log
aprun -n 4 test_spec_f.x > /lustre/scratch/djchen/logs/t1-even-1_4-1024_1024_1024_1024_2_1-test_spec_f.x.log
if($? > 0) then
echo t1-even-1_4-1024_1024_1024_1024_2_1-test_spec_f.x ERROR
else
echo t1-even-1_4-1024_1024_1024_1024_2_1-test_spec_f.x OK
endif
echo 4 1 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t1-even-4_1-1024_1024_1024_1024_2_1-test_spec_f.x.log
aprun -n 4 test_spec_f.x > /lustre/scratch/djchen/logs/t1-even-4_1-1024_1024_1024_1024_2_1-test_spec_f.x.log
if($? > 0) then
echo t1-even-4_1-1024_1024_1024_1024_2_1-test_spec_f.x ERROR
else
echo t1-even-4_1-1024_1024_1024_1024_2_1-test_spec_f.x OK
endif
echo 1 1 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t1-even-1_1-1024_1024_1024_1024_2_1-test_spec_f.x.log
aprun -n 1 test_spec_f.x > /lustre/scratch/djchen/logs/t1-even-1_1-1024_1024_1024_1024_2_1-test_spec_f.x.log
if($? > 0) then
echo t1-even-1_1-1024_1024_1024_1024_2_1-test_spec_f.x ERROR
else
echo t1-even-1_1-1024_1024_1024_1024_2_1-test_spec_f.x OK
endif
cd /lustre/scratch/djchen/p3dfft-test/test1-stride1/sample
echo 3 2 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t1-stride1-3_2-1024_1024_1024_1024_2_1-test_inverse_c.x.log
aprun -n 6 test_inverse_c.x > /lustre/scratch/djchen/logs/t1-stride1-3_2-1024_1024_1024_1024_2_1-test_inverse_c.x.log
if($? > 0) then
echo t1-stride1-3_2-1024_1024_1024_1024_2_1-test_inverse_c.x ERROR
else
echo t1-stride1-3_2-1024_1024_1024_1024_2_1-test_inverse_c.x OK
endif
echo 2 3 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t1-stride1-2_3-1024_1024_1024_1024_2_1-test_inverse_c.x.log
aprun -n 6 test_inverse_c.x > /lustre/scratch/djchen/logs/t1-stride1-2_3-1024_1024_1024_1024_2_1-test_inverse_c.x.log
if($? > 0) then
echo t1-stride1-2_3-1024_1024_1024_1024_2_1-test_inverse_c.x ERROR
else
echo t1-stride1-2_3-1024_1024_1024_1024_2_1-test_inverse_c.x OK
endif
echo 2 2 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t1-stride1-2_2-1024_1024_1024_1024_2_1-test_inverse_c.x.log
aprun -n 4 test_inverse_c.x > /lustre/scratch/djchen/logs/t1-stride1-2_2-1024_1024_1024_1024_2_1-test_inverse_c.x.log
if($? > 0) then
echo t1-stride1-2_2-1024_1024_1024_1024_2_1-test_inverse_c.x ERROR
else
echo t1-stride1-2_2-1024_1024_1024_1024_2_1-test_inverse_c.x OK
endif
echo 1 4 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t1-stride1-1_4-1024_1024_1024_1024_2_1-test_inverse_c.x.log
aprun -n 4 test_inverse_c.x > /lustre/scratch/djchen/logs/t1-stride1-1_4-1024_1024_1024_1024_2_1-test_inverse_c.x.log
if($? > 0) then
echo t1-stride1-1_4-1024_1024_1024_1024_2_1-test_inverse_c.x ERROR
else
echo t1-stride1-1_4-1024_1024_1024_1024_2_1-test_inverse_c.x OK
endif
echo 4 1 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t1-stride1-4_1-1024_1024_1024_1024_2_1-test_inverse_c.x.log
aprun -n 4 test_inverse_c.x > /lustre/scratch/djchen/logs/t1-stride1-4_1-1024_1024_1024_1024_2_1-test_inverse_c.x.log
if($? > 0) then
echo t1-stride1-4_1-1024_1024_1024_1024_2_1-test_inverse_c.x ERROR
else
echo t1-stride1-4_1-1024_1024_1024_1024_2_1-test_inverse_c.x OK
endif
echo 1 1 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t1-stride1-1_1-1024_1024_1024_1024_2_1-test_inverse_c.x.log
aprun -n 1 test_inverse_c.x > /lustre/scratch/djchen/logs/t1-stride1-1_1-1024_1024_1024_1024_2_1-test_inverse_c.x.log
if($? > 0) then
echo t1-stride1-1_1-1024_1024_1024_1024_2_1-test_inverse_c.x ERROR
else
echo t1-stride1-1_1-1024_1024_1024_1024_2_1-test_inverse_c.x OK
endif
echo 3 2 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t1-stride1-3_2-1024_1024_1024_1024_2_1-test_inverse_f.x.log
aprun -n 6 test_inverse_f.x > /lustre/scratch/djchen/logs/t1-stride1-3_2-1024_1024_1024_1024_2_1-test_inverse_f.x.log
if($? > 0) then
echo t1-stride1-3_2-1024_1024_1024_1024_2_1-test_inverse_f.x ERROR
else
echo t1-stride1-3_2-1024_1024_1024_1024_2_1-test_inverse_f.x OK
endif
echo 2 3 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t1-stride1-2_3-1024_1024_1024_1024_2_1-test_inverse_f.x.log
aprun -n 6 test_inverse_f.x > /lustre/scratch/djchen/logs/t1-stride1-2_3-1024_1024_1024_1024_2_1-test_inverse_f.x.log
if($? > 0) then
echo t1-stride1-2_3-1024_1024_1024_1024_2_1-test_inverse_f.x ERROR
else
echo t1-stride1-2_3-1024_1024_1024_1024_2_1-test_inverse_f.x OK
endif
echo 2 2 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t1-stride1-2_2-1024_1024_1024_1024_2_1-test_inverse_f.x.log
aprun -n 4 test_inverse_f.x > /lustre/scratch/djchen/logs/t1-stride1-2_2-1024_1024_1024_1024_2_1-test_inverse_f.x.log
if($? > 0) then
echo t1-stride1-2_2-1024_1024_1024_1024_2_1-test_inverse_f.x ERROR
else
echo t1-stride1-2_2-1024_1024_1024_1024_2_1-test_inverse_f.x OK
endif
echo 1 4 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t1-stride1-1_4-1024_1024_1024_1024_2_1-test_inverse_f.x.log
aprun -n 4 test_inverse_f.x > /lustre/scratch/djchen/logs/t1-stride1-1_4-1024_1024_1024_1024_2_1-test_inverse_f.x.log
if($? > 0) then
echo t1-stride1-1_4-1024_1024_1024_1024_2_1-test_inverse_f.x ERROR
else
echo t1-stride1-1_4-1024_1024_1024_1024_2_1-test_inverse_f.x OK
endif
echo 4 1 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t1-stride1-4_1-1024_1024_1024_1024_2_1-test_inverse_f.x.log
aprun -n 4 test_inverse_f.x > /lustre/scratch/djchen/logs/t1-stride1-4_1-1024_1024_1024_1024_2_1-test_inverse_f.x.log
if($? > 0) then
echo t1-stride1-4_1-1024_1024_1024_1024_2_1-test_inverse_f.x ERROR
else
echo t1-stride1-4_1-1024_1024_1024_1024_2_1-test_inverse_f.x OK
endif
echo 1 1 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t1-stride1-1_1-1024_1024_1024_1024_2_1-test_inverse_f.x.log
aprun -n 1 test_inverse_f.x > /lustre/scratch/djchen/logs/t1-stride1-1_1-1024_1024_1024_1024_2_1-test_inverse_f.x.log
if($? > 0) then
echo t1-stride1-1_1-1024_1024_1024_1024_2_1-test_inverse_f.x ERROR
else
echo t1-stride1-1_1-1024_1024_1024_1024_2_1-test_inverse_f.x OK
endif
echo 3 2 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t1-stride1-3_2-1024_1024_1024_1024_2_1-test_rand_c.x.log
aprun -n 6 test_rand_c.x > /lustre/scratch/djchen/logs/t1-stride1-3_2-1024_1024_1024_1024_2_1-test_rand_c.x.log
if($? > 0) then
echo t1-stride1-3_2-1024_1024_1024_1024_2_1-test_rand_c.x ERROR
else
echo t1-stride1-3_2-1024_1024_1024_1024_2_1-test_rand_c.x OK
endif
echo 2 3 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t1-stride1-2_3-1024_1024_1024_1024_2_1-test_rand_c.x.log
aprun -n 6 test_rand_c.x > /lustre/scratch/djchen/logs/t1-stride1-2_3-1024_1024_1024_1024_2_1-test_rand_c.x.log
if($? > 0) then
echo t1-stride1-2_3-1024_1024_1024_1024_2_1-test_rand_c.x ERROR
else
echo t1-stride1-2_3-1024_1024_1024_1024_2_1-test_rand_c.x OK
endif
echo 2 2 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t1-stride1-2_2-1024_1024_1024_1024_2_1-test_rand_c.x.log
aprun -n 4 test_rand_c.x > /lustre/scratch/djchen/logs/t1-stride1-2_2-1024_1024_1024_1024_2_1-test_rand_c.x.log
if($? > 0) then
echo t1-stride1-2_2-1024_1024_1024_1024_2_1-test_rand_c.x ERROR
else
echo t1-stride1-2_2-1024_1024_1024_1024_2_1-test_rand_c.x OK
endif
echo 1 4 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t1-stride1-1_4-1024_1024_1024_1024_2_1-test_rand_c.x.log
aprun -n 4 test_rand_c.x > /lustre/scratch/djchen/logs/t1-stride1-1_4-1024_1024_1024_1024_2_1-test_rand_c.x.log
if($? > 0) then
echo t1-stride1-1_4-1024_1024_1024_1024_2_1-test_rand_c.x ERROR
else
echo t1-stride1-1_4-1024_1024_1024_1024_2_1-test_rand_c.x OK
endif
echo 4 1 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t1-stride1-4_1-1024_1024_1024_1024_2_1-test_rand_c.x.log
aprun -n 4 test_rand_c.x > /lustre/scratch/djchen/logs/t1-stride1-4_1-1024_1024_1024_1024_2_1-test_rand_c.x.log
if($? > 0) then
echo t1-stride1-4_1-1024_1024_1024_1024_2_1-test_rand_c.x ERROR
else
echo t1-stride1-4_1-1024_1024_1024_1024_2_1-test_rand_c.x OK
endif
echo 1 1 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t1-stride1-1_1-1024_1024_1024_1024_2_1-test_rand_c.x.log
aprun -n 1 test_rand_c.x > /lustre/scratch/djchen/logs/t1-stride1-1_1-1024_1024_1024_1024_2_1-test_rand_c.x.log
if($? > 0) then
echo t1-stride1-1_1-1024_1024_1024_1024_2_1-test_rand_c.x ERROR
else
echo t1-stride1-1_1-1024_1024_1024_1024_2_1-test_rand_c.x OK
endif
echo 3 2 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t1-stride1-3_2-1024_1024_1024_1024_2_1-test_rand_f.x.log
aprun -n 6 test_rand_f.x > /lustre/scratch/djchen/logs/t1-stride1-3_2-1024_1024_1024_1024_2_1-test_rand_f.x.log
if($? > 0) then
echo t1-stride1-3_2-1024_1024_1024_1024_2_1-test_rand_f.x ERROR
else
echo t1-stride1-3_2-1024_1024_1024_1024_2_1-test_rand_f.x OK
endif
echo 2 3 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t1-stride1-2_3-1024_1024_1024_1024_2_1-test_rand_f.x.log
aprun -n 6 test_rand_f.x > /lustre/scratch/djchen/logs/t1-stride1-2_3-1024_1024_1024_1024_2_1-test_rand_f.x.log
if($? > 0) then
echo t1-stride1-2_3-1024_1024_1024_1024_2_1-test_rand_f.x ERROR
else
echo t1-stride1-2_3-1024_1024_1024_1024_2_1-test_rand_f.x OK
endif
echo 2 2 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t1-stride1-2_2-1024_1024_1024_1024_2_1-test_rand_f.x.log
aprun -n 4 test_rand_f.x > /lustre/scratch/djchen/logs/t1-stride1-2_2-1024_1024_1024_1024_2_1-test_rand_f.x.log
if($? > 0) then
echo t1-stride1-2_2-1024_1024_1024_1024_2_1-test_rand_f.x ERROR
else
echo t1-stride1-2_2-1024_1024_1024_1024_2_1-test_rand_f.x OK
endif
echo 1 4 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t1-stride1-1_4-1024_1024_1024_1024_2_1-test_rand_f.x.log
aprun -n 4 test_rand_f.x > /lustre/scratch/djchen/logs/t1-stride1-1_4-1024_1024_1024_1024_2_1-test_rand_f.x.log
if($? > 0) then
echo t1-stride1-1_4-1024_1024_1024_1024_2_1-test_rand_f.x ERROR
else
echo t1-stride1-1_4-1024_1024_1024_1024_2_1-test_rand_f.x OK
endif
echo 4 1 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t1-stride1-4_1-1024_1024_1024_1024_2_1-test_rand_f.x.log
aprun -n 4 test_rand_f.x > /lustre/scratch/djchen/logs/t1-stride1-4_1-1024_1024_1024_1024_2_1-test_rand_f.x.log
if($? > 0) then
echo t1-stride1-4_1-1024_1024_1024_1024_2_1-test_rand_f.x ERROR
else
echo t1-stride1-4_1-1024_1024_1024_1024_2_1-test_rand_f.x OK
endif
echo 1 1 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t1-stride1-1_1-1024_1024_1024_1024_2_1-test_rand_f.x.log
aprun -n 1 test_rand_f.x > /lustre/scratch/djchen/logs/t1-stride1-1_1-1024_1024_1024_1024_2_1-test_rand_f.x.log
if($? > 0) then
echo t1-stride1-1_1-1024_1024_1024_1024_2_1-test_rand_f.x ERROR
else
echo t1-stride1-1_1-1024_1024_1024_1024_2_1-test_rand_f.x OK
endif
echo 3 2 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t1-stride1-3_2-1024_1024_1024_1024_2_1-test_sine_c.x.log
aprun -n 6 test_sine_c.x > /lustre/scratch/djchen/logs/t1-stride1-3_2-1024_1024_1024_1024_2_1-test_sine_c.x.log
if($? > 0) then
echo t1-stride1-3_2-1024_1024_1024_1024_2_1-test_sine_c.x ERROR
else
echo t1-stride1-3_2-1024_1024_1024_1024_2_1-test_sine_c.x OK
endif
echo 2 3 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t1-stride1-2_3-1024_1024_1024_1024_2_1-test_sine_c.x.log
aprun -n 6 test_sine_c.x > /lustre/scratch/djchen/logs/t1-stride1-2_3-1024_1024_1024_1024_2_1-test_sine_c.x.log
if($? > 0) then
echo t1-stride1-2_3-1024_1024_1024_1024_2_1-test_sine_c.x ERROR
else
echo t1-stride1-2_3-1024_1024_1024_1024_2_1-test_sine_c.x OK
endif
echo 2 2 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t1-stride1-2_2-1024_1024_1024_1024_2_1-test_sine_c.x.log
aprun -n 4 test_sine_c.x > /lustre/scratch/djchen/logs/t1-stride1-2_2-1024_1024_1024_1024_2_1-test_sine_c.x.log
if($? > 0) then
echo t1-stride1-2_2-1024_1024_1024_1024_2_1-test_sine_c.x ERROR
else
echo t1-stride1-2_2-1024_1024_1024_1024_2_1-test_sine_c.x OK
endif
echo 1 4 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t1-stride1-1_4-1024_1024_1024_1024_2_1-test_sine_c.x.log
aprun -n 4 test_sine_c.x > /lustre/scratch/djchen/logs/t1-stride1-1_4-1024_1024_1024_1024_2_1-test_sine_c.x.log
if($? > 0) then
echo t1-stride1-1_4-1024_1024_1024_1024_2_1-test_sine_c.x ERROR
else
echo t1-stride1-1_4-1024_1024_1024_1024_2_1-test_sine_c.x OK
endif
echo 4 1 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t1-stride1-4_1-1024_1024_1024_1024_2_1-test_sine_c.x.log
aprun -n 4 test_sine_c.x > /lustre/scratch/djchen/logs/t1-stride1-4_1-1024_1024_1024_1024_2_1-test_sine_c.x.log
if($? > 0) then
echo t1-stride1-4_1-1024_1024_1024_1024_2_1-test_sine_c.x ERROR
else
echo t1-stride1-4_1-1024_1024_1024_1024_2_1-test_sine_c.x OK
endif
echo 1 1 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t1-stride1-1_1-1024_1024_1024_1024_2_1-test_sine_c.x.log
aprun -n 1 test_sine_c.x > /lustre/scratch/djchen/logs/t1-stride1-1_1-1024_1024_1024_1024_2_1-test_sine_c.x.log
if($? > 0) then
echo t1-stride1-1_1-1024_1024_1024_1024_2_1-test_sine_c.x ERROR
else
echo t1-stride1-1_1-1024_1024_1024_1024_2_1-test_sine_c.x OK
endif
echo 3 2 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t1-stride1-3_2-1024_1024_1024_1024_2_1-test_sine_f.x.log
aprun -n 6 test_sine_f.x > /lustre/scratch/djchen/logs/t1-stride1-3_2-1024_1024_1024_1024_2_1-test_sine_f.x.log
if($? > 0) then
echo t1-stride1-3_2-1024_1024_1024_1024_2_1-test_sine_f.x ERROR
else
echo t1-stride1-3_2-1024_1024_1024_1024_2_1-test_sine_f.x OK
endif
echo 2 3 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t1-stride1-2_3-1024_1024_1024_1024_2_1-test_sine_f.x.log
aprun -n 6 test_sine_f.x > /lustre/scratch/djchen/logs/t1-stride1-2_3-1024_1024_1024_1024_2_1-test_sine_f.x.log
if($? > 0) then
echo t1-stride1-2_3-1024_1024_1024_1024_2_1-test_sine_f.x ERROR
else
echo t1-stride1-2_3-1024_1024_1024_1024_2_1-test_sine_f.x OK
endif
echo 2 2 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t1-stride1-2_2-1024_1024_1024_1024_2_1-test_sine_f.x.log
aprun -n 4 test_sine_f.x > /lustre/scratch/djchen/logs/t1-stride1-2_2-1024_1024_1024_1024_2_1-test_sine_f.x.log
if($? > 0) then
echo t1-stride1-2_2-1024_1024_1024_1024_2_1-test_sine_f.x ERROR
else
echo t1-stride1-2_2-1024_1024_1024_1024_2_1-test_sine_f.x OK
endif
echo 1 4 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t1-stride1-1_4-1024_1024_1024_1024_2_1-test_sine_f.x.log
aprun -n 4 test_sine_f.x > /lustre/scratch/djchen/logs/t1-stride1-1_4-1024_1024_1024_1024_2_1-test_sine_f.x.log
if($? > 0) then
echo t1-stride1-1_4-1024_1024_1024_1024_2_1-test_sine_f.x ERROR
else
echo t1-stride1-1_4-1024_1024_1024_1024_2_1-test_sine_f.x OK
endif
echo 4 1 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t1-stride1-4_1-1024_1024_1024_1024_2_1-test_sine_f.x.log
aprun -n 4 test_sine_f.x > /lustre/scratch/djchen/logs/t1-stride1-4_1-1024_1024_1024_1024_2_1-test_sine_f.x.log
if($? > 0) then
echo t1-stride1-4_1-1024_1024_1024_1024_2_1-test_sine_f.x ERROR
else
echo t1-stride1-4_1-1024_1024_1024_1024_2_1-test_sine_f.x OK
endif
echo 1 1 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t1-stride1-1_1-1024_1024_1024_1024_2_1-test_sine_f.x.log
aprun -n 1 test_sine_f.x > /lustre/scratch/djchen/logs/t1-stride1-1_1-1024_1024_1024_1024_2_1-test_sine_f.x.log
if($? > 0) then
echo t1-stride1-1_1-1024_1024_1024_1024_2_1-test_sine_f.x ERROR
else
echo t1-stride1-1_1-1024_1024_1024_1024_2_1-test_sine_f.x OK
endif
echo 3 2 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t1-stride1-3_2-1024_1024_1024_1024_2_1-test_sine_inplace_c.x.log
aprun -n 6 test_sine_inplace_c.x > /lustre/scratch/djchen/logs/t1-stride1-3_2-1024_1024_1024_1024_2_1-test_sine_inplace_c.x.log
if($? > 0) then
echo t1-stride1-3_2-1024_1024_1024_1024_2_1-test_sine_inplace_c.x ERROR
else
echo t1-stride1-3_2-1024_1024_1024_1024_2_1-test_sine_inplace_c.x OK
endif
echo 2 3 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t1-stride1-2_3-1024_1024_1024_1024_2_1-test_sine_inplace_c.x.log
aprun -n 6 test_sine_inplace_c.x > /lustre/scratch/djchen/logs/t1-stride1-2_3-1024_1024_1024_1024_2_1-test_sine_inplace_c.x.log
if($? > 0) then
echo t1-stride1-2_3-1024_1024_1024_1024_2_1-test_sine_inplace_c.x ERROR
else
echo t1-stride1-2_3-1024_1024_1024_1024_2_1-test_sine_inplace_c.x OK
endif
echo 2 2 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t1-stride1-2_2-1024_1024_1024_1024_2_1-test_sine_inplace_c.x.log
aprun -n 4 test_sine_inplace_c.x > /lustre/scratch/djchen/logs/t1-stride1-2_2-1024_1024_1024_1024_2_1-test_sine_inplace_c.x.log
if($? > 0) then
echo t1-stride1-2_2-1024_1024_1024_1024_2_1-test_sine_inplace_c.x ERROR
else
echo t1-stride1-2_2-1024_1024_1024_1024_2_1-test_sine_inplace_c.x OK
endif
echo 1 4 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t1-stride1-1_4-1024_1024_1024_1024_2_1-test_sine_inplace_c.x.log
aprun -n 4 test_sine_inplace_c.x > /lustre/scratch/djchen/logs/t1-stride1-1_4-1024_1024_1024_1024_2_1-test_sine_inplace_c.x.log
if($? > 0) then
echo t1-stride1-1_4-1024_1024_1024_1024_2_1-test_sine_inplace_c.x ERROR
else
echo t1-stride1-1_4-1024_1024_1024_1024_2_1-test_sine_inplace_c.x OK
endif
echo 4 1 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t1-stride1-4_1-1024_1024_1024_1024_2_1-test_sine_inplace_c.x.log
aprun -n 4 test_sine_inplace_c.x > /lustre/scratch/djchen/logs/t1-stride1-4_1-1024_1024_1024_1024_2_1-test_sine_inplace_c.x.log
if($? > 0) then
echo t1-stride1-4_1-1024_1024_1024_1024_2_1-test_sine_inplace_c.x ERROR
else
echo t1-stride1-4_1-1024_1024_1024_1024_2_1-test_sine_inplace_c.x OK
endif
echo 1 1 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t1-stride1-1_1-1024_1024_1024_1024_2_1-test_sine_inplace_c.x.log
aprun -n 1 test_sine_inplace_c.x > /lustre/scratch/djchen/logs/t1-stride1-1_1-1024_1024_1024_1024_2_1-test_sine_inplace_c.x.log
if($? > 0) then
echo t1-stride1-1_1-1024_1024_1024_1024_2_1-test_sine_inplace_c.x ERROR
else
echo t1-stride1-1_1-1024_1024_1024_1024_2_1-test_sine_inplace_c.x OK
endif
echo 3 2 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t1-stride1-3_2-1024_1024_1024_1024_2_1-test_sine_inplace_f.x.log
aprun -n 6 test_sine_inplace_f.x > /lustre/scratch/djchen/logs/t1-stride1-3_2-1024_1024_1024_1024_2_1-test_sine_inplace_f.x.log
if($? > 0) then
echo t1-stride1-3_2-1024_1024_1024_1024_2_1-test_sine_inplace_f.x ERROR
else
echo t1-stride1-3_2-1024_1024_1024_1024_2_1-test_sine_inplace_f.x OK
endif
echo 2 3 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t1-stride1-2_3-1024_1024_1024_1024_2_1-test_sine_inplace_f.x.log
aprun -n 6 test_sine_inplace_f.x > /lustre/scratch/djchen/logs/t1-stride1-2_3-1024_1024_1024_1024_2_1-test_sine_inplace_f.x.log
if($? > 0) then
echo t1-stride1-2_3-1024_1024_1024_1024_2_1-test_sine_inplace_f.x ERROR
else
echo t1-stride1-2_3-1024_1024_1024_1024_2_1-test_sine_inplace_f.x OK
endif
echo 2 2 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t1-stride1-2_2-1024_1024_1024_1024_2_1-test_sine_inplace_f.x.log
aprun -n 4 test_sine_inplace_f.x > /lustre/scratch/djchen/logs/t1-stride1-2_2-1024_1024_1024_1024_2_1-test_sine_inplace_f.x.log
if($? > 0) then
echo t1-stride1-2_2-1024_1024_1024_1024_2_1-test_sine_inplace_f.x ERROR
else
echo t1-stride1-2_2-1024_1024_1024_1024_2_1-test_sine_inplace_f.x OK
endif
echo 1 4 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t1-stride1-1_4-1024_1024_1024_1024_2_1-test_sine_inplace_f.x.log
aprun -n 4 test_sine_inplace_f.x > /lustre/scratch/djchen/logs/t1-stride1-1_4-1024_1024_1024_1024_2_1-test_sine_inplace_f.x.log
if($? > 0) then
echo t1-stride1-1_4-1024_1024_1024_1024_2_1-test_sine_inplace_f.x ERROR
else
echo t1-stride1-1_4-1024_1024_1024_1024_2_1-test_sine_inplace_f.x OK
endif
echo 4 1 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t1-stride1-4_1-1024_1024_1024_1024_2_1-test_sine_inplace_f.x.log
aprun -n 4 test_sine_inplace_f.x > /lustre/scratch/djchen/logs/t1-stride1-4_1-1024_1024_1024_1024_2_1-test_sine_inplace_f.x.log
if($? > 0) then
echo t1-stride1-4_1-1024_1024_1024_1024_2_1-test_sine_inplace_f.x ERROR
else
echo t1-stride1-4_1-1024_1024_1024_1024_2_1-test_sine_inplace_f.x OK
endif
echo 1 1 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t1-stride1-1_1-1024_1024_1024_1024_2_1-test_sine_inplace_f.x.log
aprun -n 1 test_sine_inplace_f.x > /lustre/scratch/djchen/logs/t1-stride1-1_1-1024_1024_1024_1024_2_1-test_sine_inplace_f.x.log
if($? > 0) then
echo t1-stride1-1_1-1024_1024_1024_1024_2_1-test_sine_inplace_f.x ERROR
else
echo t1-stride1-1_1-1024_1024_1024_1024_2_1-test_sine_inplace_f.x OK
endif
echo 3 2 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t1-stride1-3_2-1024_1024_1024_1024_2_1-test_spec_c.x.log
aprun -n 6 test_spec_c.x > /lustre/scratch/djchen/logs/t1-stride1-3_2-1024_1024_1024_1024_2_1-test_spec_c.x.log
if($? > 0) then
echo t1-stride1-3_2-1024_1024_1024_1024_2_1-test_spec_c.x ERROR
else
echo t1-stride1-3_2-1024_1024_1024_1024_2_1-test_spec_c.x OK
endif
echo 2 3 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t1-stride1-2_3-1024_1024_1024_1024_2_1-test_spec_c.x.log
aprun -n 6 test_spec_c.x > /lustre/scratch/djchen/logs/t1-stride1-2_3-1024_1024_1024_1024_2_1-test_spec_c.x.log
if($? > 0) then
echo t1-stride1-2_3-1024_1024_1024_1024_2_1-test_spec_c.x ERROR
else
echo t1-stride1-2_3-1024_1024_1024_1024_2_1-test_spec_c.x OK
endif
echo 2 2 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t1-stride1-2_2-1024_1024_1024_1024_2_1-test_spec_c.x.log
aprun -n 4 test_spec_c.x > /lustre/scratch/djchen/logs/t1-stride1-2_2-1024_1024_1024_1024_2_1-test_spec_c.x.log
if($? > 0) then
echo t1-stride1-2_2-1024_1024_1024_1024_2_1-test_spec_c.x ERROR
else
echo t1-stride1-2_2-1024_1024_1024_1024_2_1-test_spec_c.x OK
endif
echo 1 4 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t1-stride1-1_4-1024_1024_1024_1024_2_1-test_spec_c.x.log
aprun -n 4 test_spec_c.x > /lustre/scratch/djchen/logs/t1-stride1-1_4-1024_1024_1024_1024_2_1-test_spec_c.x.log
if($? > 0) then
echo t1-stride1-1_4-1024_1024_1024_1024_2_1-test_spec_c.x ERROR
else
echo t1-stride1-1_4-1024_1024_1024_1024_2_1-test_spec_c.x OK
endif
echo 4 1 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t1-stride1-4_1-1024_1024_1024_1024_2_1-test_spec_c.x.log
aprun -n 4 test_spec_c.x > /lustre/scratch/djchen/logs/t1-stride1-4_1-1024_1024_1024_1024_2_1-test_spec_c.x.log
if($? > 0) then
echo t1-stride1-4_1-1024_1024_1024_1024_2_1-test_spec_c.x ERROR
else
echo t1-stride1-4_1-1024_1024_1024_1024_2_1-test_spec_c.x OK
endif
echo 1 1 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t1-stride1-1_1-1024_1024_1024_1024_2_1-test_spec_c.x.log
aprun -n 1 test_spec_c.x > /lustre/scratch/djchen/logs/t1-stride1-1_1-1024_1024_1024_1024_2_1-test_spec_c.x.log
if($? > 0) then
echo t1-stride1-1_1-1024_1024_1024_1024_2_1-test_spec_c.x ERROR
else
echo t1-stride1-1_1-1024_1024_1024_1024_2_1-test_spec_c.x OK
endif
echo 3 2 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t1-stride1-3_2-1024_1024_1024_1024_2_1-test_spec_f.x.log
aprun -n 6 test_spec_f.x > /lustre/scratch/djchen/logs/t1-stride1-3_2-1024_1024_1024_1024_2_1-test_spec_f.x.log
if($? > 0) then
echo t1-stride1-3_2-1024_1024_1024_1024_2_1-test_spec_f.x ERROR
else
echo t1-stride1-3_2-1024_1024_1024_1024_2_1-test_spec_f.x OK
endif
echo 2 3 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t1-stride1-2_3-1024_1024_1024_1024_2_1-test_spec_f.x.log
aprun -n 6 test_spec_f.x > /lustre/scratch/djchen/logs/t1-stride1-2_3-1024_1024_1024_1024_2_1-test_spec_f.x.log
if($? > 0) then
echo t1-stride1-2_3-1024_1024_1024_1024_2_1-test_spec_f.x ERROR
else
echo t1-stride1-2_3-1024_1024_1024_1024_2_1-test_spec_f.x OK
endif
echo 2 2 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t1-stride1-2_2-1024_1024_1024_1024_2_1-test_spec_f.x.log
aprun -n 4 test_spec_f.x > /lustre/scratch/djchen/logs/t1-stride1-2_2-1024_1024_1024_1024_2_1-test_spec_f.x.log
if($? > 0) then
echo t1-stride1-2_2-1024_1024_1024_1024_2_1-test_spec_f.x ERROR
else
echo t1-stride1-2_2-1024_1024_1024_1024_2_1-test_spec_f.x OK
endif
echo 1 4 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t1-stride1-1_4-1024_1024_1024_1024_2_1-test_spec_f.x.log
aprun -n 4 test_spec_f.x > /lustre/scratch/djchen/logs/t1-stride1-1_4-1024_1024_1024_1024_2_1-test_spec_f.x.log
if($? > 0) then
echo t1-stride1-1_4-1024_1024_1024_1024_2_1-test_spec_f.x ERROR
else
echo t1-stride1-1_4-1024_1024_1024_1024_2_1-test_spec_f.x OK
endif
echo 4 1 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t1-stride1-4_1-1024_1024_1024_1024_2_1-test_spec_f.x.log
aprun -n 4 test_spec_f.x > /lustre/scratch/djchen/logs/t1-stride1-4_1-1024_1024_1024_1024_2_1-test_spec_f.x.log
if($? > 0) then
echo t1-stride1-4_1-1024_1024_1024_1024_2_1-test_spec_f.x ERROR
else
echo t1-stride1-4_1-1024_1024_1024_1024_2_1-test_spec_f.x OK
endif
echo 1 1 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t1-stride1-1_1-1024_1024_1024_1024_2_1-test_spec_f.x.log
aprun -n 1 test_spec_f.x > /lustre/scratch/djchen/logs/t1-stride1-1_1-1024_1024_1024_1024_2_1-test_spec_f.x.log
if($? > 0) then
echo t1-stride1-1_1-1024_1024_1024_1024_2_1-test_spec_f.x ERROR
else
echo t1-stride1-1_1-1024_1024_1024_1024_2_1-test_spec_f.x OK
endif
cd /lustre/scratch/djchen/p3dfft-test/test1-even-stride1/sample
echo 3 2 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t1-even-stride1-3_2-1024_1024_1024_1024_2_1-test_inverse_c.x.log
aprun -n 6 test_inverse_c.x > /lustre/scratch/djchen/logs/t1-even-stride1-3_2-1024_1024_1024_1024_2_1-test_inverse_c.x.log
if($? > 0) then
echo t1-even-stride1-3_2-1024_1024_1024_1024_2_1-test_inverse_c.x ERROR
else
echo t1-even-stride1-3_2-1024_1024_1024_1024_2_1-test_inverse_c.x OK
endif
echo 2 3 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t1-even-stride1-2_3-1024_1024_1024_1024_2_1-test_inverse_c.x.log
aprun -n 6 test_inverse_c.x > /lustre/scratch/djchen/logs/t1-even-stride1-2_3-1024_1024_1024_1024_2_1-test_inverse_c.x.log
if($? > 0) then
echo t1-even-stride1-2_3-1024_1024_1024_1024_2_1-test_inverse_c.x ERROR
else
echo t1-even-stride1-2_3-1024_1024_1024_1024_2_1-test_inverse_c.x OK
endif
echo 2 2 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t1-even-stride1-2_2-1024_1024_1024_1024_2_1-test_inverse_c.x.log
aprun -n 4 test_inverse_c.x > /lustre/scratch/djchen/logs/t1-even-stride1-2_2-1024_1024_1024_1024_2_1-test_inverse_c.x.log
if($? > 0) then
echo t1-even-stride1-2_2-1024_1024_1024_1024_2_1-test_inverse_c.x ERROR
else
echo t1-even-stride1-2_2-1024_1024_1024_1024_2_1-test_inverse_c.x OK
endif
echo 1 4 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t1-even-stride1-1_4-1024_1024_1024_1024_2_1-test_inverse_c.x.log
aprun -n 4 test_inverse_c.x > /lustre/scratch/djchen/logs/t1-even-stride1-1_4-1024_1024_1024_1024_2_1-test_inverse_c.x.log
if($? > 0) then
echo t1-even-stride1-1_4-1024_1024_1024_1024_2_1-test_inverse_c.x ERROR
else
echo t1-even-stride1-1_4-1024_1024_1024_1024_2_1-test_inverse_c.x OK
endif
echo 4 1 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t1-even-stride1-4_1-1024_1024_1024_1024_2_1-test_inverse_c.x.log
aprun -n 4 test_inverse_c.x > /lustre/scratch/djchen/logs/t1-even-stride1-4_1-1024_1024_1024_1024_2_1-test_inverse_c.x.log
if($? > 0) then
echo t1-even-stride1-4_1-1024_1024_1024_1024_2_1-test_inverse_c.x ERROR
else
echo t1-even-stride1-4_1-1024_1024_1024_1024_2_1-test_inverse_c.x OK
endif
echo 1 1 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t1-even-stride1-1_1-1024_1024_1024_1024_2_1-test_inverse_c.x.log
aprun -n 1 test_inverse_c.x > /lustre/scratch/djchen/logs/t1-even-stride1-1_1-1024_1024_1024_1024_2_1-test_inverse_c.x.log
if($? > 0) then
echo t1-even-stride1-1_1-1024_1024_1024_1024_2_1-test_inverse_c.x ERROR
else
echo t1-even-stride1-1_1-1024_1024_1024_1024_2_1-test_inverse_c.x OK
endif
echo 3 2 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t1-even-stride1-3_2-1024_1024_1024_1024_2_1-test_inverse_f.x.log
aprun -n 6 test_inverse_f.x > /lustre/scratch/djchen/logs/t1-even-stride1-3_2-1024_1024_1024_1024_2_1-test_inverse_f.x.log
if($? > 0) then
echo t1-even-stride1-3_2-1024_1024_1024_1024_2_1-test_inverse_f.x ERROR
else
echo t1-even-stride1-3_2-1024_1024_1024_1024_2_1-test_inverse_f.x OK
endif
echo 2 3 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t1-even-stride1-2_3-1024_1024_1024_1024_2_1-test_inverse_f.x.log
aprun -n 6 test_inverse_f.x > /lustre/scratch/djchen/logs/t1-even-stride1-2_3-1024_1024_1024_1024_2_1-test_inverse_f.x.log
if($? > 0) then
echo t1-even-stride1-2_3-1024_1024_1024_1024_2_1-test_inverse_f.x ERROR
else
echo t1-even-stride1-2_3-1024_1024_1024_1024_2_1-test_inverse_f.x OK
endif
echo 2 2 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t1-even-stride1-2_2-1024_1024_1024_1024_2_1-test_inverse_f.x.log
aprun -n 4 test_inverse_f.x > /lustre/scratch/djchen/logs/t1-even-stride1-2_2-1024_1024_1024_1024_2_1-test_inverse_f.x.log
if($? > 0) then
echo t1-even-stride1-2_2-1024_1024_1024_1024_2_1-test_inverse_f.x ERROR
else
echo t1-even-stride1-2_2-1024_1024_1024_1024_2_1-test_inverse_f.x OK
endif
echo 1 4 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t1-even-stride1-1_4-1024_1024_1024_1024_2_1-test_inverse_f.x.log
aprun -n 4 test_inverse_f.x > /lustre/scratch/djchen/logs/t1-even-stride1-1_4-1024_1024_1024_1024_2_1-test_inverse_f.x.log
if($? > 0) then
echo t1-even-stride1-1_4-1024_1024_1024_1024_2_1-test_inverse_f.x ERROR
else
echo t1-even-stride1-1_4-1024_1024_1024_1024_2_1-test_inverse_f.x OK
endif
echo 4 1 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t1-even-stride1-4_1-1024_1024_1024_1024_2_1-test_inverse_f.x.log
aprun -n 4 test_inverse_f.x > /lustre/scratch/djchen/logs/t1-even-stride1-4_1-1024_1024_1024_1024_2_1-test_inverse_f.x.log
if($? > 0) then
echo t1-even-stride1-4_1-1024_1024_1024_1024_2_1-test_inverse_f.x ERROR
else
echo t1-even-stride1-4_1-1024_1024_1024_1024_2_1-test_inverse_f.x OK
endif
echo 1 1 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t1-even-stride1-1_1-1024_1024_1024_1024_2_1-test_inverse_f.x.log
aprun -n 1 test_inverse_f.x > /lustre/scratch/djchen/logs/t1-even-stride1-1_1-1024_1024_1024_1024_2_1-test_inverse_f.x.log
if($? > 0) then
echo t1-even-stride1-1_1-1024_1024_1024_1024_2_1-test_inverse_f.x ERROR
else
echo t1-even-stride1-1_1-1024_1024_1024_1024_2_1-test_inverse_f.x OK
endif
echo 3 2 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t1-even-stride1-3_2-1024_1024_1024_1024_2_1-test_rand_c.x.log
aprun -n 6 test_rand_c.x > /lustre/scratch/djchen/logs/t1-even-stride1-3_2-1024_1024_1024_1024_2_1-test_rand_c.x.log
if($? > 0) then
echo t1-even-stride1-3_2-1024_1024_1024_1024_2_1-test_rand_c.x ERROR
else
echo t1-even-stride1-3_2-1024_1024_1024_1024_2_1-test_rand_c.x OK
endif
echo 2 3 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t1-even-stride1-2_3-1024_1024_1024_1024_2_1-test_rand_c.x.log
aprun -n 6 test_rand_c.x > /lustre/scratch/djchen/logs/t1-even-stride1-2_3-1024_1024_1024_1024_2_1-test_rand_c.x.log
if($? > 0) then
echo t1-even-stride1-2_3-1024_1024_1024_1024_2_1-test_rand_c.x ERROR
else
echo t1-even-stride1-2_3-1024_1024_1024_1024_2_1-test_rand_c.x OK
endif
echo 2 2 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t1-even-stride1-2_2-1024_1024_1024_1024_2_1-test_rand_c.x.log
aprun -n 4 test_rand_c.x > /lustre/scratch/djchen/logs/t1-even-stride1-2_2-1024_1024_1024_1024_2_1-test_rand_c.x.log
if($? > 0) then
echo t1-even-stride1-2_2-1024_1024_1024_1024_2_1-test_rand_c.x ERROR
else
echo t1-even-stride1-2_2-1024_1024_1024_1024_2_1-test_rand_c.x OK
endif
echo 1 4 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t1-even-stride1-1_4-1024_1024_1024_1024_2_1-test_rand_c.x.log
aprun -n 4 test_rand_c.x > /lustre/scratch/djchen/logs/t1-even-stride1-1_4-1024_1024_1024_1024_2_1-test_rand_c.x.log
if($? > 0) then
echo t1-even-stride1-1_4-1024_1024_1024_1024_2_1-test_rand_c.x ERROR
else
echo t1-even-stride1-1_4-1024_1024_1024_1024_2_1-test_rand_c.x OK
endif
echo 4 1 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t1-even-stride1-4_1-1024_1024_1024_1024_2_1-test_rand_c.x.log
aprun -n 4 test_rand_c.x > /lustre/scratch/djchen/logs/t1-even-stride1-4_1-1024_1024_1024_1024_2_1-test_rand_c.x.log
if($? > 0) then
echo t1-even-stride1-4_1-1024_1024_1024_1024_2_1-test_rand_c.x ERROR
else
echo t1-even-stride1-4_1-1024_1024_1024_1024_2_1-test_rand_c.x OK
endif
echo 1 1 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t1-even-stride1-1_1-1024_1024_1024_1024_2_1-test_rand_c.x.log
aprun -n 1 test_rand_c.x > /lustre/scratch/djchen/logs/t1-even-stride1-1_1-1024_1024_1024_1024_2_1-test_rand_c.x.log
if($? > 0) then
echo t1-even-stride1-1_1-1024_1024_1024_1024_2_1-test_rand_c.x ERROR
else
echo t1-even-stride1-1_1-1024_1024_1024_1024_2_1-test_rand_c.x OK
endif
echo 3 2 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t1-even-stride1-3_2-1024_1024_1024_1024_2_1-test_rand_f.x.log
aprun -n 6 test_rand_f.x > /lustre/scratch/djchen/logs/t1-even-stride1-3_2-1024_1024_1024_1024_2_1-test_rand_f.x.log
if($? > 0) then
echo t1-even-stride1-3_2-1024_1024_1024_1024_2_1-test_rand_f.x ERROR
else
echo t1-even-stride1-3_2-1024_1024_1024_1024_2_1-test_rand_f.x OK
endif
echo 2 3 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t1-even-stride1-2_3-1024_1024_1024_1024_2_1-test_rand_f.x.log
aprun -n 6 test_rand_f.x > /lustre/scratch/djchen/logs/t1-even-stride1-2_3-1024_1024_1024_1024_2_1-test_rand_f.x.log
if($? > 0) then
echo t1-even-stride1-2_3-1024_1024_1024_1024_2_1-test_rand_f.x ERROR
else
echo t1-even-stride1-2_3-1024_1024_1024_1024_2_1-test_rand_f.x OK
endif
echo 2 2 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t1-even-stride1-2_2-1024_1024_1024_1024_2_1-test_rand_f.x.log
aprun -n 4 test_rand_f.x > /lustre/scratch/djchen/logs/t1-even-stride1-2_2-1024_1024_1024_1024_2_1-test_rand_f.x.log
if($? > 0) then
echo t1-even-stride1-2_2-1024_1024_1024_1024_2_1-test_rand_f.x ERROR
else
echo t1-even-stride1-2_2-1024_1024_1024_1024_2_1-test_rand_f.x OK
endif
echo 1 4 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t1-even-stride1-1_4-1024_1024_1024_1024_2_1-test_rand_f.x.log
aprun -n 4 test_rand_f.x > /lustre/scratch/djchen/logs/t1-even-stride1-1_4-1024_1024_1024_1024_2_1-test_rand_f.x.log
if($? > 0) then
echo t1-even-stride1-1_4-1024_1024_1024_1024_2_1-test_rand_f.x ERROR
else
echo t1-even-stride1-1_4-1024_1024_1024_1024_2_1-test_rand_f.x OK
endif
echo 4 1 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t1-even-stride1-4_1-1024_1024_1024_1024_2_1-test_rand_f.x.log
aprun -n 4 test_rand_f.x > /lustre/scratch/djchen/logs/t1-even-stride1-4_1-1024_1024_1024_1024_2_1-test_rand_f.x.log
if($? > 0) then
echo t1-even-stride1-4_1-1024_1024_1024_1024_2_1-test_rand_f.x ERROR
else
echo t1-even-stride1-4_1-1024_1024_1024_1024_2_1-test_rand_f.x OK
endif
echo 1 1 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t1-even-stride1-1_1-1024_1024_1024_1024_2_1-test_rand_f.x.log
aprun -n 1 test_rand_f.x > /lustre/scratch/djchen/logs/t1-even-stride1-1_1-1024_1024_1024_1024_2_1-test_rand_f.x.log
if($? > 0) then
echo t1-even-stride1-1_1-1024_1024_1024_1024_2_1-test_rand_f.x ERROR
else
echo t1-even-stride1-1_1-1024_1024_1024_1024_2_1-test_rand_f.x OK
endif
echo 3 2 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t1-even-stride1-3_2-1024_1024_1024_1024_2_1-test_sine_c.x.log
aprun -n 6 test_sine_c.x > /lustre/scratch/djchen/logs/t1-even-stride1-3_2-1024_1024_1024_1024_2_1-test_sine_c.x.log
if($? > 0) then
echo t1-even-stride1-3_2-1024_1024_1024_1024_2_1-test_sine_c.x ERROR
else
echo t1-even-stride1-3_2-1024_1024_1024_1024_2_1-test_sine_c.x OK
endif
echo 2 3 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t1-even-stride1-2_3-1024_1024_1024_1024_2_1-test_sine_c.x.log
aprun -n 6 test_sine_c.x > /lustre/scratch/djchen/logs/t1-even-stride1-2_3-1024_1024_1024_1024_2_1-test_sine_c.x.log
if($? > 0) then
echo t1-even-stride1-2_3-1024_1024_1024_1024_2_1-test_sine_c.x ERROR
else
echo t1-even-stride1-2_3-1024_1024_1024_1024_2_1-test_sine_c.x OK
endif
echo 2 2 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t1-even-stride1-2_2-1024_1024_1024_1024_2_1-test_sine_c.x.log
aprun -n 4 test_sine_c.x > /lustre/scratch/djchen/logs/t1-even-stride1-2_2-1024_1024_1024_1024_2_1-test_sine_c.x.log
if($? > 0) then
echo t1-even-stride1-2_2-1024_1024_1024_1024_2_1-test_sine_c.x ERROR
else
echo t1-even-stride1-2_2-1024_1024_1024_1024_2_1-test_sine_c.x OK
endif
echo 1 4 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t1-even-stride1-1_4-1024_1024_1024_1024_2_1-test_sine_c.x.log
aprun -n 4 test_sine_c.x > /lustre/scratch/djchen/logs/t1-even-stride1-1_4-1024_1024_1024_1024_2_1-test_sine_c.x.log
if($? > 0) then
echo t1-even-stride1-1_4-1024_1024_1024_1024_2_1-test_sine_c.x ERROR
else
echo t1-even-stride1-1_4-1024_1024_1024_1024_2_1-test_sine_c.x OK
endif
echo 4 1 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t1-even-stride1-4_1-1024_1024_1024_1024_2_1-test_sine_c.x.log
aprun -n 4 test_sine_c.x > /lustre/scratch/djchen/logs/t1-even-stride1-4_1-1024_1024_1024_1024_2_1-test_sine_c.x.log
if($? > 0) then
echo t1-even-stride1-4_1-1024_1024_1024_1024_2_1-test_sine_c.x ERROR
else
echo t1-even-stride1-4_1-1024_1024_1024_1024_2_1-test_sine_c.x OK
endif
echo 1 1 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t1-even-stride1-1_1-1024_1024_1024_1024_2_1-test_sine_c.x.log
aprun -n 1 test_sine_c.x > /lustre/scratch/djchen/logs/t1-even-stride1-1_1-1024_1024_1024_1024_2_1-test_sine_c.x.log
if($? > 0) then
echo t1-even-stride1-1_1-1024_1024_1024_1024_2_1-test_sine_c.x ERROR
else
echo t1-even-stride1-1_1-1024_1024_1024_1024_2_1-test_sine_c.x OK
endif
echo 3 2 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t1-even-stride1-3_2-1024_1024_1024_1024_2_1-test_sine_f.x.log
aprun -n 6 test_sine_f.x > /lustre/scratch/djchen/logs/t1-even-stride1-3_2-1024_1024_1024_1024_2_1-test_sine_f.x.log
if($? > 0) then
echo t1-even-stride1-3_2-1024_1024_1024_1024_2_1-test_sine_f.x ERROR
else
echo t1-even-stride1-3_2-1024_1024_1024_1024_2_1-test_sine_f.x OK
endif
echo 2 3 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t1-even-stride1-2_3-1024_1024_1024_1024_2_1-test_sine_f.x.log
aprun -n 6 test_sine_f.x > /lustre/scratch/djchen/logs/t1-even-stride1-2_3-1024_1024_1024_1024_2_1-test_sine_f.x.log
if($? > 0) then
echo t1-even-stride1-2_3-1024_1024_1024_1024_2_1-test_sine_f.x ERROR
else
echo t1-even-stride1-2_3-1024_1024_1024_1024_2_1-test_sine_f.x OK
endif
echo 2 2 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t1-even-stride1-2_2-1024_1024_1024_1024_2_1-test_sine_f.x.log
aprun -n 4 test_sine_f.x > /lustre/scratch/djchen/logs/t1-even-stride1-2_2-1024_1024_1024_1024_2_1-test_sine_f.x.log
if($? > 0) then
echo t1-even-stride1-2_2-1024_1024_1024_1024_2_1-test_sine_f.x ERROR
else
echo t1-even-stride1-2_2-1024_1024_1024_1024_2_1-test_sine_f.x OK
endif
echo 1 4 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t1-even-stride1-1_4-1024_1024_1024_1024_2_1-test_sine_f.x.log
aprun -n 4 test_sine_f.x > /lustre/scratch/djchen/logs/t1-even-stride1-1_4-1024_1024_1024_1024_2_1-test_sine_f.x.log
if($? > 0) then
echo t1-even-stride1-1_4-1024_1024_1024_1024_2_1-test_sine_f.x ERROR
else
echo t1-even-stride1-1_4-1024_1024_1024_1024_2_1-test_sine_f.x OK
endif
echo 4 1 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t1-even-stride1-4_1-1024_1024_1024_1024_2_1-test_sine_f.x.log
aprun -n 4 test_sine_f.x > /lustre/scratch/djchen/logs/t1-even-stride1-4_1-1024_1024_1024_1024_2_1-test_sine_f.x.log
if($? > 0) then
echo t1-even-stride1-4_1-1024_1024_1024_1024_2_1-test_sine_f.x ERROR
else
echo t1-even-stride1-4_1-1024_1024_1024_1024_2_1-test_sine_f.x OK
endif
echo 1 1 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t1-even-stride1-1_1-1024_1024_1024_1024_2_1-test_sine_f.x.log
aprun -n 1 test_sine_f.x > /lustre/scratch/djchen/logs/t1-even-stride1-1_1-1024_1024_1024_1024_2_1-test_sine_f.x.log
if($? > 0) then
echo t1-even-stride1-1_1-1024_1024_1024_1024_2_1-test_sine_f.x ERROR
else
echo t1-even-stride1-1_1-1024_1024_1024_1024_2_1-test_sine_f.x OK
endif
echo 3 2 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t1-even-stride1-3_2-1024_1024_1024_1024_2_1-test_sine_inplace_c.x.log
aprun -n 6 test_sine_inplace_c.x > /lustre/scratch/djchen/logs/t1-even-stride1-3_2-1024_1024_1024_1024_2_1-test_sine_inplace_c.x.log
if($? > 0) then
echo t1-even-stride1-3_2-1024_1024_1024_1024_2_1-test_sine_inplace_c.x ERROR
else
echo t1-even-stride1-3_2-1024_1024_1024_1024_2_1-test_sine_inplace_c.x OK
endif
echo 2 3 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t1-even-stride1-2_3-1024_1024_1024_1024_2_1-test_sine_inplace_c.x.log
aprun -n 6 test_sine_inplace_c.x > /lustre/scratch/djchen/logs/t1-even-stride1-2_3-1024_1024_1024_1024_2_1-test_sine_inplace_c.x.log
if($? > 0) then
echo t1-even-stride1-2_3-1024_1024_1024_1024_2_1-test_sine_inplace_c.x ERROR
else
echo t1-even-stride1-2_3-1024_1024_1024_1024_2_1-test_sine_inplace_c.x OK
endif
echo 2 2 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t1-even-stride1-2_2-1024_1024_1024_1024_2_1-test_sine_inplace_c.x.log
aprun -n 4 test_sine_inplace_c.x > /lustre/scratch/djchen/logs/t1-even-stride1-2_2-1024_1024_1024_1024_2_1-test_sine_inplace_c.x.log
if($? > 0) then
echo t1-even-stride1-2_2-1024_1024_1024_1024_2_1-test_sine_inplace_c.x ERROR
else
echo t1-even-stride1-2_2-1024_1024_1024_1024_2_1-test_sine_inplace_c.x OK
endif
echo 1 4 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t1-even-stride1-1_4-1024_1024_1024_1024_2_1-test_sine_inplace_c.x.log
aprun -n 4 test_sine_inplace_c.x > /lustre/scratch/djchen/logs/t1-even-stride1-1_4-1024_1024_1024_1024_2_1-test_sine_inplace_c.x.log
if($? > 0) then
echo t1-even-stride1-1_4-1024_1024_1024_1024_2_1-test_sine_inplace_c.x ERROR
else
echo t1-even-stride1-1_4-1024_1024_1024_1024_2_1-test_sine_inplace_c.x OK
endif
echo 4 1 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t1-even-stride1-4_1-1024_1024_1024_1024_2_1-test_sine_inplace_c.x.log
aprun -n 4 test_sine_inplace_c.x > /lustre/scratch/djchen/logs/t1-even-stride1-4_1-1024_1024_1024_1024_2_1-test_sine_inplace_c.x.log
if($? > 0) then
echo t1-even-stride1-4_1-1024_1024_1024_1024_2_1-test_sine_inplace_c.x ERROR
else
echo t1-even-stride1-4_1-1024_1024_1024_1024_2_1-test_sine_inplace_c.x OK
endif
echo 1 1 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t1-even-stride1-1_1-1024_1024_1024_1024_2_1-test_sine_inplace_c.x.log
aprun -n 1 test_sine_inplace_c.x > /lustre/scratch/djchen/logs/t1-even-stride1-1_1-1024_1024_1024_1024_2_1-test_sine_inplace_c.x.log
if($? > 0) then
echo t1-even-stride1-1_1-1024_1024_1024_1024_2_1-test_sine_inplace_c.x ERROR
else
echo t1-even-stride1-1_1-1024_1024_1024_1024_2_1-test_sine_inplace_c.x OK
endif
echo 3 2 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t1-even-stride1-3_2-1024_1024_1024_1024_2_1-test_sine_inplace_f.x.log
aprun -n 6 test_sine_inplace_f.x > /lustre/scratch/djchen/logs/t1-even-stride1-3_2-1024_1024_1024_1024_2_1-test_sine_inplace_f.x.log
if($? > 0) then
echo t1-even-stride1-3_2-1024_1024_1024_1024_2_1-test_sine_inplace_f.x ERROR
else
echo t1-even-stride1-3_2-1024_1024_1024_1024_2_1-test_sine_inplace_f.x OK
endif
echo 2 3 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t1-even-stride1-2_3-1024_1024_1024_1024_2_1-test_sine_inplace_f.x.log
aprun -n 6 test_sine_inplace_f.x > /lustre/scratch/djchen/logs/t1-even-stride1-2_3-1024_1024_1024_1024_2_1-test_sine_inplace_f.x.log
if($? > 0) then
echo t1-even-stride1-2_3-1024_1024_1024_1024_2_1-test_sine_inplace_f.x ERROR
else
echo t1-even-stride1-2_3-1024_1024_1024_1024_2_1-test_sine_inplace_f.x OK
endif
echo 2 2 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t1-even-stride1-2_2-1024_1024_1024_1024_2_1-test_sine_inplace_f.x.log
aprun -n 4 test_sine_inplace_f.x > /lustre/scratch/djchen/logs/t1-even-stride1-2_2-1024_1024_1024_1024_2_1-test_sine_inplace_f.x.log
if($? > 0) then
echo t1-even-stride1-2_2-1024_1024_1024_1024_2_1-test_sine_inplace_f.x ERROR
else
echo t1-even-stride1-2_2-1024_1024_1024_1024_2_1-test_sine_inplace_f.x OK
endif
echo 1 4 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t1-even-stride1-1_4-1024_1024_1024_1024_2_1-test_sine_inplace_f.x.log
aprun -n 4 test_sine_inplace_f.x > /lustre/scratch/djchen/logs/t1-even-stride1-1_4-1024_1024_1024_1024_2_1-test_sine_inplace_f.x.log
if($? > 0) then
echo t1-even-stride1-1_4-1024_1024_1024_1024_2_1-test_sine_inplace_f.x ERROR
else
echo t1-even-stride1-1_4-1024_1024_1024_1024_2_1-test_sine_inplace_f.x OK
endif
echo 4 1 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t1-even-stride1-4_1-1024_1024_1024_1024_2_1-test_sine_inplace_f.x.log
aprun -n 4 test_sine_inplace_f.x > /lustre/scratch/djchen/logs/t1-even-stride1-4_1-1024_1024_1024_1024_2_1-test_sine_inplace_f.x.log
if($? > 0) then
echo t1-even-stride1-4_1-1024_1024_1024_1024_2_1-test_sine_inplace_f.x ERROR
else
echo t1-even-stride1-4_1-1024_1024_1024_1024_2_1-test_sine_inplace_f.x OK
endif
echo 1 1 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t1-even-stride1-1_1-1024_1024_1024_1024_2_1-test_sine_inplace_f.x.log
aprun -n 1 test_sine_inplace_f.x > /lustre/scratch/djchen/logs/t1-even-stride1-1_1-1024_1024_1024_1024_2_1-test_sine_inplace_f.x.log
if($? > 0) then
echo t1-even-stride1-1_1-1024_1024_1024_1024_2_1-test_sine_inplace_f.x ERROR
else
echo t1-even-stride1-1_1-1024_1024_1024_1024_2_1-test_sine_inplace_f.x OK
endif
echo 3 2 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t1-even-stride1-3_2-1024_1024_1024_1024_2_1-test_spec_c.x.log
aprun -n 6 test_spec_c.x > /lustre/scratch/djchen/logs/t1-even-stride1-3_2-1024_1024_1024_1024_2_1-test_spec_c.x.log
if($? > 0) then
echo t1-even-stride1-3_2-1024_1024_1024_1024_2_1-test_spec_c.x ERROR
else
echo t1-even-stride1-3_2-1024_1024_1024_1024_2_1-test_spec_c.x OK
endif
echo 2 3 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t1-even-stride1-2_3-1024_1024_1024_1024_2_1-test_spec_c.x.log
aprun -n 6 test_spec_c.x > /lustre/scratch/djchen/logs/t1-even-stride1-2_3-1024_1024_1024_1024_2_1-test_spec_c.x.log
if($? > 0) then
echo t1-even-stride1-2_3-1024_1024_1024_1024_2_1-test_spec_c.x ERROR
else
echo t1-even-stride1-2_3-1024_1024_1024_1024_2_1-test_spec_c.x OK
endif
echo 2 2 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t1-even-stride1-2_2-1024_1024_1024_1024_2_1-test_spec_c.x.log
aprun -n 4 test_spec_c.x > /lustre/scratch/djchen/logs/t1-even-stride1-2_2-1024_1024_1024_1024_2_1-test_spec_c.x.log
if($? > 0) then
echo t1-even-stride1-2_2-1024_1024_1024_1024_2_1-test_spec_c.x ERROR
else
echo t1-even-stride1-2_2-1024_1024_1024_1024_2_1-test_spec_c.x OK
endif
echo 1 4 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t1-even-stride1-1_4-1024_1024_1024_1024_2_1-test_spec_c.x.log
aprun -n 4 test_spec_c.x > /lustre/scratch/djchen/logs/t1-even-stride1-1_4-1024_1024_1024_1024_2_1-test_spec_c.x.log
if($? > 0) then
echo t1-even-stride1-1_4-1024_1024_1024_1024_2_1-test_spec_c.x ERROR
else
echo t1-even-stride1-1_4-1024_1024_1024_1024_2_1-test_spec_c.x OK
endif
echo 4 1 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t1-even-stride1-4_1-1024_1024_1024_1024_2_1-test_spec_c.x.log
aprun -n 4 test_spec_c.x > /lustre/scratch/djchen/logs/t1-even-stride1-4_1-1024_1024_1024_1024_2_1-test_spec_c.x.log
if($? > 0) then
echo t1-even-stride1-4_1-1024_1024_1024_1024_2_1-test_spec_c.x ERROR
else
echo t1-even-stride1-4_1-1024_1024_1024_1024_2_1-test_spec_c.x OK
endif
echo 1 1 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t1-even-stride1-1_1-1024_1024_1024_1024_2_1-test_spec_c.x.log
aprun -n 1 test_spec_c.x > /lustre/scratch/djchen/logs/t1-even-stride1-1_1-1024_1024_1024_1024_2_1-test_spec_c.x.log
if($? > 0) then
echo t1-even-stride1-1_1-1024_1024_1024_1024_2_1-test_spec_c.x ERROR
else
echo t1-even-stride1-1_1-1024_1024_1024_1024_2_1-test_spec_c.x OK
endif
echo 3 2 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t1-even-stride1-3_2-1024_1024_1024_1024_2_1-test_spec_f.x.log
aprun -n 6 test_spec_f.x > /lustre/scratch/djchen/logs/t1-even-stride1-3_2-1024_1024_1024_1024_2_1-test_spec_f.x.log
if($? > 0) then
echo t1-even-stride1-3_2-1024_1024_1024_1024_2_1-test_spec_f.x ERROR
else
echo t1-even-stride1-3_2-1024_1024_1024_1024_2_1-test_spec_f.x OK
endif
echo 2 3 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t1-even-stride1-2_3-1024_1024_1024_1024_2_1-test_spec_f.x.log
aprun -n 6 test_spec_f.x > /lustre/scratch/djchen/logs/t1-even-stride1-2_3-1024_1024_1024_1024_2_1-test_spec_f.x.log
if($? > 0) then
echo t1-even-stride1-2_3-1024_1024_1024_1024_2_1-test_spec_f.x ERROR
else
echo t1-even-stride1-2_3-1024_1024_1024_1024_2_1-test_spec_f.x OK
endif
echo 2 2 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t1-even-stride1-2_2-1024_1024_1024_1024_2_1-test_spec_f.x.log
aprun -n 4 test_spec_f.x > /lustre/scratch/djchen/logs/t1-even-stride1-2_2-1024_1024_1024_1024_2_1-test_spec_f.x.log
if($? > 0) then
echo t1-even-stride1-2_2-1024_1024_1024_1024_2_1-test_spec_f.x ERROR
else
echo t1-even-stride1-2_2-1024_1024_1024_1024_2_1-test_spec_f.x OK
endif
echo 1 4 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t1-even-stride1-1_4-1024_1024_1024_1024_2_1-test_spec_f.x.log
aprun -n 4 test_spec_f.x > /lustre/scratch/djchen/logs/t1-even-stride1-1_4-1024_1024_1024_1024_2_1-test_spec_f.x.log
if($? > 0) then
echo t1-even-stride1-1_4-1024_1024_1024_1024_2_1-test_spec_f.x ERROR
else
echo t1-even-stride1-1_4-1024_1024_1024_1024_2_1-test_spec_f.x OK
endif
echo 4 1 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t1-even-stride1-4_1-1024_1024_1024_1024_2_1-test_spec_f.x.log
aprun -n 4 test_spec_f.x > /lustre/scratch/djchen/logs/t1-even-stride1-4_1-1024_1024_1024_1024_2_1-test_spec_f.x.log
if($? > 0) then
echo t1-even-stride1-4_1-1024_1024_1024_1024_2_1-test_spec_f.x ERROR
else
echo t1-even-stride1-4_1-1024_1024_1024_1024_2_1-test_spec_f.x OK
endif
echo 1 1 > dims
echo 1024 1024 1024 1024 2 1 > stdin
echo Running t1-even-stride1-1_1-1024_1024_1024_1024_2_1-test_spec_f.x.log
aprun -n 1 test_spec_f.x > /lustre/scratch/djchen/logs/t1-even-stride1-1_1-1024_1024_1024_1024_2_1-test_spec_f.x.log
if($? > 0) then
echo t1-even-stride1-1_1-1024_1024_1024_1024_2_1-test_spec_f.x ERROR
else
echo t1-even-stride1-1_1-1024_1024_1024_1024_2_1-test_spec_f.x OK
endif
echo ======================================================
echo Tests Completed
echo ======================================================
