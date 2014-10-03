! This file is part of P3DFFT library
!
!    P3DFFT
!
!    Software Framework for Scalable Fourier Transforms in Three Dimensions
!
!    Copyright (C) 2006-2010 Dmitry Pekurovsky
!    Copyright (C) 2006-2010 University of California
!    Copyright (C) 2010-2011 Jens Henrik Goebbert
!
!    This program is free software: you can redistribute it and/or modify
!    it under the terms of the GNU General Public License as published by
!    the Free Software Foundation, either version 3 of the License, or
!    (at your option) any later version.
!
!    This program is distributed in the hope that it will be useful,
!    but WITHOUT ANY WARRANTY; without even the implied warranty of
!    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
!    GNU General Public License for more details.
!
!    You should have received a copy of the GNU General Public License
!    along with this program.  If not, see <http://www.gnu.org/licenses/>.
!
!
!----------------------------------------------------------------------------

! This file contains routines intended for initializing 1D FFT oprations
! as well as one-time initialization and clean-up

! Initialize backward complex-to-complex FFT 

      subroutine plan_b_c1(X,stride_x1,stride_x2,Y,stride_y1, &
          stride_y2,N,m)

      use p3dfft
      use fft_spec
      implicit none

      integer stride_x1,stride_x2,stride_y1,stride_y2,N,m,fflag
      complex(mytype) X(N*m),Y(N*m)

      return
      end

      subroutine plan_b_c2_same(X,stride_x1,stride_x2,Y,stride_y1, &
          stride_y2,N,m)

      use p3dfft
      use fft_spec
      implicit none

      integer stride_x1,stride_x2,stride_y1,stride_y2,N,m,fflag
      complex(mytype) X(N*m),Y(N*m)

      return
      end

      subroutine plan_b_c2_dif(X,stride_x1,stride_x2,Y,stride_y1, &
          stride_y2,N,m)

      use p3dfft
      use fft_spec
      implicit none

      integer stride_x1,stride_x2,stride_y1,stride_y2,N,m,fflag
      complex(mytype) X(N*m),Y(N*m)

      return
      end



      subroutine init_b(X,stride_x1,stride_x2,Y,stride_y1, &
          stride_y2,N,m,op)

      use p3dfft
      use mpi
      use fft_spec
      implicit none

      integer stride_x1,stride_x2,stride_y1,stride_y2,N,m,fflag
      real(mytype) X(N*m),Y(N*m)
      character op

      integer mythread, OMP_GET_THREAD_NUM,nm2,ierr,errorcode
      mythread = OMP_GET_THREAD_NUM()

      nm2 = (N-1) * 2

	if(op == 't' .or. op == 'f') then
            call dcft(1,X,stride_x1,stride_x2,Y,stride_y1,stride_y2,N,m,& 
              -1,1.0d0, caux1(1,mythread),cnaux,caux2(1,mythread),cnaux)
	else if(op == 'c') then	
            call dcosf (1, X, stride_x1, stride_x2, &
                 Y, stride_y1, stride_y2, nm2, m, 2.0d0, &
		 caux1(1,mythread), cnaux, caux2(1,mythread), cnaux)
	else if(op == 's') then	
            call dsinf (1, X, stride_x1, stride_x2, &
                 Y, stride_y1, stride_y2, nm2, m, 2.0d0, &
                 caux1(1,mythread), cnaux, caux2(1,mythread), cnaux)
 	else
	   print *,taskid,'Unknown transform type: ',op
	   call MPI_abort(MPI_COMM_WORLD,errorcode,ierr)
	endif
      return
      end


!!--------------------------------------------------------------
! Initialize backward complex-to-real FFT 

      subroutine plan_b_c2r(X,dimx,Y,dimy,N,m)

      use p3dfft
      use fft_spec
      implicit none

      integer dimx,dimy,N,m,fflag
      complex(mytype) X((N/2+1)*m)
      real(mytype) Y(N*m)


      return
      end

      subroutine init_b_c2r(X,dimx,Y,dimy,N,m)

      use p3dfft
      use fft_spec
      implicit none

      integer dimx,dimy,N,m,fflag
      complex(mytype) X((N/2+1)*m)
      real(mytype) Y(N*m)


      integer mythread, OMP_GET_THREAD_NUM
      mythread = OMP_GET_THREAD_NUM()

      call dcrft(1,X,dimx,Y,dimy,N,m,-1,1.0d0, &
            raux1(1,mythread), rnaux1,raux2(1,mythread),rnaux2,raux3,1)  

      return
      end

