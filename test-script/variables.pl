#!/usr/bin/perl -w
#
#	Test Script for P3DFFT
#
#


# test path can be the name of a folder relative 
# to the directory this file is in or it can be
# a full path
# NO TRAILING SLASH!
$TEST_PATH = "p3dfft-test";

# total tests
$total_tests = 2;

# dims X Y #  X*Y must equal $NUM_PROC
$DIMS = "2 2";
# number of processors (cores) to use
$NUM_PROC = "4";
# email address
$EMAIL = "djchen@ucsd.edu";
# queue type
$QUEUE = "small";
# number of nodes
$NODES = "1";
# processors per node
$PROCS_NODE = "4";
# walltime
$WALLTIME = "0:05:00";
# job name
$JOB_NAME = "p3dfft-test";
# path where the job will run from 
# NO TRAILING SLASH!
$JOB_PATH = "/mirage/djchen/p3dfft-test";

# double precision (default)
@CONFIGURE = ('./configure --enable-pgi --enable-fftw --with-fftw="$FFTWHOME" FCFLAGS="-fastsse -tp barcelona-64 -Mextend -byteswapio" CFLAGS="-fastsse -tp barcelona-64" LDFLAGS="-lmpi_f90 -lmpi_f77 -lmyriexpress"',
'./configure --enable-pgi --enable-single --enable-fftw --with-fftw=/home/djchen/build/fftw/ FCFLAGS="-fastsse -tp barcelona-64 -Mextend -byteswapio" CFLAGS="-fastsse -tp 
barcelona-64" LDFLAGS="-lmpi_f90 -lmpi_f77 -lmyriexpress"');
