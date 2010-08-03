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
# set to 0 to run all
$total_tests = 0;

# email address
$EMAIL = 'djchen@ucsd.edu';
# queue type
$QUEUE = "small";
# number of nodes
$NODES = "1";
# processors per node
$PROCS_NODE = "6";
# walltime
$WALLTIME = "0:10:00";
# job name
$JOB_NAME = "p3dfft-test";
# path where the job will run from 
# NO TRAILING SLASH!
$JOB_PATH = "/mirage/djchen/p3dfft-test";
# path where the job logs will be stored
# NO TRAILING SLASH!
$OUTPUT_PATH = "/mirage/djchen/logs";

# using PGI, FFTW
# double precision, single precision
@CONFIGURE = (
'./configure --enable-pgi --enable-fftw --with-fftw="/home/djchen/build/fftw/" FCFLAGS="-fastsse -tp barcelona-64 -Mextend -Mpreprocess -byteswapio" CFLAGS="-fastsse -tp barcelona-64" LDFLAGS="-lmpi_f90 -lmpi_f77 -lmyriexpress"',
'./configure --enable-pgi --enable-single --enable-fftw --with-fftw="/home/djchen/build/fftw/" FCFLAGS="-fastsse -tp barcelona-64 -Mextend -Mpreprocess -byteswapio" CFLAGS="-fastsse -tp barcelona-64" LDFLAGS="-lmpi_f90 -lmpi_f77 -lmyriexpress"');

# using Intel, FFTW
#@CONFIGURE = (
#'./configure --enable-intel --enable-fftw --with-fftw="$FFTWHOME" FCFLAGS="-O3 -xW -132 -fpp" CFLAGS="-O3 -xW" LDFLAGS="-lmpi_f90 -lmpi_f77 -lmyriexpress -limf"',
#'./configure --enable-intel --enable-single --enable-fftw --with-fftw="/home/djchen/build/fftw/" FCFLAGS="-O3 -xW -132 -fpp" CFLAGS="-O3 -xW" LDFLAGS="-lmpi_f90 -lmpi_f77 -lmyriexpress -limf"');

@CONFIGURE_OPTIONS = (['default',' '],['even','--enable-useeven'],['stride1','--enable-stride1'],['even-stride1','--enable-useeven --enable-stride1']);

@DIMS_OPTIONS = (['6','3 2'],['6','2 3'],['4','2 2'],['4','1 4'],['4','4 1'],['1','1 1']);

@STDIN_OPTIONS = ('128 128 128 2 1');


#'48 36 72 2 2','48 36 72 1 2','48 36 72 2 1','48 36 72 1 1');