!!--------------------------------------------------------------
! Initialize forward complex-to-complex FFT 

      subroutine plan_f_c1(X,stride_x1,stride_x2,Y,stride_y1,stride_y2,N,m) 
      
      use p3dfft
      use fft_spec
      implicit none

      integer N,m,stride_x1,stride_x2,stride_y1,stride_y2,fflag
      complex(mytype) X(N*m),Y(N*m)

      return
      end


      subroutine plan_f_c2_same(X,stride_x1,stride_x2,Y,stride_y1,stride_y2,N,m) 
      
      use p3dfft
      use fft_spec
      implicit none

      integer N,m,stride_x1,stride_x2,stride_y1,stride_y2,fflag
      complex(mytype) X(N*m),Y(N*m)

      return
      end

      subroutine plan_f_c2_dif(X,stride_x1,stride_x2,Y,stride_y1,stride_y2,N,m) 
      
      use p3dfft
      use fft_spec
      implicit none

      integer N,m,stride_x1,stride_x2,stride_y1,stride_y2,fflag
      complex(mytype) X(N*m),Y(N*m)

      return
      end


      subroutine init_f(X,stride_x1,stride_x2,Y,stride_y1,stride_y2,N,m,op) 
      
      use p3dfft
      use mpi
      use fft_spec
      implicit none

      integer N,m,stride_x1,stride_x2,stride_y1,stride_y2,fflag
      complex(mytype) X(N*m),Y(N*m)
      character op

      integer mythread, OMP_GET_THREAD_NUM,nm2,ierr,errorcode
      mythread = OMP_GET_THREAD_NUM()

      nm2 = (N-1) * 2

	if(op == 't' .or. op == 'f') then
            call dcft(1,X,stride_x1,stride_x2,Y,stride_y1,stride_y2,N,m,1,1.0d0, &
                 caux1(1,mythread),cnaux,caux2(1,mythread),cnaux)
	else if(op == 'c') then	
            call dcosf (1, X, stride_x1, stride_x2, &
                 Y, stride_y1, stride_y2, nm2, m, 2.0d0, &
		 caux1(1,mythread), cnaux, caux2(1,mythread), cnaux)
	else if(op == 's') then	
            call dsinf (1, X, stride_x1, stride_x2, &
                 Y, stride_y1, stride_y2, nm2, m, 2.0d0, &
                 caux1(1,mythread), cnaux, caux2(1,mythread), cnaux)
 	else
	   print *,taskid,'Unknown transform type: ',op
	   call MPI_abort(MPI_COMM_WORLD,errorcode,ierr)
	endif

      return
      end


!!--------------------------------------------------------------
! Initialize forward real-to-complex FFT 

      subroutine plan_f_r2c(X,dimx,Y,dimy,N,m)

      use p3dfft
      use fft_spec

      integer dimx,dimy,N,m,fflag
      real(mytype) X(N*m)
      complex(mytype) Y((N/2+1)*m)


      return
      end

      subroutine init_f_r2c(X,dimx,Y,dimy,N,m)

      use p3dfft
      use fft_spec

      integer dimx,dimy,N,m,fflag
      real(mytype) X(N*m)
      complex(mytype) Y((N/2+1)*m)

      integer mythread, OMP_GET_THREAD_NUM
      mythread = OMP_GET_THREAD_NUM()

      call drcft(1,X,dimx,Y,dimy,N,m,1,1.0d0, &
            raux1(1,mythread), rnaux1,raux2(1,mythread),rnaux2,raux3,1)           


      return
      end

