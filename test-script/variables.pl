#!/usr/bin/perl -w
#
#	Test Script for P3DFFT
#
#

# pre-exec actions
system("module load fftw");

# test path can be the name of a folder relative 
# to the directory this file is in or it can be
# a full path
# NO TRAILING SLASH!
$TEST_PATH = "p3dfft-test";

# dims X Y #  X*Y must equal $NUM_PROC
$DIMS = "2 2";
# number of processors (cores) to use
$NUM_PROC = "4";

# double precision (default)
$P3DFFT_CONFIGURE = './configure --enable-pgi --enable-fftw --with-fftw="$FFTWHOME" FCFLAGS="-fastsse -tp barcelona-64 -Mextend -byteswapio" CFLAGS="-fastsse -tp barcelona-64" LDFLAGS="-lmpi_f90 -lmpi_f77 -lmyriexpress"';
# single precision
$P3DFFT_CONFIGURE2 = './configure --enable-pgi --enable-single --enable-fftw --with-fftw=/home/djchen/build/fftw/ FCFLAGS="-fastsse -tp barcelona-64 -Mextend -byteswapio" CFLAGS="-fastsse -tp barcelona-64" LDFLAGS="-lmpi_f90 -lmpi_f77 -lmyriexpress"';
