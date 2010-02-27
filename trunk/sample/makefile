SHELL=/bin/csh

include makeinc

export P3DFFT_ROOT = ../..
export P3DFFT_LIB = p3dfft
export P3DFFT_LOC = $(P3DFFT_ROOT)/lib
export P3DFFT_INC = $(P3DFFT_ROOT)/include

all:
	cd FORTRAN && make -f makefile.loc
	cd C && make -f makefile.loc
clean:
	cd FORTRAN && make clean -f makefile.loc
	cd C && make clean -f makefile.loc