!!--------------------------------------------------------------
! One-time initialization
! Initialize work arrays for 1

      subroutine init_work(nx,ny,nz)
      
      use fft_spec
      use p3dfft
      integer nx,ny,nz,err


      integer nyz
      nyz = max(ny,nz)
      if(nyz .le. 2048) then
         cnaux = 20000
      else 
         cnaux = 20000+2.28*nyz
      endif
      if(nyz .ge. 252) then
         cnaux = cnaux+(2*nyz+256)*64
      endif
      if(nx .le. 4096) then
         rnaux1 = 22000
         rnaux2 = 20000
      else
         rnaux1 = 20000+1.64*nx
         rnaux2=20000+1.14*nx
      endif

	print *,'Allocating aux arrays; nthreads=',nthreads
      allocate(caux1(cnaux,nthreads),stat=err)
      if(err .ne. 0) then
         print *,'Error allocating caux1'
      endif
      allocate(caux2(cnaux,nthreads),stat=err)
      if(err .ne. 0) then
         print *,'Error allocating caux2'
      endif
      allocate(raux1(rnaux1,nthreads),stat=err)
      if(err .ne. 0) then
         print *,'Error allocating raux1'
      endif
      allocate(raux2(rnaux2,nthreads),stat=err)
      if(err .ne. 0) then
         print *,'Error allocating raux2'
      endif


      return
      end

!!--------------------------------------------------------------
! Clean-up routines for FFTW

      subroutine clean_x1

      use fft_spec
      
      return
      end

!!--------------------------------------------------------------

      subroutine clean_x2

      use fft_spec

      
      return
      end

!!--------------------------------------------------------------

      subroutine clean_x3

      
      return
      end

!!--------------------------------------------------------------
! Release work arrays for 1

      subroutine free_work
      
      use fft_spec

      deallocate(caux1)      
      deallocate(caux2)
      deallocate(raux1)
      deallocate(raux2)

      return
      end

! --------------------------------------
!
!  init_ctrans_r2(..)
!  cosinus transform
! --------------------------------------
subroutine init_ctrans_r2 (X, stride_x1, stride_x2, Y, stride_y1, stride_y2, N, m)
    use p3dfft
    use fft_spec
    implicit none
 
    integer :: N, m, stride_x1, stride_x2, stride_y1, stride_y2, fflag
    real (mytype) :: X (N*m), Y (N*m)
    integer :: nm2
 
    nm2 = (N-1) * 2
    call dcosf (1, X, stride_x1, stride_x2, &
                   Y, stride_y1, stride_y2, &
                   nm2, m, 2.0d0, caux1, cnaux, caux2, cnaux)
 
 
    return
end


! --------------------------------------
!
!  plan_ctrans_r2(..)
!
! --------------------------------------
subroutine plan_ctrans_r2_same (X, stride_x1, stride_x2, Y, stride_y1, stride_y2, N, m)
    use p3dfft
    use fft_spec
    implicit none
 
    integer :: stride_x1, stride_x2, stride_y1, stride_y2, N, m
    real (mytype) :: X (N*m), Y (N*m)
 
    return
end

subroutine plan_ctrans_r2_dif (X, stride_x1, stride_x2, Y, stride_y1, stride_y2, N, m)
    use p3dfft
    use fft_spec
    implicit none
 
    integer :: stride_x1, stride_x2, stride_y1, stride_y2, N, m
    real (mytype) :: X (N*m), Y (N*m)
 
    return
end

! --------------------------------------
!
!  init_strans_r2(..)
!  sinus transform
! --------------------------------------
subroutine init_strans_r2 (X, stride_x1, stride_x2, Y, stride_y1, stride_y2, N, m)
    use p3dfft
    use fft_spec
    implicit none
 
    integer :: N, m, stride_x1, stride_x2, stride_y1, stride_y2, fflag
    real (mytype) :: X (N*m), Y (N*m)
    integer :: nm2
 
    nm2 = (N-1) * 2
    call dsinf (1, X, stride_x1, stride_x2, &
                   Y, stride_y1, stride_y2, &
                   nm2, m, 2.0d0, caux1, cnaux, caux2, cnaux)
 
 
    return
end

! --------------------------------------
!
!  plan_strans_r2(..)
!
! --------------------------------------
subroutine plan_strans_r2_same (X, stride_x1, stride_x2, Y, stride_y1, stride_y2, N, m)
    use p3dfft
    use fft_spec
    implicit none
 
    integer :: stride_x1, stride_x2, stride_y1, stride_y2, N, m
    real (mytype) :: X (N*m), Y (N*m)
 
    return
end

subroutine plan_strans_r2_dif (X, stride_x1, stride_x2, Y, stride_y1, stride_y2, N, m)
    use p3dfft
    use fft_spec
    implicit none
 
    integer :: stride_x1, stride_x2, stride_y1, stride_y2, N, m
    real (mytype) :: X (N*m), Y (N*m)
 
    return
end
