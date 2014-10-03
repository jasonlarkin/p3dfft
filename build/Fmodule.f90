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

      module p3dfft

      implicit none

      include 'mpif.h'

      private

! Set precision

       integer, parameter,public :: mytype=KIND(1.0d0)
       integer, parameter,public:: mpireal = MPI_DOUBLE_PRECISION
       integer,parameter,public:: mpicomplex = MPI_DOUBLE_COMPLEX

! global variables

      integer, parameter, public :: r8 = KIND(1.0d0)
      integer, parameter, public :: i8 = SELECTED_INT_KIND(18)
      integer, save,public :: padd,nthreads
      real(r8), save,public :: timers(12)
      real(r8), save :: timer(12)
       integer, public :: real_size,complex_size

      integer,save :: NX_fft,NY_fft,NZ_fft,nxh,nxhp,nv_preset
      integer,save :: nxc,nyc,nzc,nxhc,nxhpc,nyh,nzh,nyhc,nzhc,nyhcp,nzhcp	
      integer,save :: ipid,jpid,taskid,numtasks,iproc,jproc
      integer,save :: iistart,iiend,iisize,jjstart,jjsize,jjend
      integer,save ::jistart,kjstart,jisize,kjsize,jiend,kjend
    integer, save :: ijstart, ijsize, ijend, iiistart, iiisize, iiiend

    integer, save :: maxisize, maxjsize, maxksize,buf_size


! mpi process info
!
      logical :: mpi_set=.false.
      integer, save :: mpi_comm_cart,mpicomm      
      integer, save :: mpi_comm_row, mpi_comm_col
      integer,save, dimension(:), allocatable :: iist,iien,iisz
      integer,save, dimension(:), allocatable :: jist,jien,jisz
      integer,save, dimension(:), allocatable :: jjst,jjen,jjsz
      integer,save, dimension(:), allocatable :: kjst,kjen,kjsz
    integer, save, dimension (:), allocatable :: iiist, iiien, iiisz
    integer, save, dimension (:), allocatable :: ijst, ijen, ijsz

! mpi derived data types for implementing alltoallv using send-recvs
      integer,save,dimension(:),allocatable:: IfSndCnts,IfSndStrt
      integer,save,dimension(:),allocatable:: IfRcvCnts,IfRcvStrt
      integer,save,dimension(:),allocatable:: KfSndCnts,KfSndStrt
      integer,save,dimension(:),allocatable:: KfRcvCnts,KfRcvStrt
      integer,save,dimension(:),allocatable:: JrSndCnts,JrSndStrt
      integer,save,dimension(:),allocatable:: JrRcvCnts,JrRcvStrt
      integer,save,dimension(:),allocatable:: KrSndCnts,KrSndStrt
      integer,save,dimension(:),allocatable:: KrRcvCnts,KrRcvStrt
      integer,save,dimension(:,:),allocatable:: status
!      complex(mytype), save, allocatable :: buf(:),buf1(:),buf2(:)
      logical :: OW = .false.
      integer, save, dimension (:), allocatable :: IiCnts, IiStrt
      integer, save, dimension (:), allocatable :: IjCnts, IjStrt
      integer, save, dimension (:), allocatable :: JiCnts, JiStrt
      integer, save, dimension (:), allocatable :: KjCnts, KjStrt
 
    integer*8 :: nm

      integer CB,NBx,NBy1,NBy2,NBz
      integer, parameter :: NB1=4
      integer, parameter :: NB=1

! trans2proc support
    integer, save, dimension (:), allocatable :: proc_id2coords
    integer, save, dimension (:, :), allocatable :: proc_coords2id
    integer, save, dimension (:, :, :), allocatable :: proc_dims
    integer, save, dimension (:, :), allocatable :: proc_parts
 
    public :: p3dfft_get_dims, p3dfft_get_mpi_info, p3dfft_setup, &
		p3dfft_ftran_r2c, p3dfft_btran_c2r, p3dfft_cheby, &
      		p3dfft_ftran_r2c_many,  p3dfft_cheby_many, &
		p3dfft_btran_c2r_many, &
              p3dfft_clean, print_buf, taskid, &
              proc_id2coords, proc_coords2id, &
              proc_dims, proc_parts, get_proc_parts, &
              rtran_x2y, rtran_y2x, rtran_x2z, rtran_z2x, &
              p3dfft_ftran_r2c_1d

!-------------------
      contains
!-------------------

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

! =========================================================
      subroutine p3dfft_setup(dims,nx,ny,nz,mpi_comm_in,nxcut,nycut,nzcut,overwrite,memsize) 
!BIND(C,NAME='p3dfft_setup')
!========================================================

      use iso_c_binding
      implicit none

      integer i,j,k,nx,ny,nz,err,mpi_comm_in
      integer ierr, dims(2),  cartid(2)
      logical periodic(2),remain_dims(2)
      integer impid, ippid, jmpid, jppid,pad2
      integer(i8) n1,n2,pad1
      real(mytype), allocatable :: R(:)
      complex(mytype), allocatable :: buf1(:), buf2(:)
      integer, optional, intent (out) :: memsize (3)
      integer, optional, intent (in) :: nxcut,nycut,nzcut
      logical, optional, intent(in) :: overwrite
      integer omp_get_num_threads

      integer my_start (3), my_end (3), my_size (3)
      integer my_proc_dims (2, 9)

      if(nx .le. 0 .or. ny .le. 0 .or. nz .le. 0) then
         print *,'Invalid dimensions :',nx,ny,nz
         call MPI_ABORT(MPI_COMM_WORLD, 0)
      endif

      if(mpi_set) then
         print *,'P3DFFT Setup error: the problem is already initialized. '
         print *,'Currently multiple setups not supported.'       
         print *,'Quit the library using p3dfft_clean before initializing another setup'
         call MPI_ABORT(MPI_COMM_WORLD, 0)
      endif

      if(present(overwrite)) then
         OW = overwrite	     
      else
         OW = .true.
      endif
      

      timers = 0.0

      mpi_set = .true.
      mpicomm = mpi_comm_in
      nx_fft = nx
      ny_fft = ny
      nz_fft = nz
      if(present(nxcut)) then
	nxc = nxcut
      else
        nxc = nx
      endif	
      if(present(nycut)) then
	nyc = nycut
      else
        nyc = ny
      endif	
      if(present(nzcut)) then
	nzc = nzcut
      else
        nzc = nz
      endif	

      nxh=nx/2
      nxhp=nxh+1
	nxhc = nxc/2
	nxhpc = nxhc + 1
	nyh = ny/2
	nzh = nz/2
	nyhc = nyc / 2
	nzhc = nzc / 2
	nyhcp = nyhc + 1
	nzhcp = nzhc + 1

      call MPI_COMM_SIZE (mpicomm,numtasks,ierr)
      call MPI_COMM_RANK (mpicomm,taskid,ierr)

      if(dims(1) .le. 0 .or. dims(2) .le. 0 .or.  dims(1)*dims(2) .ne. numtasks) then
         print *,'Invalid processor geometry: ',dims,' for ',numtasks, 'tasks'
         call MPI_ABORT(MPI_COMM_WORLD, 0)
      endif

      if(taskid .eq. 0) then 
         print *,'Using stride-1 layout'
      endif

      nthreads=1	
!$OMP PARALLEL shared(nthreads)
!$OMP MASTER
      nthreads = OMP_GET_NUM_THREADS()		
!$OMP END MASTER
!$OMP END PARALLEL

      if(taskid .eq. 0) then
         print *,'Using ',nthreads,' threads'
      endif 

      iproc = dims(1)
      jproc = dims(2)

       i = dims(1)  
       dims(1) = dims(2)
       dims(2) = i

      periodic(1) = .false.
      periodic(2) = .false.
! creating cartesian processor grid
      call MPI_Cart_create(mpicomm,2,dims,periodic,.false.,mpi_comm_cart,ierr)
! Obtaining process ids with in the cartesian grid
      call MPI_Cart_coords(mpi_comm_cart,taskid,2,cartid,ierr)
! process with a linear id of 5 may have cartid of (3,1)

      ipid = cartid(2)
      jpid = cartid(1)

! store processor-grid-informations
    cartid (1) = ipid
    cartid (2) = jpid
    allocate (proc_id2coords(0:(iproc*jproc)*2-1))
    call MPI_Allgather (cartid, 2, MPI_INTEGER, proc_id2coords, 2, MPI_INTEGER, mpi_comm_cart, ierr)
    allocate (proc_coords2id(0:iproc-1, 0:jproc-1))
    do i = 0, (iproc*jproc) - 1
      proc_coords2id (proc_id2coords(2*i), &
                      proc_id2coords(2*i+1)) = i
    end do

! here i is east-west j is north-south
! impid is west neighbour ippid is east neighbour and so on
      impid = ipid - 1
      ippid = ipid + 1
      jmpid = jpid - 1
      jppid = jpid + 1
!boundary processes
      if (ipid.eq.0) impid = MPI_PROC_NULL
      if (jpid.eq.0) jmpid = MPI_PROC_NULL
      if (ipid.eq.iproc-1) ippid = MPI_PROC_NULL
      if (jpid.eq.jproc-1) jppid = MPI_PROC_NULL
! using cart comworld create east-west(row) sub comworld

      remain_dims(1) = .true.
      remain_dims(2) = .false.
      call MPI_Cart_sub(mpi_comm_cart,remain_dims,mpi_comm_col,ierr)
! using cart comworld create north-south(column) sub comworld
      remain_dims(1) = .false.
      remain_dims(2) = .true.
      call MPI_Cart_sub(mpi_comm_cart,remain_dims,mpi_comm_row,ierr)

      allocate (iist(0:iproc-1))
      allocate (iisz(0:iproc-1))
      allocate (iien(0:iproc-1))
      allocate (jjst(0:jproc-1))
      allocate (jjsz(0:jproc-1))
      allocate (jjen(0:jproc-1))
      allocate (jist(0:iproc-1))
      allocate (jisz(0:iproc-1))
      allocate (jien(0:iproc-1))
      allocate (kjst(0:jproc-1))
      allocate (kjsz(0:jproc-1))
      allocate (kjen(0:jproc-1))
!
!Mapping 3-D data arrays onto 2-D process grid
! (nx+2,ny,nz) => (iproc,jproc)      
! 
      call MapDataToProc(nxhpc,iproc,iist,iien,iisz)
      call MapDataToProc(ny,iproc,jist,jien,jisz)
      call MapDataToProc(nyc,jproc,jjst,jjen,jjsz)
      call MapDataToProc(nz,jproc,kjst,kjen,kjsz)

! These are local array indices for each processor

      iistart = iist(ipid)
      jjstart = jjst(jpid)
      jistart = jist(ipid)
      kjstart = kjst(jpid)
      iisize= iisz(ipid)
      jjsize= jjsz(jpid)
      jisize= jisz(ipid)
      kjsize= kjsz(jpid)
      iiend = iien(ipid)
      jjend = jjen(jpid)
      jiend = jien(ipid)
      kjend = kjen(jpid)

    allocate (iiist(0:iproc-1))
    allocate (iiisz(0:iproc-1))
    allocate (iiien(0:iproc-1))
    allocate (ijst(0:jproc-1))
    allocate (ijsz(0:jproc-1))
    allocate (ijen(0:jproc-1))
    call MapDataToProc (nx, iproc, iiist, iiien, iiisz)
    call MapDataToProc (nx, jproc, ijst, ijen, ijsz)
    iiistart = iiist (ipid)
    iiisize = iiisz (ipid)
    iiiend = iiien (ipid)
    ijstart = ijst (jpid)
    ijsize = ijsz (jpid)
    ijend = ijen (jpid)



      CB = 32768

      NBx=CB/(4*mytype*Ny)

      NBy1 = CB/(4*mytype*iisize)

      NBy2 = CB/(4*mytype*Nz)

      NBz = (CB/Nx)*(numtasks/(2*mytype*Ny))

      if(NBx .eq. 0) then
         NBx = 1
      endif
      if(NBy1 .eq. 0) then
         NBy1 = 1
      endif
      if(NBy2 .eq. 0) then
         NBy2 = 1
      endif
      if(NBz .eq. 0) then
         NBz = 1
      endif
      
      if(taskid .eq. 0) then
         print *,'Using loop block sizes ',NBx,NBy1,NBy2,NBz
      endif  



! We may need to pad arrays due to uneven size
      padd = max(iisize*jjsize*nz_fft,iisize*ny_fft*kjsize) - nxhp*jisize*kjsize
      if(padd .le. 0) then 
         padd=0
      else
         if(mod(padd,nxhp*jisize) .eq. 0) then
            padd = padd / (nxhp*jisize)
         else
            padd = padd / (nxhp*jisize)+1
         endif

      endif

!      print *,taskid,': padd=',padd
! Initialize FFTW and allocate buffers for communication
      nm = nxhp * jisize * (kjsize+padd) 
      nv_preset = 1


      call init_work(nx,ny,nz)



       buf_size = nm

!      n1 = IfCntMax * iproc /(mytype*2)
!      n2 = KfCntMax * jproc / (mytype*2)
!      n1 = max(n1,n2)
!      if(n1 .gt. nm) then
!         deallocate(buf1)
!         allocate(buf1(n1))
!         deallocate(buf2)
!         allocate(buf2(n1))
!      endif

!#ifdef USE_EVEN
!       
!     n1 = IfCntMax * iproc / (mytype*2)
!     n2 = KfCntMax * jproc / (mytype*2)
!     allocate(buf_x(n1))
!     allocate(buf_z(n2))
!     n1 = max(n1,n2)
!     allocate(buf_y(n1))
!#else
!     allocate(buf_x(nxhp*jisize*kjsize))
!     allocate(buf_y(ny*iisize*kjsize))
!     allocate(buf_z(nz*iisize*jjsize))
!#endif

! Displacements and buffer counts for mpi_alltoallv

      allocate (IfSndStrt(0:iproc-1))
      allocate (IfSndCnts(0:iproc-1))     
      allocate (IfRcvStrt(0:iproc-1))
      allocate (IfRcvCnts(0:iproc-1))

      allocate (KfSndStrt(0:jproc-1))
      allocate (KfSndCnts(0:jproc-1))     
      allocate (KfRcvStrt(0:jproc-1))
      allocate (KfRcvCnts(0:jproc-1))

      allocate (JrSndStrt(0:jproc-1))
      allocate (JrSndCnts(0:jproc-1))     
      allocate (JrRcvStrt(0:jproc-1))
      allocate (JrRcvCnts(0:jproc-1))

      allocate (KrSndStrt(0:iproc-1))
      allocate (KrSndCnts(0:iproc-1))     
      allocate (KrRcvStrt(0:iproc-1))
      allocate (KrRcvCnts(0:iproc-1))


!   start pointers and types of send  for the 1st forward transpose
      do i=0,iproc-1
         IfSndStrt(i) = (iist(i) -1)* jisize*kjsize*mytype*2
         IfSndCnts(i) = iisz(i) * jisize*kjsize*mytype*2

!   start pointers and types of recv for the 1st forward transpose
         IfRcvStrt(i) = (jist(i) -1) * iisize*kjsize*mytype*2
         IfRcvCnts(i) = jisz(i) * iisize*kjsize*mytype*2
      end do

!   start pointers and types of send  for the 2nd forward transpose
      do i=0,jproc-1
         KfSndStrt(i) = (jjst(i) -1)*iisize*kjsize*mytype*2
         KfSndCnts(i) = iisize*kjsize*jjsz(i)*mytype*2

!   start pointers and types of recv for the 2nd forward transpose
         KfRcvStrt(i) = (kjst(i) -1) * iisize * jjsize*mytype*2
         KfRcvCnts(i) = iisize*jjsize*kjsz(i)*mytype*2
      end do

    if(taskid .eq. 0) then
       print *,'KfRcv Cnts and Strt:', kfrcvcnts,kfrcvstrt
    endif


!   start pointers and types of send  for the 1st inverse transpose
      do i=0,jproc-1
         JrSndStrt(i) = (kjst(i) -1) * iisize * jjsize*mytype*2
         JrSndCnts(i) = iisize*jjsize*kjsz(i)*mytype*2

!   start pointers and types of recv for the 1st inverse transpose
         JrRcvStrt(i) = (jjst(i) -1)*iisize*kjsize*mytype*2
         JrRcvCnts(i) = jjsz(i) * iisize * kjsize*mytype*2
      end do

!   start pointers and types of send  for the 2nd inverse transpose
      do i=0,iproc-1
         KrSndStrt(i) = (jist(i) -1) * iisize*kjsize*mytype*2
         KrSndCnts(i) = jisz(i) * iisize*kjsize*mytype*2

!   start pointers and types of recv for the 2nd inverse transpose
         KrRcvStrt(i) = (iist(i) -1) * jisize*kjsize*mytype*2
         KrRcvCnts(i) = jisize*iisz(i)*kjsize*mytype*2
      enddo

! Displacements and buffer counts for mpi_alltoallv in transpose-functions(..)
    allocate (IiStrt(0:iproc-1))
    allocate (IiCnts(0:iproc-1))
    allocate (JiStrt(0:iproc-1))
    allocate (JiCnts(0:iproc-1))

    allocate (IjStrt(0:jproc-1))
    allocate (IjCnts(0:jproc-1))
    allocate (KjStrt(0:jproc-1))
    allocate (KjCnts(0:jproc-1))

!   start pointers and size for the x<->y transpose
    do i = 0, iproc - 1
!        x->y
      IiStrt (i) = (iiist(i)-1) * jisize * kjsize * mytype
      IiCnts (i) = iiisz (i) * jisize * kjsize * mytype

      JiStrt (i) = (jist(i)-1) * iiisize * kjsize * mytype
      JiCnts (i) = jisz (i) * iiisize * kjsize * mytype
    end do

!   start pointers and size for the x<->z transpose
    do i = 0, jproc - 1
!        x->z
      IjStrt (i) = (ijst(i)-1) * jisize * kjsize * mytype
      IjCnts (i) = ijsz (i) * jisize * kjsize * mytype

      KjStrt (i) = (kjst(i)-1) * jisize * ijsize * mytype
      KjCnts (i) = kjsz (i) * jisize * ijsize * mytype
    end do

!   create proc_dims = send information of each pencil-dimensions to all procs
    call p3dfft_get_dims (my_start, my_end, my_size, 1)
    my_proc_dims (1, 1) = my_start (1)
    my_proc_dims (1, 2) = my_start (2)
    my_proc_dims (1, 3) = my_start (3)
    my_proc_dims (1, 4) = my_end (1)
    my_proc_dims (1, 5) = my_end (2)
    my_proc_dims (1, 6) = my_end (3)
    my_proc_dims (1, 7) = my_size (1)
    my_proc_dims (1, 8) = my_size (2)
    my_proc_dims (1, 9) = my_size (3)
    call p3dfft_get_dims (my_start, my_end, my_size, 2)
    my_proc_dims (2, 1) = my_start (1)
    my_proc_dims (2, 2) = my_start (2)
    my_proc_dims (2, 3) = my_start (3)
    my_proc_dims (2, 4) = my_end (1)
    my_proc_dims (2, 5) = my_end (2)
    my_proc_dims (2, 6) = my_end (3)
    my_proc_dims (2, 7) = my_size (1)
    my_proc_dims (2, 8) = my_size (2)
    my_proc_dims (2, 9) = my_size (3)

    allocate (proc_dims(2, 9, 0:(iproc*jproc)-1))
    call MPI_Allgather (my_proc_dims, 2*9, MPI_INTEGER,proc_dims, 2 * 9, MPI_INTEGER,mpi_comm_cart, ierr)

    allocate (proc_parts((iproc*jproc), 7))
    proc_parts = - 1

!     calc max. needed memory (attention: cast to integer8 included)
      pad1 = 2* max(nz*jjsize*iisize,ny*kjsize*iisize) - kjsize
!      print *,taskid,': pad1=',pad1

      if(pad1 .le. 0) then
        pad1 = 0
      endif  

      pad2 = pad1
      if(modulo(pad2,nx*jisize) .ne. 0) then
         pad1 = pad1 / (nx*jisize) + 1
      else
         pad1 = pad1 / (nx*jisize)
      endif   


	maxisize = nx
	maxjsize = jisize
	maxksize = kjsize + pad1

	if(present(memsize)) then
	  memsize(1) = maxisize
	  memsize(2) = maxjsize
	  memsize(3) = maxksize
	endif

      end subroutine p3dfft_setup

!==================================================================       
      subroutine MapDataToProc (data,proc,st,en,sz)
!========================================================
!    
       implicit none
       integer data,proc,st(0:proc-1),en(0:proc-1),sz(0:proc-1)
       integer i,size,nl,nu

       size=data/proc
       nu = data - size * proc
       nl = proc - nu
       st(0) = 1
       sz(0) = size
       en(0) = size
       do i=1,nl-1
         st(i) = st(i-1) + size
         sz(i) = size
         en(i) = en(i-1) + size
      enddo
      size = size + 1
      do i=nl,proc-1
         st(i) = en(i-1) + 1
         sz(i) = size
         en(i) = en(i-1) + size
      enddo
      en(proc-1)= data 
      sz(proc-1)= data-st(proc-1)+1

      end subroutine

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

!========================================================

      subroutine init_plan(A,B,C,n2)

      use fft_spec
      implicit none

      integer(i8) n2
      complex(mytype) A(n2),C(n2)
      real(mytype) B(n2*2)

      
      call init_work(nx_fft,ny_fft,nz_fft)

      if(jisize*kjsize .gt. 0) then

        call plan_f_r2c(B,nx_fft,A,nxhp,nx_fft,jisize*kjsize) 

      call plan_b_c2r(A,nxhp,B,nx_fft,nx_fft,jisize*kjsize) 

     endif


     if(iisize*kjsize .gt. 0) then 
     
      call plan_f_c1(A,1,ny_fft,A,1,ny_fft,ny_fft,iisize*kjsize)
      call plan_b_c1(A,1,ny_fft,A,1,ny_fft,ny_fft,iisize*kjsize)

     endif	

     if(jjsize .gt. 0) then

        call plan_b_c2_same(A,1,nz_fft,A,1,nz_fft,nz_fft,jjsize)
        call plan_b_c2_dif(A,1,nz_fft,C,1,nz_fft,nz_fft,jjsize)
        call plan_f_c2_same(A,1,nz_fft, A,1,nz_fft,nz_fft,jjsize)
        call plan_f_c2_dif(A,1,nz_fft, C,1,nz_fft,nz_fft,jjsize)
        call plan_ctrans_r2_same (A, 2,2*nz_fft, &
                         A, 2,2*nz_fft, NZ_fft, jjsize)
        call plan_strans_r2_same (A, 2,2*nz_fft, &
                         A, 2,2*nz_fft, NZ_fft, jjsize)
        call plan_ctrans_r2_dif (A, 2,2*nz_fft, &
                         C, 2,2*nz_fft, NZ_fft, jjsize)
        call plan_strans_r2_dif (A, 2,2*nz_fft, &
                         C, 2,2*nz_fft, NZ_fft, jjsize)

     endif



      return
      end subroutine
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

!========================================================
      subroutine p3dfft_ftran_r2c_many_w (XgYZ,dim_in,XYZg,dim_out,nv,op) 
!BIND(C,NAME='p3dfft_ftran_r2c_many')
!========================================================

      real(mytype), TARGET :: XgYZ(nx_fft,jistart:jiend,kjstart:kjend)
      complex(mytype), TARGET :: XYZg(nzc,iistart:iiend,jjstart:jjend)
      character(len=3) op
      integer dim_in,dim_out,nv

      call p3dfft_ftran_r2c_many (XgYZ,dim_in,XYZg,dim_out,nv,op) 

      end subroutine

!========================================================
      subroutine p3dfft_ftran_r2c_many (XgYZ,dim_in,XYZg,dim_out,nv,op) 
!========================================================

      use fft_spec
      implicit none

!      real(mytype), TARGET :: XgYZ(nx_fft,jisize,kjsize,nv)
!#ifdef 1
!      complex(mytype), TARGET :: XYZg(nzc,jjsize,iisize,nv)
!#else
!      complex(mytype), TARGET :: XYZg(iisize,jjsize,nzc,nv)
!#endif

      integer dim_in,dim_out

      real(mytype), TARGET :: XgYZ(dim_in,nv)
      complex(mytype), TARGET :: XYZg(dim_out,nv)

      complex(mytype), allocatable :: buf(:)
      integer x,y,z,i,nx,ny,nz,ierr,dnz,nv,j,err,n1,n2
      integer(i8) Nl
      character(len=3) op
      integer mythread,OMP_GET_THREAD_NUM
      
      if(.not. mpi_set) then
         print *,'P3DFFT error: call setup before other routines'
         return
      endif
      
      if(dim_in .lt. nx_fft*jisize*kjsize) then
         print *,taskid,': ftran error: input array dimensions are too low: ',dim_in,' while expecting ',nx_fft*jisize*kjsize
      endif	 

      if(dim_out .lt. nzc*jjsize*iisize) then
         print *,taskid,': ftran error: output array dimensions are too low: ',dim_out,' while expecting ',nzc*jjsize*iisize
      endif	 

      nx = nx_fft
      ny = ny_fft
      nz = nz_fft

! For FFT libraries that require explicit allocation of work space,
! such as 1, initialize here



!$OMP PARALLEL DO ordered private(buf,j,z,dnz) shared(XgYZ,buf_size,nx,jisize,kjsize,nxhp,timers,iproc,taskid,jproc,iisize,jjsize,ny,nz,op,XYZg,nzc,nzhc,Nl,nv)
      do j=1,nv

        allocate (buf(buf_size), stat=err)
        if (err /= 0) then
          print *, 'Error ', err, ' allocating array buf'
        end if


! FFT transform (R2C) in X for all z and y

      if(jisize * kjsize .gt. 0) then
         call init_f_r2c(XgYZ(1,j),nx,buf,nxhp,nx,jisize*kjsize)

!!$OMP MASTER
         timers(5) = timers(5) - MPI_Wtime()
!!$OMP END MASTER
!!$OMP BARRIER
	 call exec_f_r2c(XgYZ(1,j),nx,buf,nxhp,nx,jisize*kjsize)
!!$OMP BARRIER
!!$OMP MASTER
         timers(5) = timers(5) + MPI_Wtime()
!!$OMP END MASTER

      endif


! Exchange data in rows 

      if(iproc .gt. 1) then 

         call fcomm1(buf,buf,timers(1),timers(6))
         

      else
         call reorder_f1(buf,buf)
      endif

! FFT transform (C2C) in Y for all x and z, one Z plane at a time



      if(iisize * kjsize .gt. 0) then
         call init_f(buf,1,ny,buf,1,ny,ny,iisize*kjsize,'f')
!!$OMP MASTER
         timers(7) = timers(7) - MPI_Wtime()
!!$OMP END MASTER
!!$OMP BARRIER
	 call exec_f_c1(buf,1,ny,buf,1,ny,ny,iisize*kjsize)
!!$OMP BARRIER
!!$OMP MASTER
	 timers(7) = timers(7) + MPI_Wtime()
!!$OMP END MASTER

      endif



! Exchange data in columns
      if(jproc .gt. 1) then


! For stride1 option combine second transpose with transform in Z
         call init_f(buf,1,nz, XYZg(1,j),1,nz,nz,jjsize,op(3:3))
         call fcomm2_trans(buf,XYZg(1,j),op,timers(2),timers(8))

      else

!!$OMP MASTER
         timers(8) = timers(8) - MPI_Wtime()	
!!$OMP END MASTER
!!$OMP BARRIER

         call init_f(buf,1,nz, XYZg(1,j),1,nz,nz,jjsize,op(3:3))
         call reorder_trans_f2(buf,XYZg(1,j),op)

!!$OMP BARRIER
!!$OMP MASTER
        timers(8) = timers(8) + MPI_Wtime()
!!$OMP END MASTER

      endif

      deallocate(buf)
      enddo

      return
      end subroutine

!========================================================
      subroutine p3dfft_ftran_cheby_many_w (XgYZ,dim_in,XYZg,dim_out,nv,Lz) BIND(C,NAME='p3dfft_cheby_many')
!========================================================

      real(mytype), TARGET :: XgYZ(nx_fft,jistart:jiend,kjstart:kjend)
      complex(mytype), TARGET :: XYZg(nzc,iistart:iiend,jjstart:jjend)
      integer dim_in,dim_out,nv
      real(mytype) Lz

      call p3dfft_cheby_many (XgYZ,dim_in,XYZg,dim_out,nv,Lz) 

      end subroutine

!---------------------------------------------------------------
	subroutine p3dfft_cheby_many(in,dim_in,out,dim_out,nv,Lz) 

	integer dim_in,dim_out,nv,j
	real(mytype) Lz
      	real(mytype), dimension(dim_in,nv), target	::	in
        complex(mytype), dimension (dim_out,nv), target :: out				

    	call p3dfft_ftran_r2c_many(in,dim_in,out,dim_out,nv,'ffc')

	do j=1,nv
	   call p3dfft_cheby(in(1,j),out(1,j),Lz)
        enddo

	return
	end subroutine


	subroutine p3dfft_cheby_w(in,out,Lz) BIND(C,NAME='p3dfft_cheby')

      	real(mytype), dimension(nx_fft,     &
                                jisize,     &
                                kjsize), target	::	in

      	complex(mytype), dimension(nzc, &
                                jjsize,&
                                iisize), target	::	out
	real(mytype) Lz

	call p3dfft_cheby(in,out,Lz) 

	end subroutine

	subroutine p3dfft_cheby(in,out,Lz) 

!     !	function args
      	real(mytype), dimension(nx_fft,     &
                                jisize,     &
                                kjsize), target	::	in

      	complex(mytype), dimension(nzc, &
                                jjsize,&
                                iisize), target	::	out
      	complex(mytype) Old, New, Tmp
      	real(mytype) :: Lfactor,Lz
	integer k,nz,i,j

	nz = nzc

        call p3dfft_ftran_r2c(in,out,'ffc')

     	out = out *(1.d0/(dble(nx_fft*ny_fft)*(nzc-1)))

! less tmp-memory version (but difficult to read)

     	Lfactor = 4.d0/Lz

! first and last cheby-coeff needs to gets multiplied by factor 0.5
! because of relation between cheby and discrete cosinus transforms

  
	do i=1,iisize
	   do j=1,jjsize
    	     Old = out(nzc-1,j,i)
    	     out(nzc-1,j,i) = Lfactor *dble(nzc-1) *out(nzc,j,i) * 0.5d0
    	     out(nzc,j,i) = cmplx(0.d0,0.d0)
    	     do k = nzc-2, 1, -1
    		New = out(k,j,i)
    		out(k,j,i) = Lfactor *dble(k) *Old +out(k+2,j,i)
    		Tmp = New
    		New = Old
    		Old = Tmp
      	     enddo
    	     out(1,j,i) = out(1,j,i) *0.5d0
	   enddo
	enddo

!     		! easy to read version (but more tmp-memory needed)
!     		Lfactor = 4.d0/Lz
!     		ctest10 = out
!    		out(:,:,n3  ) = cmplx(0.d0,0.d0)					!ok
!    		out(:,:,n3-1) = Lfactor *dble(n3-1) *ctest10(:,:,n3)	!ok
!    		do k = n3-2, 1, -1
!    			out(:,:,k) = Lfactor *dble(k) *ctest10(:,:,k+1) +out(:,:,k+2)
!    		enddo
!    			out(:,:,1) = out(:,:,1) *0.5d0

	return
	end subroutine p3dfft_cheby

! --------------------------------------
!
!  p3dfft_ftran_r2c_1d(..)
!
! --------------------------------------
subroutine p3dfft_ftran_r2c_1d (rXgYZ, cXgYZ)
  use fft_spec
  implicit none

  real (mytype), target :: rXgYZ (NX_fft, jistart:jiend, kjstart:kjend)
  real (mytype), target :: cXgYZ (NX_fft+2, jistart:jiend, kjstart:kjend)

!      complex(mytype), allocatable :: XYgZ(:,:,:)
  integer x, y, z, i, err, nx, ny, nz

  if ( .not. mpi_set) then
    print *, 'P3DFFT error: call setup before other routines'
    return
  end if

  nx = NX_fft
  ny = NY_fft
  nz = NZ_fft

!
! FFT transform (R2C) in X for all z and y
!
  if (jisize*kjsize > 0) then
    call init_f_r2c (rXgYZ, nx, cXgYZ, nxhp, nx, jisize*kjsize)
    call exec_f_r2c (rXgYZ, nx, cXgYZ, nxhp, nx, jisize*kjsize)
  end if

end subroutine p3dfft_ftran_r2c_1d

!	 call f_r2c(XgYZ,nx,buf,nxhp,nx,jisize*kjsize,nv)

subroutine f_r2c_many(source,str1,dest,str2,n,m,dim,nv)

  integer str1,str2,n,m,nv,j,dim
  real(mytype) source(dim,nv)
  complex(mytype) dest(n/2+1,m,nv)

  do j=1,nv
    call exec_f_r2c(source(1,j),str1,dest(1,1,j),str2,n,m)
  enddo

  return
  end subroutine

         subroutine f_c1_many(A,str1,str2,n,m,dim,nv)

	   integer n,m,nv,j,str1,str2,dim
	   complex(mytype) A(dim,nv)

	 do j=1,nv
           call exec_f_c1(A(1,j),str1,str2,A(1,j),str1,str2,n,m)
         enddo

	 return
	 end subroutine



         subroutine ztran_f_same(A,str1,str2,n,m,op)
	
	   integer str1,str2,n,m,ierr
	   complex(mytype) A(*)
	   character(len=3) op

            call init_f(A,str1,str2,A,str1,str2,n,m,op(3:3))
	    if(op(3:3) == 't' .or. op(3:3) == 'f') then
         
                 call exec_f_c2_same(A,str1,str2,A,str1,str2,n,m)

	    else if(op(3:3) == 'c') then
	       call exec_ctrans_r2_same(A,2*str1,str2,A,2*str1,str2,n,2*m)

	    else if(op(3:3) == 's') then

	      call exec_strans_r2_same(A,2*str1,str2,A,2*str1,str2,n,2*m)

	    else if(op(3:3) .ne. 'n' .and. op(3:3) .ne. '0') then
		print *,'Unknown transform type: ',op(3:3)
		call MPI_Abort(MPI_COMM_WORLD,ierr)
            endif

	    return
	    end subroutine




!========================================================
      subroutine p3dfft_ftran_r2c_w (XgYZ,XYZg,op) 
!BIND(C,NAME='p3dfft_ftran_r2c')
!========================================================

      real(mytype), TARGET :: XgYZ(nx_fft,jistart:jiend,kjstart:kjend)
      complex(mytype), TARGET :: XYZg(nzc,iistart:iiend,jjstart:jjend)
      character(len=3) op

      call p3dfft_ftran_r2c (XgYZ,XYZg,op) 

      end subroutine

!========================================================
      subroutine p3dfft_ftran_r2c (XgYZ,XYZg,op) 
!========================================================

      use fft_spec
      implicit none

      real(mytype), TARGET :: XgYZ(nx_fft,jistart:jiend,kjstart:kjend)
      complex(mytype), TARGET :: XYZg(nzc,iistart:iiend,jjstart:jjend)

      integer x,y,z,i,nx,ny,nz,ierr,dnz
      integer(i8) Nl
      character(len=3) op
      complex(mytype) buf(buf_size)
      
      if(.not. mpi_set) then
         print *,'P3DFFT error: call setup before other routines'
         return
      endif

      nx = nx_fft
      ny = ny_fft
      nz = nz_fft

! For FFT libraries that require explicit allocation of work space,
! such as 1, initialize here


! FFT transform (R2C) in X for all z and y


      if(jisize * kjsize .gt. 0) then
         call init_f_r2c(XgYZ,nx,buf,nxhp,nx,jisize*kjsize)

         timers(5) = timers(5) - MPI_Wtime()

         call exec_f_r2c(XgYZ,nx,buf,nxhp,nx,jisize*kjsize)

         timers(5) = timers(5) + MPI_Wtime()

      endif


! Exchange data in rows 

      if(iproc .gt. 1) then 

         call fcomm1(buf,buf,timers(1),timers(6))
         

      else
         call reorder_f1(buf,buf)
      endif

! FFT transform (C2C) in Y for all x and z, one Z plane at a time



      if(iisize * kjsize .gt. 0) then
         call init_f(buf,1,ny,buf,1,ny,ny,iisize*kjsize,'f')
         timers(7) = timers(7) - MPI_Wtime()

         call exec_f_c1(buf,1,ny,buf,1,ny,ny,iisize*kjsize)
         timers(7) = timers(7) + MPI_Wtime()


      endif



! Exchange data in columns
      if(jproc .gt. 1) then

! For stride1 option combine second transpose with transform in Z
         call init_f(buf,1,nz, XYZg,1,nz,nz,jjsize,op(3:3))
         call fcomm2_trans(buf,XYZg,op,timers(2),timers(8))

      else

         timers(8) = timers(8) - MPI_Wtime()	

         call reorder_trans_f2(buf,XYZg,op)

        timers(8) = timers(8) + MPI_Wtime()

      endif

      return
      end subroutine
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
!========================================================
      subroutine p3dfft_btran_c2r_many_w (XYZg,dim_in,XgYZ,dim_out,nv,op) 
!BIND(C,NAME='p3dfft_btran_c2r_many')
!========================================================

      real(mytype), TARGET :: XgYZ(nx_fft,jistart:jiend,kjstart:kjend)
      complex(mytype), TARGET :: XYZg(nzc,iistart:iiend,jjstart:jjend)
      character(len=3) op
      integer dim_in,dim_out,nv

      call p3dfft_btran_c2r_many (XYZg,dim_in,XgYZ,dim_out,nv,op) 

      end subroutine

!----------------------------------------------------------------------------
      subroutine p3dfft_btran_c2r_many (XYZg,dim_in,XgYZ,dim_out,nv,op)
!========================================================

      use fft_spec
      implicit none

      integer x,y,z,i,k,nx,ny,nz,ierr,dnz,nv,j,n1,n2,dim_in,dim_out
      real(mytype),TARGET :: XgYZ(dim_out,nv)
      complex(mytype), TARGET :: XYZg(dim_in,nv)

!      real(mytype),TARGET :: XgYZ(nx_fft,jisize,kjsize,nv)
!#ifdef 1
!      complex(mytype), TARGET :: XYZg(nzc,iisize,jjsize,nv)
!#else
!      complex(mytype), TARGET :: XYZg(iisize,jjsize,nzc,nv)
!#endif

      integer(i8) Nl
      character(len=3) op
      complex(mytype), allocatable :: buf(:)

      if(.not. mpi_set) then
         print *,'P3DFFT error: call setup before other routines'
         return
      endif

      nx = nx_fft
      ny = ny_fft
      nz = nz_fft

! For FFT libraries that require explicit allocation of work space,
! such as 1, initialize here


!$OMP PARALLEL DO ordered private(buf,j,z) shared(XgYZ,buf_size,nx,jisize,kjsize,nxhp,timers,iproc,taskid,jproc,iisize,jjsize,ny,nz,op,XYZg,nzc,nzhc,Nl,nv,OW)
      do j=1,nv

! Allocate work array

        allocate(buf(buf_size))

! FFT Tranform (C2C) in Z for all x and y 

      if(jproc .gt. 1) then

         call init_b(XYZg(1,j), 1,nz, buf, 1, nz,nz,jjsize,op(1:1))

         call bcomm1_trans(XYZg(1,j),buf,op,timers(3),timers(9))



      else
            timers(9) = timers(9) - MPI_Wtime()

         call init_b(XYZg(1,j), 1,nz, buf, 1, nz,nz,jjsize,op(1:1))
         call reorder_trans_b1(XYZg(1,j),buf,op)

            timers(9) = timers(9) + MPI_Wtime()

      endif

! Exhange in columns if needed

!
! FFT Transform (C2C) in y dimension for all x, one z-plane at a time
!

      
      if(iisize * kjsize .gt. 0) then

         call init_b(buf,1,ny,buf,1,ny,ny,iisize*kjsize,'f')
         timers(10) = timers(10) - MPI_Wtime()

         call exec_b_c1(buf,1,ny,buf,1,ny,ny,iisize*kjsize)

         timers(10) = timers(10) + MPI_Wtime()

      endif


      if(iproc .gt. 1) then 
!         call bcomm2(buf,buf1,timers(4),timers(11))
         call bcomm2(buf,buf,timers(4),timers(11))
      else
!         call reorder_b2_many(buf,buf1,nv)
         call reorder_b2(buf,buf)
      endif

! Perform Complex-to-real FFT in x dimension for all y and z
       if(jisize * kjsize .gt. 0) then

          call init_b_c2r(buf,nxhp,XgYZ(1,j),nx,nx,jisize*kjsize)

          timers(12) = timers(12) - MPI_Wtime()
          call exec_b_c2r(buf,nxhp,XgYZ(1,j),nx,nx,jisize*kjsize)
          timers(12) = timers(12) + MPI_Wtime()
       endif

      deallocate(buf)

      enddo

      return
      end subroutine

subroutine b_c2r_many(A,str1,B,str2,n,m,dim,nv)

	   integer str1,str2,n,m,nv,j,dim
	   complex(mytype) A(n/2+1,m,nv)
	   real(mytype) B(dim,nv)

	   do j=1,nv
	      call exec_b_c2r(A(1,1,j),str1,B(1,j),str2,n,m)
           enddo	

	   return
	   end subroutine

subroutine ztran_b_same_many(A,str1,str2,n,m,dim,nv,op)

	   integer str1,str2,n,m,nv,j,ierr,dim
	   complex(mytype) A(dim,nv)
	   character(len=3) op

            call init_b(A,str1,str2,A,str1,str2,n,m,op(1:1))
	    if(op(1:1) == 't' .or. op(1:1) == 'f') then
         
	      do j=1,nv
                 call exec_b_c2_same(A(1,j),str1,str2,A(1,j),str1,str2,n,m)
              enddo

	    else if(op(1:1) == 'c') then

	      do j=1,nv
                 call exec_ctrans_r2_same(A(1,j),2*str1,str2,A(1,j),2*str1,str2,n,2*m)
	      enddo

	    else if(op(1:1) == 's') then

	      do j=1,nv
                 call exec_strans_r2_same(A(1,j),2*str1,str2,A(1,j),2*str1,str2,n,2*m)
              enddo
	    else if(op(1:1) .ne. 'n' .and. op(1:1) .ne. '0') then
		print *,'Unknown transform type: ',op(1:1)
		call MPI_Abort(MPI_COMM_WORLD,ierr)
            endif

	    return
	    end subroutine

	    subroutine b_c1_many(A,str1,str2,n,m,dim,nv)

	   integer n,m,nv,j,str1,str2,dim
	   complex(mytype) A(dim,nv)

  	   do j=1,nv
             call exec_b_c1(A(1,j),str1,str2,A(1,j),str1,str2,n,m)
           enddo

	   return
	   end subroutine


	   subroutine ztran_b(A,str1,str2,B,n,m,op)

	   integer str1,str2,n,m,ierr,dim
	   complex(mytype) A(*),B(*)
	   character(len=3) op

           call init_b(A,str1,str2,B,str1,str2,n,m,op(1:1))
	    if(op(1:1) == 't' .or. op(1:1) == 'f') then

	      call exec_b_c2_same(A,str1,str2,B,str1,str2,n,m)

	    else if(op(1:1) == 'c') then

              call exec_ctrans_r2_same(A,2*str1,str2,B,2*str1,str2,n,2*m)

	    else if(op(1:1) == 's') then

              call exec_strans_r2_same(A,2*str1,str2,B,2*str1,str2,n,2*m)

	    else if(op(1:1) .ne. 'n' .and. op(1:1) .ne. '0') then
		print *,'Unknown transform type: ',op(1:1)
		call MPI_Abort(MPI_COMM_WORLD,ierr)
            endif

	    return
	    end subroutine

	   subroutine ztran_b_same(A,str1,str2,n,m,op)
	   integer str1,str2,n,m,ierr,dim
	   complex(mytype) A(*)
	   character(len=3) op

           call init_b(A,str1,str2,A,str1,str2,n,m,op(1:1))
	    if(op(1:1) == 't' .or. op(1:1) == 'f') then

	      call exec_b_c2_same(A,str1,str2,A,str1,str2,n,m)

	    else if(op(1:1) == 'c') then
         
                 call exec_ctrans_r2_same(A,2*str1,str2,A,2*str1,str2,n,2*m)

	    else if(op(1:1) == 's') then

              call exec_strans_r2_same(A,2*str1,str2,A,2*str1,str2,n,2*m)

	    else if(op(1:1) .ne. 'n' .and. op(1:1) .ne. '0') then
		print *,'Unknown transform type: ',op(1:1)
		call MPI_Abort(MPI_COMM_WORLD,ierr)
            endif

	    return
	    end subroutine

!========================================================
      subroutine p3dfft_btran_c2r_w (XYZg,XgYZ,op) 
!BIND(C,NAME='p3dfft_btran_c2r')
!========================================================

      real(mytype), TARGET :: XgYZ(nx_fft,jistart:jiend,kjstart:kjend)
      complex(mytype), TARGET :: XYZg(nzc,iistart:iiend,jjstart:jjend)
      character(len=3) op

      call p3dfft_btran_c2r (XYZg,XgYZ,op) 

      end subroutine

!----------------------------------------------------------------------------
      subroutine p3dfft_btran_c2r (XYZg,XgYZ,op)
!========================================================

      use fft_spec
      implicit none

      real(mytype),TARGET :: XgYZ(nx_fft,jistart:jiend,kjstart:kjend)
      complex(mytype), TARGET :: XYZg(nzc,iistart:iiend,jjstart:jjend)
	complex(mytype) buf(buf_size)

      integer x,y,z,i,k,nx,ny,nz,ierr,dnz
      integer(i8) Nl
      character(len=3) op

      if(.not. mpi_set) then
         print *,'P3DFFT error: call setup before other routines'
         return
      endif
      nx = nx_fft
      ny = ny_fft
      nz = nz_fft

! For FFT libraries that require explicit allocation of work space,
! such as 1, initialize here

! Allocate work array

!      allocate(buf(nxhp,jistart:jiend,kjstart:kjend+padd))

! FFT Tranform (C2C) in Z for all x and y 

      if(jproc .gt. 1) then

         call init_b(XYZg, 1,nz, buf, 1, nz,nz,jjsize,op(1:1))
         call bcomm1_trans(XYZg,buf,op,timers(3),timers(9))




      else

            timers(9) = timers(9) - MPI_Wtime()

         call reorder_trans_b1(XYZg,buf,op)

            timers(9) = timers(9) + MPI_Wtime()

      endif

! Exhange in columns if needed

!
! FFT Transform (C2C) in y dimension for all x, one z-plane at a time
!

      
      if(iisize * kjsize .gt. 0) then

         call init_b(buf,1,ny,buf,1,ny,ny,iisize*kjsize,'f')

         timers(10) = timers(10) - MPI_Wtime()

         call exec_b_c1(buf,1,ny,buf,1,ny,ny,iisize*kjsize)

         timers(10) = timers(10) + MPI_Wtime()

      endif

      if(iproc .gt. 1) then 
         call bcomm2(buf,buf,timers(4),timers(11))
      else
         call reorder_b2(buf,buf)
      endif
! Perform Complex-to-real FFT in x dimension for all y and z
      if(jisize * kjsize .gt. 0) then

         call init_b_c2r(buf,nxhp,XgYZ,nx,nx,jisize*kjsize)

         timers(12) = timers(12) - MPI_Wtime()

         call exec_b_c2r(buf,nxhp,XgYZ,nx,nx,jisize*kjsize)
         timers(12) = timers(12) + MPI_Wtime()

      endif

      return
      end subroutine


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

! This routine is called only when jproc=1, and only when stride1 is used
! transform backward in Z and transpose array in memory 

      subroutine reorder_trans_b1_many(A,B,dim,nv,op)

      use fft_spec

      character(len=3) op
      integer x,y,z,iy,iz,y2,z2,ierr,dnz,dny,nv,j,dim
      complex(mytype) A(dim,nv)
      complex(mytype) B(ny_fft,iisize,nz_fft,nv)
!      complex(mytype) C(nz_fft,nyc)

      do j=1,nv
         call reorder_trans_b1(A(1,j),B(1,1,1,j),op)
      enddo

      return
      end subroutine


! This routine is called only when iproc=1, and only when stride1 is used
! Transpose array in memory and transform forward in Y

      subroutine reorder_b2_many(A,B,nv)

      implicit none

      complex(mytype) B(nxhp,ny_fft,kjsize,nv)
      complex(mytype) A(ny_fft,nxhpc,kjsize,nv)
      integer x,y,z,iy,x2,ix,y2,nv,j
      complex(mytype), allocatable :: tmp(:,:)


      allocate(tmp(nxhpc,ny_fft))

      do j=1,nv
      do z=1,kjsize
         do x=1,nxhpc,nbx
            x2 = min(x+nbx-1,nxhpc)
            do y=1,ny_fft,nby1
               y2 = min(y+nby1-1,ny_fft)
               do ix=x,x2
                  do iy = y,y2
                     tmp(ix,iy) = A(iy,ix,z,j)
                  enddo
               enddo
            enddo
         enddo

         do y=1,ny_fft
            do x=1,nxhpc
               B(x,y,z,j) = tmp(x,y)
            enddo
	    do x=nxhpc+1,nxhp
	       B(x,y,z,j) = 0.
	    enddo
         enddo
      enddo
      enddo

      deallocate(tmp)

      return
      end subroutine

! This routine is called only when iproc=1, and only when stride1 is used
! Transpose array in memory and transform forward in Y

      subroutine reorder_f1_many(A,B,tmp,nv)

      implicit none

      complex(mytype) A(nxhp,ny_fft,kjsize,nv)
      complex(mytype) B(ny_fft,nxhpc,kjsize,nv)
      integer x,y,z,iy,x2,ix,y2,dnx,nv,j
      complex(mytype) tmp(ny_fft,nxhpc,kjsize)
!      complex(mytype), allocatable :: tmp(:,:)

!      allocate(tmp(ny_fft,nxhpc))

       do j=1,nv
      do z=1,kjsize
         do y=1,ny_fft,nby1
            y2 = min(y+nby1-1,ny_fft)
            do x=1,nxhpc,nbx
               x2 = min(x+nbx-1,nxhpc)
               do iy = y,y2
                  do ix=x,x2
                     tmp(iy,ix,z) = A(ix,iy,z,j)
                  enddo
               enddo
            enddo
         enddo

         do x=1,nxhpc
            do y=1,ny_fft
               B(y,x,z,j) = tmp(y,x,z)
            enddo
         enddo
      enddo

      enddo
!      deallocate(tmp)

      return
      end subroutine

! This routine is called only when jproc=1, and only when stride1 is used
! Transpose array in memory and transform forward in Z

      subroutine reorder_trans_f2_many(A,B,dim,nv,op)

      use fft_spec
      implicit none

      integer x,y,z,iy,iz,y2,z2,ierr,dnz,dny,nv,j,dim
      complex(mytype) B(dim,nv)
      complex(mytype) A(ny_fft,iisize,nz_fft,nv)
!      complex(mytype) C(nz_fft,ny_fft)
      character(len=3) op

      do j=1,nv
         call reorder_trans_f2(A(1,1,1,j),B(1,j),op)
      enddo

      return
      end subroutine


!=============================================
      subroutine reorder_trans_b1(A,B,op)

      use fft_spec

      complex(mytype) B(ny_fft,iisize,nz_fft)
      complex(mytype) A(nzc,nyc,iisize)
      complex(mytype) C(nz_fft,nyc)
      integer x,y,z,iy,iz,y2,z2,ierr,dnz,dny
      character(len=3) op

      dny = ny_fft - nyc
      dnz = nz_fft - nzc
      if(op(1:1) == '0' .or. op(1:1) == 'n') then

         do x=1,iisize
            do y=1,nyhc,NBy2
               y2 = min(y+NBy2-1,nyhc)

   	       do z=1,nzhc,NBz
	          z2 = min(z+NBz-1,nzhc)
                    do iy=y,y2
                        do iz=z,z2
			   B(iy,x,iz) = A(iz,iy,x)
                        enddo
                     enddo
                enddo

   	       do z=nzhc+dnz+1,nz_fft,NBz
	          z2 = min(z+NBz-1,nz_fft)
                    do iy=y,y2
                        do iz=z,z2
			   B(iy,x,iz) = A(iz-dnz,iy,x)
                        enddo
                     enddo
                enddo

              enddo 

            do y=nyhc+1,nyc,NBy2
               y2 = min(y+NBy2-1,nyc)

   	       do z=1,nzhc,NBz
	          z2 = min(z+NBz-1,nzhc)
                    do iy=y,y2
                        do iz=z,z2
			   B(iy+dny,x,iz) = A(iz,iy,x)
                        enddo
                     enddo
                enddo

   	       do z=nzhc+dnz+1,nz_fft,NBz
	          z2 = min(z+NBz-1,nz_fft)
                    do iy=y,y2
                        do iz=z,z2
			   B(iy+dny,x,iz) = A(iz-dnz,iy,x)
                        enddo
                     enddo
                enddo

              enddo 

          enddo

	  do z=nzhc+1,nzhc+dnz
	     do x=1,iisize
                do y=1,ny_fft
	 	   B(y,x,z) = 0
                enddo
             enddo
          enddo


	else
           do x=1,iisize
	      do y=1,nyc
	         do z=1,nzhc
		    C(z,y) = A(z,y,x)
		 enddo
	         do z=nzhc+1,nzhc+dnz
		    C(z,y) = 0.
		 enddo
	         do z=nzhc+dnz+1,nz_fft
		    C(z,y) = A(z-dnz,y,x)
		 enddo
	      enddo 

	      if(op(1:1) == 't' .or. op(1:1) == 'f') then
                 call exec_b_c2_same(C, 1,nz_fft, &
				  C, 1,nz_fft,nz_fft,nyc)
 	      else if(op(1:1) == 'c') then	
                 call exec_ctrans_r2_complex_same(C, 2,2*nz_fft, & 
				  C, 2,2*nz_fft,nz_fft,nyc)
 	      else if(op(1:1) == 's') then	
                 call exec_strans_r2_complex_same(C, 2,2*nz_fft, & 
				  C, 2,2*nz_fft,nz_fft,nyc)
              else 
	         print *,taskid,'Unknown transform type: ',op(1:1)
	         call MPI_abort(MPI_COMM_WORLD,ierr)
	      endif

              do y=1,nyhc,NBy2
                 y2 = min(y+NBy2-1,nyhc)
     	         do z=1,nz_fft,NBz
	            z2 = min(z+NBz-1,nz_fft)
                       do iy=y,y2
                          do iz=z,z2
			     B(iy,x,iz) = C(iz,iy)
                          enddo
                       enddo
                  enddo
              enddo 
              do y=nyhc+1,nyc,NBy2
                 y2 = min(y+NBy2-1,nyc)
     	         do z=1,nz_fft,NBz
	            z2 = min(z+NBz-1,nz_fft)
                       do iy=y,y2
                          do iz=z,z2
			     B(iy+dny,x,iz) = C(iz,iy)
                          enddo
                       enddo
                  enddo
              enddo 
          enddo
     endif

     do z=1,nz_fft
        do x=1,iisize
           do y=nyhc+1,nyhc+dny
   	      B(y,x,z) = 0.
	   enddo
        enddo
      enddo
	     

      return
      end subroutine

! This routine is called only when iproc=1, and only when stride1 is used
! Transpose array in memory and transform forward in Y

      subroutine reorder_b2(A,B)

      implicit none

      complex(mytype) B(nxhp,ny_fft,kjsize)
      complex(mytype) A(ny_fft,nxhpc,kjsize)
      integer x,y,z,iy,x2,ix,y2
      complex(mytype), allocatable :: tmp(:,:)


      allocate(tmp(nxhpc,ny_fft))

      do z=1,kjsize
         do x=1,nxhpc,nbx
            x2 = min(x+nbx-1,nxhpc)
            do y=1,ny_fft,nby1
               y2 = min(y+nby1-1,ny_fft)
               do ix=x,x2
                  do iy = y,y2
                     tmp(ix,iy) = A(iy,ix,z)
                  enddo
               enddo
            enddo
         enddo

         do y=1,ny_fft
            do x=1,nxhpc
               B(x,y,z) = tmp(x,y)
            enddo
	    do x=nxhpc+1,nxhp
	       B(x,y,z) = 0.
	    enddo
         enddo
      enddo


      deallocate(tmp)

      return
      end subroutine

! This routine is called only when iproc=1, and only when stride1 is used
! Transpose array in memory and transform forward in Y

      subroutine reorder_f1(A,B)

      implicit none

      complex(mytype) A(nxhp,ny_fft,kjsize)
      complex(mytype) B(ny_fft,nxhpc,kjsize)
      integer x,y,z,iy,x2,ix,y2,dnx
      complex(mytype) tmp(ny_fft,nxhpc,kjsize)
!      complex(mytype), allocatable :: tmp(:,:)

!      allocate(tmp(ny_fft,nxhpc))


      do z=1,kjsize
         do y=1,ny_fft,nby1
            y2 = min(y+nby1-1,ny_fft)
            do x=1,nxhpc,nbx
               x2 = min(x+nbx-1,nxhpc)
               do iy = y,y2
                  do ix=x,x2
                     tmp(iy,ix,z) = A(ix,iy,z)
                  enddo
               enddo
            enddo
         enddo

         do x=1,nxhpc
            do y=1,ny_fft
               B(y,x,z) = tmp(y,x,z)
            enddo
         enddo
      enddo

!      deallocate(tmp)

      return
      end subroutine

! This routine is called only when jproc=1, and only when stride1 is used
! Transpose array in memory and transform forward in Z

      subroutine reorder_trans_f2(A,B,op)

      use fft_spec
      implicit none

      complex(mytype) A(ny_fft,iisize,nz_fft)
      complex(mytype) B(nzc,nyc,iisize)
      complex(mytype) C(nz_fft,ny_fft)
      integer x,y,z,iy,iz,y2,z2,ierr,dnz,dny
      character(len=3) op

      dnz = nz_fft - nzc
      dny = ny_fft - nyc
      if(op(3:3) == '0' .or. op(3:3) == 'n') then
	
         do x=1,iisize
            do z=1,nzhc,NBz
	       z2 = min(z+NBz-1,nzhc)
            
               do y=1,nyhc,NBy2
                  y2 = min(y+NBy2-1,nyhc)
                  do iz=z,z2
                     do iy=y,y2
  		        B(iz,iy,x) = A(iy,x,iz)
                     enddo
                  enddo
               enddo

               do y=nyhc+dny+1,ny_fft,NBy2
                  y2 = min(y+NBy2-1,ny_fft)
                  do iz=z,z2
                     do iy=y,y2
  		        B(iz,iy,x) = A(iy-dny,x,iz)
                     enddo
                  enddo
               enddo
            enddo
            do z=nzhc+dnz+1,nz_fft,NBz
	       z2 = min(z+NBz-1,nz_fft)
            
               do y=1,nyhc,NBy2
                  y2 = min(y+NBy2-1,nyhc)
                  do iz=z,z2
                     do iy=y,y2
		        B(iz,iy,x) = A(iy,x,iz-dnz)
                     enddo
                  enddo
               enddo
               do y=nyhc+dny+1,ny_fft,NBy2
                  y2 = min(y+NBy2-1,ny_fft)
                  do iz=z,z2
                     do iy=y,y2
		        B(iz,iy,x) = A(iy-dny,x,iz-dnz)
                     enddo
                  enddo
               enddo
            enddo 
	  enddo

	else

           do x=1,iisize
              do z=1,nz_fft,NBz
	         z2 = min(z+NBz-1,nz_fft)
            
                 do y=1,nyhc,NBy2
                    y2 = min(y+NBy2-1,nyhc)
                    do iz=z,z2
                        do iy=y,y2
			   C(iz,iy) = A(iy,x,iz)
                        enddo
                     enddo
                  enddo
                 do y=nyhc+dny+1,ny_fft,NBy2
                    y2 = min(y+NBy2-1,ny_fft)
                    do iz=z,z2
                        do iy=y,y2
			   C(iz,iy) = A(iy-dny,x,iz)
                        enddo
                     enddo
                  enddo
	       enddo

	      if(dnz .gt. 0) then	

   	         if(op(3:3) == 't' .or. op(3:3) == 'f') then
                    call exec_f_c2_same(C, 1,nz_fft, &
			  C, 1,nz_fft,nz_fft,nyc)
	         else if(op(3:3) == 'c') then	
                   call exec_ctrans_r2_complex_same(C, 2,2*nz_fft, & 
				  C, 2,2*nz_fft,nz_fft,nyc)
 	         else if(op(3:3) == 's') then	
                   call exec_strans_r2_complex_same(C, 2,2*nz_fft, & 
				  C, 2,2*nz_fft,nz_fft,nyc)
                 else 
	           print *,taskid,'Unknown transform type: ',op(3:3)
	           call MPI_abort(MPI_COMM_WORLD,ierr)
	         endif
	 	   do y=1,nyc
		      do z=1,nzhc
			B(z,y,x) = C(z,y)
		      enddo	
		      do z=nzhc+1,nzc
			B(z,y,x) = C(z+dnz,y)
		      enddo	
		   enddo
	      else
   	         if(op(3:3) == 't' .or. op(3:3) == 'f') then
                    call exec_f_c2_dif(C, 1,nz_fft, &
			  B(1,1,x), 1,nz_fft,nz_fft,nyc)
	         else if(op(3:3) == 'c') then	
                   call exec_ctrans_r2_complex_dif(C, 2,2*nz_fft, & 
				  B(1,1,x), 2,2*nz_fft,nz_fft,nyc)
 	         else if(op(3:3) == 's') then	
                   call exec_strans_r2_complex_dif(C, 2,2*nz_fft, & 
				  B(1,1,x), 2,2*nz_fft,nz_fft,nyc)
                 else 
	           print *,taskid,'Unknown transform type: ',op(3:3)
	           call MPI_abort(MPI_COMM_WORLD,ierr)
	         endif
	      endif
         enddo

      endif

      return
      end subroutine
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

!========================================================
! Transpose X and Y pencils

      subroutine fcomm1_many(source,dest,nv,t,tc)
!========================================================

      implicit none

      complex(mytype) source(nxhp,jisize,kjsize,nv)
      complex(mytype) dest(ny_fft,iisize,kjsize,nv)
	
      real(r8) t,tc
      integer x,y,i,ierr,z,xs,j,n,ix,iy,y2,x2,l,nv
      integer(i8) position,pos1,pos0,pos2
      integer sndcnts(0:iproc-1)
      integer rcvcnts(0:iproc-1)
      integer sndstrt(0:iproc-1)
      integer rcvstrt(0:iproc-1)
      complex(mytype) buf1(buf_size*nv), buf2(buf_size*nv)

!	if(taskid .eq. 0) then
!	  print *,'Entering fcomm1'
!        endif	
!	call print_buf(source,nxhp,jisize,kjsize)

! Pack the send buffer for exchanging y and x (within a given z plane ) into sendbuf

      tc = tc - MPI_Wtime()

      do i=0,iproc-1
         position = IfSndStrt(i) *nv/(mytype*2) + 1 
	do j=1,nv
           do z=1,kjsize
              do y=1,jisize
                 do x=iist(i),iien(i)
                    buf1(position) = source(x,y,z,j)
                    position = position +1
                 enddo               
              enddo
            enddo
	 enddo
      enddo
      tc = tc + MPI_Wtime()
      t = t - MPI_Wtime()

! Use MPI_Alltoallv
! Exchange the y-x buffers (in rows of processors)
      sndcnts = IfSndCnts * nv
      sndstrt = IfSndStrt * nv
      rcvcnts = IfRcvCnts * nv
      rcvstrt = IfRcvStrt * nv
      call mpi_alltoallv(buf1,SndCnts, SndStrt,mpi_byte, buf2,RcvCnts, RcvStrt,mpi_byte,mpi_comm_row,ierr)

      t = MPI_Wtime() + t
      tc = - MPI_Wtime() + tc

! Unpack the data

      do i=0,iproc-1

	do j=1,nv
         pos0 = (IfRcvStrt(i) * nv + (j-1) * IfRcvCnts(i))/(mytype*2) +1
         do z=1,kjsize
            pos1 = pos0 + (z-1)*iisize*jisz(i) 
            
            do y=jist(i),jien(i),nby1
               y2 = min(y+nby1-1,jien(i))
               do x=1,iisize,nbx
                  x2 = min(x+nbx-1,iisize)
                  pos2 = pos1 + x-1 
                  do iy = y,y2
                     position = pos2
                     do ix=x,x2
                        dest(iy,ix,z,j) = buf2(position)
                        position = position + 1
                     enddo
                     pos2 = pos2 + iisize
                  enddo
               enddo
               pos1 = pos1 + iisize*nby1
            enddo

         enddo
      enddo
      enddo

      tc = tc + MPI_Wtime()


      return
      end subroutine


      subroutine fcomm1(source,dest,t,tc)
!========================================================

      implicit none

      complex(mytype) source(nxhp,jisize,kjsize)
      complex(mytype) dest(ny_fft,iisize,kjsize)

      real(r8) t,tc
      integer x,y,i,ierr,z,xs,j,n,ix,iy,y2,x2,l
      integer(i8) position,pos1,pos0,pos2
      complex(mytype), allocatable :: buf1(:),buf2(:)
      integer threadid,omp_get_thread_num

!	if(taskid .eq. 0) then
!	  print *,'Entering fcomm1'
!        endif	
!	call print_buf(source,nxhp,jisize,kjsize)

! Pack the send buffer for exchanging y and x (within a given z plane ) into sendbuf

      tc = tc - MPI_Wtime()

     allocate(buf1(buf_size))
     allocate(buf2(buf_size))

      do i=0,iproc-1
         position = IfSndStrt(i)/(mytype*2) + 1 
         do z=1,kjsize
            do y=1,jisize
               do x=iist(i),iien(i)
                  buf1(position) = source(x,y,z)
                  position = position +1
               enddo               
            enddo
         enddo
      enddo
      tc = tc + MPI_Wtime()
      t = t - MPI_Wtime()

      threadid = OMP_GET_THREAD_NUM()
      print *,taskid,threadid,": Passed alltoall in fcomm1"
!$OMP FLUSH

!$OMP ordered

! Use MPI_Alltoallv
! Exchange the y-x buffers (in rows of processors)
      print *,taskid,threadid,": Calling alltoall in fcomm1"
!$OMP FLUSH

      call mpi_alltoallv(buf1,IfSndCnts, IfSndStrt,mpi_byte, buf2,IfRcvCnts, IfRcvStrt,mpi_byte,mpi_comm_row,ierr)

!$OMP end ordered

      print *,taskid,threadid,": Passed alltoall in fcomm1"
!$OMP FLUSH

      t = MPI_Wtime() + t
      tc = - MPI_Wtime() + tc

      deallocate(buf1)

! Unpack the data

      do i=0,iproc-1

         pos0 = IfRcvStrt(i)/(mytype*2)+1

         do z=1,kjsize
            pos1 = pos0 + (z-1)*iisize*jisz(i) 
            
            do y=jist(i),jien(i),nby1
               y2 = min(y+nby1-1,jien(i))
               do x=1,iisize,nbx
                  x2 = min(x+nbx-1,iisize)
                  pos2 = pos1 + x-1 
                  do iy = y,y2
                     position = pos2
                     do ix=x,x2
                        dest(iy,ix,z) = buf2(position)
                        position = position + 1
                     enddo
                     pos2 = pos2 + iisize
                  enddo
               enddo
               pos1 = pos1 + iisize*nby1
            enddo

         enddo
      enddo

	deallocate(buf2)
      tc = tc + MPI_Wtime()


      return
      end subroutine

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

!========================================================
! Transpose Y and Z pencils
! Assume Stride1 data structure

      subroutine fcomm2_trans(source,dest,op,t,tc)
!========================================================

      use fft_spec
      implicit none

! Assume stride1
      integer nz,dim_out
      complex(mytype) source(ny_fft,iisize,kjsize)
      complex(mytype) dest(nzc,jjsize,iisize)
!      complex(mytype) buf3(nz_fft,jjsize)
      complex(mytype), allocatable :: buf1(:),buf2(:)

      real(r8) t,tc
      integer x,z,y,i,ierr,xs,ys,y2,z2,iy,iz,ix,x2,n,sz,l,dny,dnz
      integer(i8) position,pos1,pos0,pos2
      integer threadid,omp_get_thread_num
      character(len=3) op
      integer sndcnts(0:jproc-1)
      integer rcvcnts(0:jproc-1)
      integer sndstrt(0:jproc-1)
      integer rcvstrt(0:jproc-1)


! Pack send buffers for exchanging y and z for all x at once 


      tc = tc - MPI_Wtime()

!      if(taskid .eq. 0) then
!         print *,'Entering fcomm2_trans; source='
!      endif
!      do j=1,nv
!      print *,taskid,':, j=',j
!      call print_buf(source(1,1,1,j),ny_fft,iisize,kjsize)
!      enddo


     allocate(buf1(buf_size))
     allocate(buf2(buf_size))

      threadid = OMP_GET_THREAD_NUM()
      print *,taskid,threadid,": Entered fcomm2_trans"
!$OMP FLUSH

     call pack_fcomm2_trans(buf1,source)

      tc = tc + MPI_Wtime()
! !$OMP BARRIER
      print *,taskid,threadid,": Passed barrier in fcomm2_trans"
!$OMP FLUSH
      t = t - MPI_Wtime()


!$OMP ORDERED

! Exchange y-z buffers in columns of processors

      print *,taskid,threadid,": Calling alltoall in fcomm2_trans"
!$OMP FLUSH
      call mpi_alltoallv(buf1,KfSndCnts, KfSndStrt,mpi_byte,buf2,KfRcvCnts, KfRcvStrt,mpi_byte,mpi_comm_col,ierr)

!$OMP END ORDERED

      print *,taskid,threadid,": Passed alltoall in fcomm2_trans"
!$OMP FLUSH


      t = MPI_Wtime() + t

	deallocate(buf1)

     if(jjsize .gt. 0) then

      tc = - MPI_Wtime() + tc
	
      call unpack_fcomm2_trans(dest,buf2,op)

      tc = tc + MPI_Wtime()

     endif


!      if(taskid .eq. 0) then
!         print *,'Exiting fcomm2_trans; dest='
!      endif
!      do j=1,nv
!      print *,taskid,':, j=',j
!      call print_buf(dest(1,1,1,j),nz_fft,jjsize,iisize)
!      enddo
	

	deallocate(buf2)
!	enddo	

      print *,taskid,threadid,": Exiting fcomm2_trans"
!$OMP FLUSH

      return
      end subroutine

!------------------------------------------------------------
      subroutine pack_fcomm2_trans(sendbuf,source)

      use fft_spec
      implicit none

      complex(mytype) source(ny_fft,iisize,kjsize)
      complex(mytype) sendbuf(ny_fft*iisize*kjsize)
      integer x,z,y,i,y2,z2,iy,iz,ix,x2,dny
      integer(i8) position,pos1,pos0,pos2
      integer threadid,OMP_GET_THREAD_NUM


      threadid = OMP_GET_THREAD_NUM()
      print *,taskid,threadid,": Entered pack_fcomm2_trans"
!$OMP FLUSH

      dny = ny_fft-nyc

      do i=0,jproc-1
         pos0 = KfSndStrt(i) /(mytype*2)+ 1 


! Pack the sendbuf, omitting the center ny-nyc elements in Y dimension

! If clearly in the first half of ny
         if(jjen(i) .le. nyhc) then
     	    do z=1,kjsize
               position = pos0 +(z-1)*jjsz(i)*iisize
               do x=1,iisize
                  do y=jjst(i),jjen(i)
                     sendbuf(position) = source(y,x,z)
                     position = position+1
                  enddo
               enddo	
            enddo

! If clearly in the second half of ny
         else if (jjst(i) .ge. nyhc+1) then
     	    do z=1,kjsize
               position = pos0 +(z-1)*jjsz(i)*iisize
               do x=1,iisize
                  do y=jjst(i)+dny,jjen(i)+dny
                     sendbuf(position) = source(y,x,z)
                     position = position+1
                  enddo
               enddo	
            enddo



! If spanning the first and second half of ny (e.g. iproc is odd)
         else
     	    do z=1,kjsize
               position = pos0 +(z-1)*jjsz(i)*iisize
               do x=1,iisize
                  do y=jjst(i),nyhc
                     sendbuf(position) = source(y,x,z)
                     position = position+1
                  enddo
                  do y=ny_fft-nyhc+1,jjen(i)+dny
                     sendbuf(position) = source(y,x,z)
                     position = position+1
                  enddo
               enddo	
            enddo
         endif

      enddo

      print *,taskid,threadid,": Exiting pack_fcomm2_trans"
!$OMP FLUSH

      return
      end subroutine

!------------------------------------------------------------
      subroutine unpack_fcomm2_trans(dest,recvbuf,op)

      use fft_spec
      implicit none

      complex(mytype) dest(nzc,jjsize,iisize)
      complex(mytype) buf3(nz_fft,jjsize)
      complex(mytype) recvbuf(nzc*jjsize*iisize)
      integer x,z,y,i,ierr,xs,ys,y2,z2,iy,iz,ix,x2,n,sz,l,dny,dnz,nz,dim_out
      integer(i8) position,pos1,pos0,pos2
      character(len=3) op

      nz = nz_fft
      if(nz .ne. nzc) then
	dnz = nz - nzc


      if(op(3:3) == '0' .or. op(3:3) == 'n') then

      do x=1,iisize
	pos0 = (x-1)*jjsize

         do i=0,jproc-1

 	      pos1 = pos0 + KfRcvStrt(i) / (mytype*2) 

           if(kjen(i) .lt. nzhc .or. kjst(i) .gt. nzhc+1) then
! Just copy the data
              do z=kjst(i),kjen(i),NBz
                 z2 = min(z+NBz-1,kjen(i))

                 do y=1,jjsize,NBy2
                    y2 = min(y+NBy2-1,jjsize)
                    pos2 = pos1 + y 

                    do iz=z,z2
                       position = pos2
                       do iy=y,y2
! Here we are sure that dest and buf are different
                         dest(iz,iy,x) = recvbuf(position)
                         position = position +1
                       enddo
                       pos2 = pos2 + iisize * jjsize
                    enddo
                 enddo
                 pos1 = pos1 + iisize*jjsize*NBz
              enddo

	    else 
! Copy some data, then insert zeros to restore full dimension, then again 
! copy some data if needed	
               do z=kjst(i),nzhc,NBz
       	          z2 = min(z+NBz-1,nzhc)

                 do y=1,jjsize,NBy2
                    y2 = min(y+NBy2-1,jjsize)
                    pos2 = pos1 + y 

                    do iz=z,z2
                       position = pos2
                       do iy=y,y2
! Here we are sure that dest and buf are different
                         dest(iz,iy,x) = recvbuf(position)
                         position = position +1
                       enddo
                       pos2 = pos2 + iisize * jjsize
                    enddo
                 enddo
                 pos1 = pos1 + iisize*jjsize*NBz
              enddo

	      pos0 = pos0 + iisize*jjsize*dnz
 	      pos1 = pos0 + KfRcvStrt(i) / (mytype*2) 

	      do z=nzhc+1,kjen(i),NBz
                 z2 = min(z+NBz-1,kjen(i))

                 do y=1,jjsize,NBy2
                    y2 = min(y+NBy2-1,jjsize)
                    pos2 = pos1 + y 

                    do iz=z,z2
                       position = pos2
                       do iy=y,y2
! Here we are sure that dest and buf are different
                         dest(iz,iy,x) = recvbuf(position)
                         position = position +1
                       enddo
                       pos2 = pos2 + iisize * jjsize
                    enddo
                 enddo
                 pos1 = pos1 + iisize*jjsize*NBz
              enddo
	   endif

	enddo

       enddo	

     else
 
       do x=1,iisize

         do i=0,jproc-1

	    pos0 = KfRcvStrt(i) / (mytype*2) + (x-1)*jjsize

            do z=kjst(i),kjen(i),NBz
               z2 = min(z+NBz-1,kjen(i))
            
               do y=1,jjsize,NBy2
                  y2 = min(y+NBy2-1,jjsize)

                  pos1 = pos0 +y

                  do iz=z,z2
                     position = pos1 
                     do iy=y,y2
! Here we are sure that dest and buf are different
                        buf3(iz,iy) = recvbuf(position)
                        position = position + 1
                     enddo
                     pos1 = pos1 + iisize * jjsize
                  enddo
               enddo
               pos0 = pos0 + jjsize*iisize*NBz
           enddo 
       enddo	

	if(op(3:3) == 't' .or. op(3:3) == 'f') then
             call exec_f_c2_same(buf3, 1,nz_fft, &
			  buf3, 1,nz_fft,nz_fft,jjsize)
	else if(op(3:3) == 'c') then	
             call exec_ctrans_r2_complex_same(buf3, 2,2*nz_fft, &
			  buf3, 2,2*nz_fft,nz_fft,jjsize)
	else if(op(3:3) == 's') then	
             call exec_strans_r2_complex_same(buf3, 2,2*nz_fft, &
		          buf3, 2,2*nz_fft,nz_fft,jjsize)
 	else
	   print *,taskid,'Unknown transform type: ',op(3:3)
	   call MPI_abort(MPI_COMM_WORLD,ierr)
	endif

	do y=1,jjsize	
	   do z=1,nzhc
	      dest(z,y,x) = buf3(z,y)
	   enddo
	   do z=nzhc+1,nzc
	      dest(z,y,x) = buf3(z+dnz,y)
	   enddo
	enddo

      enddo
      endif
      else  ! if nz = nzc

      if(op(3:3) == '0' .or. op(3:3) == 'n') then

      do x=1,iisize

         do i=0,jproc-1

	   pos0 = KfRcvStrt(i) / (mytype*2) + (x-1)*jjsize

            do z=kjst(i),kjen(i),NBz
               z2 = min(z+NBz-1,kjen(i))
            
               do y=1,jjsize,NBy2
                  y2 = min(y+NBy2-1,jjsize)

                  pos1 = pos0 +y

                  do iz=z,z2
                     position = pos1 
                     do iy=y,y2
! Here we are sure that dest and buf are different
                        dest(iz,iy,x) = recvbuf(position)
                        position = position + 1
                     enddo
                     pos1 = pos1 + iisize * jjsize
                  enddo
               enddo
               pos0 = pos0 + jjsize*iisize*NBz
           enddo 
        enddo
      enddo

      else
      
      do x=1,iisize

         do i=0,jproc-1

	   pos0 = KfRcvStrt(i) / (mytype*2) + (x-1)*jjsize

            do z=kjst(i),kjen(i),NBz
               z2 = min(z+NBz-1,kjen(i))
            
               do y=1,jjsize,NBy2
                  y2 = min(y+NBy2-1,jjsize)

                  pos1 = pos0 +y

                  do iz=z,z2
                     position = pos1 
                     do iy=y,y2
! Here we are sure that dest and buf are different
                        buf3(iz,iy) = recvbuf(position)
                        position = position + 1
                     enddo
                     pos1 = pos1 + iisize * jjsize
                  enddo
               enddo
               pos0 = pos0 + jjsize*iisize*NBz
            enddo
         enddo

	if(op(3:3) == 't' .or. op(3:3) == 'f') then
             call exec_f_c2_dif(buf3, 1,nz_fft, &
			  dest(1,1,x), 1,nz_fft,nz_fft,jjsize)
	else if(op(3:3) == 'c') then	
             call exec_ctrans_r2_complex_dif(buf3, 2,2*nz_fft, &
			  dest(1,1,x), 2,2*nz_fft,nz_fft,jjsize)
	else if(op(3:3) == 's') then	
             call exec_strans_r2_complex_dif(buf3, 2,2*nz_fft, &
		          dest(1,1,x), 2,2*nz_fft,nz_fft,jjsize)
 	else
	   print *,taskid,'Unknown transform type: ',op(3:3)
	   call MPI_abort(MPI_COMM_WORLD,ierr)
	endif

      enddo

      endif
      endif

      return
      end subroutine

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

!========================================================
! Transpose back Z to Y pencils
! Assumes stride1 data structure

      subroutine bcomm1_trans (source,dest,op,t,tc)
!========================================================

      use fft_spec
      implicit none

      integer j,nv,nz,dim,ierr
! Assume 1
      complex(mytype) source(nzc,jjsize,iisize)
      complex(mytype) dest(ny_fft,iisize,kjsize)
      complex(mytype), allocatable :: buf1(:), buf2(:)

      real(r8) t,tc
      character(len=3) op

      nz = nz_fft

!     Pack the data for sending
      
      tc = tc - MPI_Wtime()

        allocate(buf1(buf_size))
        allocate(buf2(buf_size))

        if(jjsize .gt. 0) then
          call pack_bcomm1_trans(buf1,source,op)     
        endif

      tc = tc + MPI_Wtime()
      t = t - MPI_Wtime() 

!$OMP ORDERED


      call mpi_alltoallv(buf1,JrSndCnts, JrSndStrt,mpi_byte, buf2,JrRcvCnts, JrRcvStrt,mpi_byte,mpi_comm_col,ierr)
!$OMP END ORDERED

      t = t + MPI_Wtime() 
      tc = tc - MPI_Wtime()

      deallocate(buf1)
      call unpack_bcomm1_trans(dest,buf2)

      deallocate(buf2)

      tc = tc + MPI_Wtime()
      
      return
      end subroutine



!-------------------------------------------------------
      subroutine pack_bcomm1_trans(sendbuf,source,op)

      implicit none

      complex(mytype) source(nzc,jjsize,iisize)
      complex(mytype) buf3(nz_fft,jjsize)
      complex(mytype) sendbuf(buf_size)

      integer nz,dnz,i,x,y,z,iz,iy,z2,y2,ierr
      integer*8 position,pos0,pos1,pos2
      character(len=3) op

      nz = nz_fft

      dnz = nz - nzc
      if(op(1:1) == '0' .or. op(1:1) == 'n') then

         do x=1,iisize
            do i=0,jproc-1
            
               pos0 = JrSndStrt(i) / (mytype*2) + (x-1)*jjsize 
	       
	       pos1 = pos0

	       if(kjen(i) .lt. nzhc .or. kjst(i) .gt. nzhc+1) then
! Just copy the data
	           do z=kjst(i),kjen(i),NBz
        	      z2 = min(z+NBz-1,kjen(i))

              		do y=1,jjsize,NBy2
                	   y2 = min(y+NBy2-1,jjsize)
                    
                 	   pos2 = pos1 +y
                     
	                   do iz=z,z2
           	              position = pos2 
                 	      do iy=y,y2
! Here we are sure that dest and buf are different
                      	         sendbuf(position) = source(iz,iy,x)
                       	         position = position + 1
                    	      enddo
                    	   pos2 = pos2 + iisize * jjsize
                        enddo
                     enddo
                     pos1 = pos1 + iisize*jjsize*NBz
	          enddo
	    else 
! Copy some data, then insert zeros to restore full dimension, then again 
! copy some data if needed	
	           do z=kjst(i),nzhc,NBz
        	      z2 = min(z+NBz-1,nzhc)

              		do y=1,jjsize,NBy2
                	   y2 = min(y+NBy2-1,jjsize)
                    
                 	   pos2 = pos1 +y
                     
	                   do iz=z,z2
           	              position = pos2 
                 	      do iy=y,y2
! Here we are sure that dest and buf are different
                      	         sendbuf(position) = source(iz,iy,x)
                       	         position = position + 1
                    	      enddo
                    	   pos2 = pos2 + iisize * jjsize
                        enddo
                     enddo
                     pos1 = pos1 + iisize*jjsize*NBz
	          enddo

                  pos1 = pos0 + (nzhc-kjst(i)+1)*iisize*jjsize
		  do z=1,dnz
		    position = pos1
		    do y=1,jjsize
			sendbuf(position) = 0.
		        position = position +1
		    enddo
		    pos1 = pos1 + iisize*jjsize
		  enddo

	          do z=nzhc+1,kjen(i),NBz
        	      z2 = min(z+NBz-1,kjen(i))

              		do y=1,jjsize,NBy2
                	   y2 = min(y+NBy2-1,jjsize)
                    
                 	   pos2 = pos1 +y
                     
	                   do iz=z,z2
           	              position = pos2 
                 	      do iy=y,y2
! Here we are sure that dest and buf are different
                      	         sendbuf(position) = source(iz,iy,x)
                       	         position = position + 1
                    	      enddo
                    	   pos2 = pos2 + iisize * jjsize
                           enddo
                        enddo
                        pos1 = pos1 + iisize*jjsize*NBz
	           enddo
	        endif
	        pos0 = pos0 + iisize*jjsize*kjsz(i)
	     enddo
         enddo

      else
         do x=1,iisize

	    if(nz .ne. nzc) then

	       do y=1,jjsize
                  do z=1,nzhc
		     buf3(z,y) = source(z,y,x)
	          enddo
	          do z=nzhc+1,nzhc+dnz
		     buf3(z,y) = 0.
	          enddo
	          do z=nzhc+dnz+1,nz_fft
		     buf3(z,y) = source(z-dnz,y,x)
 	          enddo
	       enddo

   	       if(op(1:1) == 't' .or. op(1:1) == 'f') then
                call exec_b_c2_same(buf3, 1,nz_fft, &
				  buf3, 1,nz_fft,nz_fft,jjsize)
 	       else if(op(1:1) == 'c') then	
                   call exec_ctrans_r2_complex_same(buf3, 2,2*nz_fft, & 
				  buf3, 2,2*nz_fft,nz_fft,jjsize)
 	       else if(op(1:1) == 's') then	
                   call exec_strans_r2_complex_same(buf3, 2,2*nz_fft, & 
				  buf3, 2,2*nz_fft,nz_fft,jjsize)
	       else
		   print *,taskid,'Unknown transform type: ',op(1:1)
		   call MPI_abort(MPI_COMM_WORLD,ierr)
	       endif

	    else

     	       if(op(1:1) == 't' .or. op(1:1) == 'f') then
                  call exec_b_c2_dif(source(1,1,x), 1,nz_fft, &
				  buf3, 1,nz_fft,nz_fft,jjsize)
 	       else if(op(1:1) == 'c') then	
                   call exec_ctrans_r2_complex_dif(source(1,1,x), 2,2*nz_fft, & 
				  buf3, 2,2*nz_fft,nz_fft,jjsize)
 	       else if(op(1:1) == 's') then	
                   call exec_strans_r2_complex_dif(source(1,1,x), 2,2*nz_fft, & 
				  buf3, 2,2*nz_fft,nz_fft,jjsize)
	       else
		   print *,taskid,'Unknown transform type: ',op(1:1)
		   call MPI_abort(MPI_COMM_WORLD,ierr)
	       endif

	    endif
         
            do i=0,jproc-1
            

               pos0 = JrSndStrt(i) / (mytype*2) + (x-1)*jjsize 
	       pos1 = pos0 
               do z=kjst(i),kjen(i),NBz
                  z2 = min(z+NBz-1,kjen(i))

                  do y=1,jjsize,NBy2
                     y2 = min(y+NBy2-1,jjsize)
                     
                     pos2 = pos1 +y
                     
                     do iz=z,z2
                        position = pos2 
                        do iy=y,y2
! Here we are sure that dest and buf are different
                           sendbuf(position) = buf3(iz,iy)
                           position = position + 1
                        enddo
                        pos2 = pos2 + iisize * jjsize
                     enddo
                  enddo
               pos1 = pos1 + iisize*jjsize*NBz
               enddo
	       pos0 = pos0 + iisize*jjsize*kjsz(i)
	       enddo

            enddo

	endif

	return
	end subroutine



      subroutine unpack_bcomm1_trans(dest,recvbuf)

      use fft_spec
      implicit none

      complex(mytype) dest(ny_fft,iisize,kjsize)
      complex(mytype) recvbuf(buf_size)

      integer x,y,z,i,ierr,xs,ys,iy,y2,z2,ix,x2,n,iz,dny,dnz
      integer(i8) position,pos1,pos0

! Unpack receive buffers into dest

      dny = ny_fft - nyc
      do i=0,jproc-1
         pos0 = KfSndStrt(i)/(mytype*2)+ 1 
	 do z=1,kjsize
            pos1 = pos0
            do x=1,iisize
               position = pos1
! If clearly in the first half of ny
               if(jjen(i) .le. nyhc) then
                  do y=jjst(i),jjen(i)
                     dest(y,x,z) = recvbuf(position) 
                     position = position+1
                  enddo
! If clearly in the second half of ny
               else if (jjst(i) .ge. nyhc+1) then
                  do y=jjst(i)+dny,jjen(i)+dny
                     dest(y,x,z) = recvbuf(position)
                     position = position +1
                  enddo

! If spanning the first and second half of nz (i.e. jproc is odd)  
              else
                  do y=jjst(i),nyhc
                     dest(y,x,z) = recvbuf(position)
                     position = position +1
   		  enddo
                  do y=ny_fft-nyhc+1,jjen(i)+dny
                     dest(y,x,z) = recvbuf(position)
                     position = position +1
                  enddo
               endif
               pos1 = pos1 + jjsz(i)
            enddo
            pos0 = pos0 + jjsz(i)*iisize
         enddo
      enddo

! Fill center in Y with zeros
      if(dny .ne. 0) then	
         do z=1,kjsize
            do x=1,iisize
               do y=nyhc+1,ny_fft-nyhc
	          dest(y,x,z) = 0.0
               enddo
            enddo
         enddo
      endif

      return
      end subroutine
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

!========================================================
! Transpose back Y to X pencils

      subroutine bcomm2_many(source,dest,nv,t,tc)
!========================================================

      implicit none

      complex(mytype) dest(nxhp,jisize,kjsize,nv)
      complex(mytype) source(ny_fft,iisize,kjsize,nv)
      real(r8) t,tc
      integer x,y,z,i,ierr,ix,iy,x2,y2,l,j,nv,dim
      integer(i8) position,pos1,pos0,pos2
      integer sndcnts(0:iproc-1)
      integer rcvcnts(0:iproc-1)
      integer sndstrt(0:iproc-1)
      integer rcvstrt(0:iproc-1)
      complex(mytype) buf1(buf_size*nv), buf2(buf_size*nv)

      tc = tc - MPI_Wtime()

! Pack and exchange x-z buffers in rows
      
      do i=0,iproc-1

	do j=1,nv

         pos0 = (KrSndStrt(i) * nv + (j-1) * KrSndCnts(i))/(mytype*2) +1

         do z=1,kjsize
            
            pos1 = pos0
            do y=jist(i),jien(i),nby1
               y2 = min(y+nby1-1,jien(i))
               do x=1,iisize,nbx
                  x2 = min(x+nbx-1,iisize)
                  pos2 = pos1 + x-1 
                  do iy = y,y2
                     position = pos2
                     do ix=x,x2
                        buf1(position) = source(iy,ix,z,j)
                        position = position + 1
                     enddo
                     pos2 = pos2 + iisize
                  enddo
               enddo
               pos1 = pos1 + iisize*nby1
            enddo


            pos0 = pos0 + iisize*jisz(i)
         enddo
      enddo
      enddo

      tc = tc + MPI_Wtime() 
      t = t - MPI_Wtime() 

      sndcnts = KrSndCnts * nv
      sndstrt = KrSndStrt * nv
      rcvcnts = KrRcvCnts * nv
      rcvstrt = KrRcvStrt * nv

      call mpi_alltoallv (buf1,SndCnts, SndStrt, mpi_byte, buf2,RcvCnts,RcvStrt,mpi_byte,mpi_comm_row,ierr)

      t = t + MPI_Wtime() 
      tc = tc - MPI_Wtime()

! Unpack receive buffers into dest

      do i=0,iproc-1

         pos0 = IfSndStrt(i)*nv/(mytype*2) + 1

	do j=1,nv
         do z=1,kjsize
            position = pos0 
            do y=1,jisize
               do x=iist(i),iien(i)
                  dest(x,y,z,j) = buf2(position)
                  position = position +1
               enddo
            enddo
            pos0 = pos0 + iisz(i)*jisize
         enddo
	 enddo
      enddo
      do j=1,nv
      do z=1,kjsize
         do y=1,jisize
	    do x=nxhpc+1,nxhp
	       dest(x,y,z,j) = 0.
	    enddo
	 enddo	
      enddo
      enddo

      tc = tc + MPI_Wtime() 
      
      return
      end subroutine

      subroutine bcomm2(source,dest,t,tc)
!========================================================

      implicit none

      complex(mytype) dest(nxhp,jisize,kjsize)
      complex(mytype) source(ny_fft,iisize,kjsize)
      real(r8) t,tc
      integer x,y,z,i,ierr,ix,iy,x2,y2,l
      integer(i8) position,pos1,pos0,pos2
      complex(mytype), allocatable :: buf1(:),buf2(:)

      tc = tc - MPI_Wtime()

! Pack and exchange x-z buffers in rows

     allocate(buf1(buf_size))
     allocate(buf2(buf_size))
      
      do i=0,iproc-1


         pos0 = IfRcvStrt(i)/(mytype*2)+1

         do z=1,kjsize
            
            pos1 = pos0
            do y=jist(i),jien(i),nby1
               y2 = min(y+nby1-1,jien(i))
               do x=1,iisize,nbx
                  x2 = min(x+nbx-1,iisize)
                  pos2 = pos1 + x-1 
                  do iy = y,y2
                     position = pos2
                     do ix=x,x2
                        buf1(position) = source(iy,ix,z)
                        position = position + 1
                     enddo
                     pos2 = pos2 + iisize
                  enddo
               enddo
               pos1 = pos1 + iisize*nby1
            enddo


            pos0 = pos0 + iisize*jisz(i)
         enddo
      enddo

      tc = tc + MPI_Wtime() 
      t = t - MPI_Wtime() 

! !$OMP BARRIER

!$OMP ordered

      call mpi_alltoallv (buf1,KrSndCnts, KrSndStrt, mpi_byte, buf2,KrRcvCnts,KrRcvStrt,mpi_byte,mpi_comm_row,ierr)

!$OMP end ordered

      deallocate(buf1)

      t = t + MPI_Wtime() 
      tc = tc - MPI_Wtime()

! Unpack receive buffers into dest

      do i=0,iproc-1
         pos0 = IfSndStrt(i)/(mytype*2) + 1
         do z=1,kjsize
            position = pos0 
            do y=1,jisize
               do x=iist(i),iien(i)
                  dest(x,y,z) = buf2(position)
                  position = position +1
               enddo
            enddo
            pos0 = pos0 + iisz(i)*jisize
         enddo
      enddo
      do z=1,kjsize
         do y=1,jisize
	    do x=nxhpc+1,nxhp
	       dest(x,y,z) = 0.
	    enddo
	 enddo	
      enddo

      deallocate(buf2)
      tc = tc + MPI_Wtime() 
      
      return
      end subroutine
!#include "wrap.F90"
!#include "ghost_cell.F90"

!=====================================================
! Return array dimensions for either real-space (conf=1) or wavenumber-space(conf=2)
! 
      subroutine p3dfft_get_dims_w(istart,iend,isize,conf) BIND(C,NAME='p3dfft_get_dims')
      integer istart(3),iend(3),isize(3),conf

      call p3dfft_get_dims(istart,iend,isize,conf) 

      end subroutine

      subroutine p3dfft_get_dims(istart,iend,isize,conf) 
!=====================================================

      integer istart(3),iend(3),isize(3),conf
      
      if(.not. mpi_set) then
         print *,'P3DFFT error: call setup before other routines'
      else

      if(conf .eq. 1) then
         istart(1) = 1
         iend(1) = NX_fft
         isize(1) = NX_fft
         istart(2) = jistart
         iend(2) = jiend
         isize(2) = jisize
         istart(3) = kjstart
         iend(3) = kjend
         isize(3) = kjsize
      else if(conf .eq. 2) then
         istart(3) = iistart
         iend(3) = iiend
         isize(3) = iisize
         istart(2) = jjstart
         iend(2) = jjend
         isize(2) = jjsize
         istart(1) = 1
         iend(1) = NZc
         isize(1) = NZc
        else if (conf == 3) then
          istart = (/ 0, 0, 0 /)
          iend = (/ maxisize, maxjsize, maxksize /)
          isize = (/ maxisize, maxjsize, maxksize /)
      endif

      endif
      end subroutine p3dfft_get_dims

! --------------------------------------
!
!  get_mpi_info
!
! --------------------------------------
    subroutine p3dfft_get_mpi_info (mpi_taskid, mpi_tasks, mpi_comm)
      implicit none
 
!         function args
      integer, intent (out) :: mpi_taskid
      integer, intent (out) :: mpi_tasks
      integer, intent (out) :: mpi_comm
 
      if ( .not. mpi_set) then
        print *, 'P3DFFT error: call setup before other routines'
        return
      end if
 
      mpi_taskid = taskid
      mpi_tasks = numtasks
      mpi_comm = mpi_comm_cart
 
    end subroutine 	

!========================================================
      subroutine p3dfft_clean_w() BIND(C,NAME='p3dfft_clean')

      call p3dfft_clean

      end subroutine 

      subroutine p3dfft_clean() 

!!--------------------------------------------------------------
! Clean-up routines for FFTW

      use fft_spec

      deallocate(caux1)      
      deallocate(caux2)
      deallocate(raux1)
      deallocate(raux2)

!      deallocate(buf1)
!      deallocate(buf2)
!      deallocate(buf)

    deallocate (iist)
    deallocate (iisz)
    deallocate (iien)
    deallocate (jjst)
    deallocate (jjsz)
    deallocate (jjen)
    deallocate (jist)
    deallocate (jisz)
    deallocate (jien)
    deallocate (kjst)
    deallocate (kjsz)
    deallocate (kjen)
  
    deallocate (IfSndStrt)
    deallocate (IfSndCnts)
    deallocate (IfRcvStrt)
    deallocate (IfRcvCnts)
    deallocate (KfSndStrt)
    deallocate (KfSndCnts)
    deallocate (KfRcvStrt)
    deallocate (KfRcvCnts)
    deallocate (JrSndStrt)
    deallocate (JrSndCnts)
    deallocate (JrRcvStrt)
    deallocate (JrRcvCnts)
    deallocate (KrSndStrt)
    deallocate (KrSndCnts)
    deallocate (KrRcvStrt)
    deallocate (KrRcvCnts)
 
    deallocate (IiCnts)
    deallocate (IiStrt)
    deallocate (IjCnts)
    deallocate (IjStrt)
    deallocate (JiCnts)
    deallocate (JiStrt)
    deallocate (KjCnts)
    deallocate (KjStrt)
 
    deallocate (proc_id2coords)
    deallocate (proc_coords2id)
    deallocate (proc_dims)
    deallocate (proc_parts)
 
    mpi_set = .false.

      return
      end subroutine

!========================================================
      subroutine ar_copy_many(A,dim_a,B,dim_b,nar,nv)

      integer(i8) nar,i
      integer dim_a,dim_b,nv,j
      complex(mytype) A(dim_a,nv),B(dim_b,nv)

      do j=1,nv
         call ar_copy(A(1,j),B(1,j),nar)
      enddo
      
      return
      end subroutine


      subroutine ar_copy(A,B,nar)

      integer(i8) nar,i
      complex(mytype) A(nar,1,1),B(nar,1,1)

      do i=1,nar
         B(i,1,1)=A(i,1,1)
      enddo

      return
      end subroutine

      subroutine seg_zero_z_many(A,xdim,ydim,z1,z2,zdim,dim,nv)

      implicit none
      integer x,y,z,xdim,ydim,zdim,z1,z2,nv,j,dim
      complex(mytype) A(dim,nv)

      do j=1,nv
         call seg_zero_z(A(1,j),xdim,ydim,z1,z2,zdim)
      enddo

      return
      end subroutine

      subroutine seg_zero_z(A,xdim,ydim,z1,z2,zdim)

      implicit none
      integer x,y,z,xdim,ydim,zdim,z1,z2
      complex(mytype) A(xdim,ydim,zdim)

      do z=z1,z2
         do y=1,ydim
	    do x=1,xdim
	       A(x,y,z) = 0.
	    enddo
	 enddo
      enddo

      return
      end subroutine seg_zero_z

    subroutine seg_copy_z_f_many(in,out,x1,x2,y1,y2,z1,z2,shift_z,xdim,ydim,zdim,dim,nv)

    implicit none
    integer x1,x2,y1,y2,z1,z2,xdim,ydim,zdim,shift_z,x,y,z,nv,j,dim
    complex(mytype) in(xdim,ydim,zdim,nv), out(dim,nv)

    do j=1,nv
      call seg_copy_z(in(1,1,1,j),out(1,j),x1,x2,y1,y2,z1,z2,shift_z,xdim,ydim,zdim)    
    enddo

    return
    end subroutine

    subroutine seg_copy_z_b_many(in,out,x1,x2,y1,y2,z1,z2,shift_z,xdim,ydim,zdim,dim,nv)

    implicit none
    integer x1,x2,y1,y2,z1,z2,xdim,ydim,zdim,shift_z,x,y,z,nv,j,dim
    complex(mytype) out(xdim,ydim,zdim,nv), in(dim,nv)

    do j=1,nv
      call seg_copy_z(in(1,j),out(1,1,1,j),x1,x2,y1,y2,z1,z2,shift_z,xdim,ydim,zdim)    
    enddo

    return
    end subroutine

    subroutine seg_copy_z(in,out,x1,x2,y1,y2,z1,z2,shift_z,xdim,ydim,zdim)

    implicit none
    integer x1,x2,y1,y2,z1,z2,xdim,ydim,zdim,shift_z,x,y,z
    complex(mytype) in(xdim,ydim,zdim), out(xdim,ydim,zdim)


    do z=z1,z2
       do y=y1,y2
          do x=x1,x2
	     out(x,y,z) = in(x,y,z+shift_z)
	  enddo	
        enddo	
    enddo

    return
    end subroutine seg_copy_z


!========================================================

      subroutine get_timers_w(timer) BIND(C,name='get_timers')

      real(r8) timer(12)

      call get_timers(timer)

      return
      end subroutine

      subroutine set_timers_w() BIND(C,name='set_timers')

      call set_timers

      return
      end subroutine

      subroutine get_timers(timer)
         real(r8) timer(12)
         timer(1) = timers(1)
         timer(2) = timers(2)
         timer(3) = timers(3)
         timer(4) = timers(4)
         timer(5) = timers(5)
         timer(6) = timers(6)
         timer(7) = timers(7)
         timer(8) = timers(8)
         timer(9) = timers(9)
         timer(10) = timers(10)
         timer(11) = timers(11)
         timer(12) = timers(12)
      end subroutine

      subroutine set_timers()
         timers = 0
      end subroutine

!========================================================
      subroutine print_buf(A,lx,ly,lz)

      complex(mytype) A(lx,ly,lz)
      integer lx,ly,lz,i,j,k
      
      do k=1,lz
         do j=1,ly
            do i=1,lx
               if(abs(A(i,j,k)) .gt. 0.0000005) then
                  print *,taskid,': (',i,j,k,') =',A(i,j,k)
               endif
            enddo
         enddo
      enddo

      end subroutine

! --------------------------------------
!
!  proc_neighb(..)
!
! --------------------------------------
  function proc_neighb (base_proc_id, orient, direction)
    implicit none
 
!         function args
    integer, intent (in) :: base_proc_id, orient, direction
    integer :: proc_neighb
 
    integer :: coord_i, coord_j
 
    proc_neighb = - 1
 
!         check input
    if (base_proc_id < 0 .or. base_proc_id >= iproc*jproc) then
      return
    end if
    if (orient /= 1 .and. orient /=-1) then
      return
    end if
    if (direction /= 1 .and. direction /= 2) then
      return
    end if
 
    coord_i = proc_id2coords (base_proc_id*2)
    coord_j = proc_id2coords (base_proc_id*2+1)
 
!         direction=1:i, direction=2:j, orient=-1 or 1
    if (direction == 1 .and. &
       (coord_i+orient) >= 0 .and. &
       (coord_i+orient) <= iproc) then
    proc_neighb = proc_coords2id (coord_i+orient, coord_j)
  else if (direction == 2 .and. &
       (coord_j+orient) >= 0 .and. &
       (coord_j+orient) <= jproc) then
    proc_neighb = proc_coords2id (coord_i, coord_j+orient)
  end if
 
  return
end function proc_neighb
 
! --------------------------------------
!
!  search_proc(..)
!
! --------------------------------------
function search_proc (point_i, point_j, dimI_offset, dimJ_offset, conf)
  implicit none
 
!         function args
  integer, intent (in) :: point_i, point_j, dimI_offset, dimJ_offset
  integer, intent (in) :: conf
  integer :: search_proc
 
  integer :: proc_id
 
  search_proc = - 1
 
!         check input
  if (dimI_offset < 1 .or. dimI_offset > 3 .or. &
      dimJ_offset < 1 .or. dimJ_offset > 3 .or. &
      conf < 1 .or. conf > 2) then
    return
  end if
 
  proc_id = proc_coords2id (0, 0)
 
!         search in direction i
  do
    if (point_i < proc_dims(conf, dimI_offset, proc_id)+proc_dims(conf, dimI_offset+6, proc_id)) then
      exit
    else
!             search for the next proc in i-direction
      proc_id = proc_neighb (proc_id, 1, 1)
      if (proc_id < 0) then
        return
      end if
    end if
  end do
 
!         search in direction j
  do
    if (point_j < proc_dims(conf, dimJ_offset, proc_id)+proc_dims(conf, dimJ_offset+6, proc_id)) then
      exit
    else
!             search for the next proc in j-direction
      proc_id = proc_neighb (proc_id, 1, 2)
      if (proc_id < 0) then
        return
      end if
    end if
  end do
 
  search_proc = proc_id
  return
end function search_proc
 
! --------------------------------------
!
!  get_proc_parts(..)
!
! --------------------------------------
subroutine get_proc_parts (base_x, base_y, base_z, size_x, size_y, size_z, conf, ierr)
  implicit none
 
!         function args
  integer, intent (in) :: base_x, base_y, base_z
  integer, intent (in) :: size_x, size_y, size_z
  integer, intent (in) :: conf
  integer, intent (out) :: ierr
 
!         other vars
  integer :: base_i, base_j, base_k
  integer :: size_i, size_j, size_k
  integer :: dimI_offset, dimJ_offset
  integer :: no_parts, p
 
  integer :: found_proc_id
  integer :: end_of_dim_i, end_of_dim_j
  integer :: size_i_exist
  integer :: start_base_j, start_size_j, start_id_j
 
  ierr = 0
  proc_parts = - 1
 
!    int s,t;
!         pencil in X-dimension (physical space)
  if (conf == 1) then
    base_i = base_y
    base_j = base_z
    base_k = base_x
    size_i = size_y
    size_j = size_z
    size_k = size_x
    dimI_offset = 2
    dimJ_offset = 3
 
!         pencil in Z-dimension (fourier space)
  else if (conf == 2) then
    base_i = base_x
    base_j = base_y
    base_k = base_z
    size_i = size_x
    size_j = size_y
    size_k = size_z
    dimI_offset = 1
    dimJ_offset = 2
 
  else
    ierr = 1
    return
  end if
 
!         find the proc, which contain the base point, this proc will be as start search point
  found_proc_id = search_proc (base_i, base_j, dimI_offset, dimJ_offset, conf)
  if (found_proc_id < 0) then
    ierr = - 1
    return
  end if
 
  no_parts = 0
  end_of_dim_i = 0
  end_of_dim_j = 0
 
!         start to check which proc is contained, write the result in proc_partsbackup in i,j,k system
  do while (end_of_dim_i ==  0)
    no_parts = no_parts + 1
    proc_parts (no_parts, 1) = found_proc_id
 
    start_id_j = found_proc_id
    start_base_j = base_j
    start_size_j = size_j
 
!           dim-i
!           check if it is contained in one proc on i dim
    if (base_i+size_i <= proc_dims(conf, dimI_offset, found_proc_id) &
                        +proc_dims(conf, dimI_offset+6, found_proc_id)) then
      proc_parts (no_parts, 2) = base_i
      proc_parts (no_parts, 5) = size_i
      end_of_dim_i = 1
    else
      proc_parts (no_parts, 2) = base_i
      proc_parts (no_parts, 5) = proc_dims (conf, dimI_offset, found_proc_id) &
                               + proc_dims (conf, dimI_offset+6, found_proc_id) -base_i
!                 compute the new base point and length in the proc
      size_i = base_i + size_i - proc_dims (conf, dimI_offset, found_proc_id) - proc_dims (conf, dimI_offset+6, found_proc_id)
      base_i = proc_dims (conf, dimI_offset, found_proc_id) + proc_dims (conf, dimI_offset+6, found_proc_id)
    end if
 
!           dim-k
    proc_parts (no_parts, 4) = base_k
    proc_parts (no_parts, 7) = size_k
 
!           dim-j
    end_of_dim_j = 0
    size_i_exist = 1
    base_j = start_base_j
    size_j = start_size_j
    do while (end_of_dim_j ==  0)
      if (size_i_exist == 1) then
!               use the old values of i,k stuff
        size_i_exist = 0
      else
        no_parts = no_parts + 1
 
!                the values are copied from last proc data in array
        proc_parts (no_parts, 1) = found_proc_id
        proc_parts (no_parts, 4) = proc_parts (no_parts-1, 4)
        proc_parts (no_parts, 5) = proc_parts (no_parts-1, 5)
        proc_parts (no_parts, 7) = proc_parts (no_parts-1, 7)
      end if
 
      if (base_j+size_j <= proc_dims(conf, dimJ_offset, found_proc_id) &
                         + proc_dims(conf, dimJ_offset+6, found_proc_id)) then
        proc_parts (no_parts, 3) = base_j
        proc_parts (no_parts, 6) = size_j
        end_of_dim_j = 1
      else
        proc_parts (no_parts, 3) = base_j
        proc_parts (no_parts, 6) = proc_dims (conf, dimJ_offset, found_proc_id) &
                                 + proc_dims (conf, dimJ_offset+6, found_proc_id) - base_j
!                     compute the new base point and length in the proc
        size_j = base_j + size_j - proc_dims (conf, dimJ_offset, found_proc_id) - proc_dims (conf, dimJ_offset+6, found_proc_id)
        base_j = proc_dims (conf, dimJ_offset, found_proc_id) + proc_dims (conf, dimJ_offset+6, found_proc_id)
      end if
 
      if (end_of_dim_j == 0) then
        found_proc_id = proc_neighb (found_proc_id, 1, 2)
        if (found_proc_id < 0) exit
      end if
    end do
 
    if (end_of_dim_i == 0) then
      found_proc_id = proc_neighb (start_id_j, 1, 1)
      if (found_proc_id < 0) exit
    end if
 
  end do
 
!         transform the result from i,j,k system to x,y,z system according to the style
  do p = 0, (iproc*jproc)
    base_i = proc_parts (p, 2)
    base_j = proc_parts (p, 3)
    base_k = proc_parts (p, 4)
    size_i = proc_parts (p, 5)
    size_j = proc_parts (p, 6)
    size_k = proc_parts (p, 7)
 
!           physical space
    if (conf == 1) then
      proc_parts (p, 2) = base_k
      proc_parts (p, 3) = base_i
      proc_parts (p, 4) = base_j
      proc_parts (p, 5) = size_k
      proc_parts (p, 6) = size_i
      proc_parts (p, 7) = size_j
 
!           fourier space (no translation nessessary)
    else if (conf .eq. 2) then
!              proc_parts(p,2) = base_i
!              proc_parts(p,3) = base_j
!              proc_parts(p,4) = base_k
!              proc_parts(p,5) = size_i
!              proc_parts(p,6) = size_j
!              proc_parts(p,7) = size_k
    end if
  end do
 
end subroutine get_proc_parts

! --------------------------------------
!
!     Transpose X and Y pencils (real data)
!
! --------------------------------------
subroutine rtran_x2y (source, dest, rbuf1, rbuf2, dstart, dend, dsize, t)
  implicit none
 
  real (mytype), intent (in) :: source (NX_fft, jisize, kjsize)
  real (mytype), intent (out) :: dest (iiisize, NY_fft, kjsize)
  real (mytype), intent (inout) :: rbuf1 (*), rbuf2 (*)
  integer, intent (out) :: dstart (3), dend (3), dsize (3)
 
  real (8) :: t
  integer :: x, y, i, ierr, z, xs, j, N, ix, iy
  integer * 8 :: position
 
! Pack the send buffer for exchanging y and x (within a given z plane ) into sendbuf
  position = 1
 
  do i = 0, iproc - 1
 
    do z = 1, kjsize
      do y = 1, jisize
        do x = iiist (i), iiien (i)
          rbuf1 (position) = source (x, y, z)
          position = position + 1
        end do
      end do
    end do
  end do
 
  t = t - MPI_Wtime ()
! Use MPI_Alltoallv
! Exchange the y-x buffers (in rows of processors)
  call mpi_alltoallv (rbuf1, IiCnts, IiStrt, mpi_byte, rbuf2, JiCnts, JiStrt, mpi_byte, mpi_comm_row, ierr)
  t = t + MPI_Wtime ()
 
! Unpack the data
  position = 1
  do i = 0, iproc - 1
    do z = 1, kjsize
      do y = jist (i), jien (i)
        do x = 1, iiisize
          dest (x, y, z) = rbuf2 (position)
          position = position + 1
        end do
      end do
    end do
  end do
 
  dstart (1) = iiistart
  dend (1) = iiiend
  dsize (1) = iiisize
  dstart (2) = 1
  dend (2) = NY_fft
  dsize (2) = NY_fft
  dstart (3) = kjstart
  dend (3) = kjend
  dsize (3) = kjsize
 
  return
end subroutine
 
! --------------------------------------
!
!     Transpose Y and X pencils (real data)
!
! --------------------------------------
subroutine rtran_y2x (source, dest, rbuf1, rbuf2, dstart, dend, dsize, t)
  implicit none
 
  real (mytype), intent (in) :: source (iiisize, NY_fft, kjsize)
  real (mytype), intent (out) :: dest (NX_fft, jisize, kjsize)
  real (mytype), intent (inout) :: rbuf1 (*), rbuf2 (*)
  integer, intent (out) :: dstart (3), dend (3), dsize (3)
 
  real (8) :: t
  integer :: x, y, i, ierr, z, xs, j, N, ix, iy
  integer * 8 :: position, pos1
 
! Pack the send buffer for exchanging y and x (within a given z plane ) into sendbuf
  position = 1
 
  do i = 0, iproc - 1
    do z = 1, kjsize
      do y = jist (i), jien (i)
        do x = 1, iiisize
          rbuf1 (position) = source (x, y, z)
          position = position + 1
        end do
      end do
    end do
  end do
 
  t = t - MPI_Wtime ()
! Use MPI_Alltoallv
! Exchange the y-x buffers (in rows of processors)
  call mpi_alltoallv (rbuf1, JiCnts, JiStrt, mpi_byte, &
                      rbuf2, IiCnts, IiStrt, mpi_byte, mpi_comm_row, ierr)
  t = t + MPI_Wtime ()
 
! Unpack the data
  position = 1
  do i = 0, iproc - 1
    do z = 1, kjsize
      do y = 1, jisize
        do x = iiist (i), iiien (i)
          dest (x, y, z) = rbuf2 (position)
          position = position + 1
        end do
      end do
    end do
  end do
 
  dstart (1) = 1
  dend (1) = NX_fft
  dsize (1) = NX_fft
  dstart (2) = jistart
  dend (2) = jiend
  dsize (2) = jisize
  dstart (3) = kjstart
  dend (3) = kjend
  dsize (3) = kjsize
 
  return
end subroutine
 
! --------------------------------------
!
!     Transpose X and Z pencils (real data)
!
! --------------------------------------
subroutine rtran_x2z (source, dest, rbuf1, rbuf2, dstart, dend, dsize, t)
  implicit none
 
  real (mytype), intent (in) :: source (NX_fft, jisize, kjsize)
  real (mytype), intent (out) :: dest (ijsize, jisize, NZ_fft)
  real (mytype), intent (inout) :: rbuf1 (*), rbuf2 (*)
  integer, intent (out) :: dstart (3), dend (3), dsize (3)
 
  real (8) :: t
  integer :: x, y, i, ierr, z, xs, j, N, ix, iy
  integer * 8 :: position
 
! Pack the send buffer for exchanging x and z (within a given y plane ) into sendbuf
  position = 1
 
  do i = 0, jproc - 1
 
    do z = 1, kjsize
      do y = 1, jisize
        do x = ijst (i), ijen (i)
          rbuf1 (position) = source (x, y, z)
          position = position + 1
        end do
      end do
    end do
  end do
 
  t = t - MPI_Wtime ()
! Use MPI_Alltoallv
! Exchange the x-z buffers (in rows of processors)
  call mpi_alltoallv (rbuf1, IjCnts, IjStrt, mpi_byte, &
                      rbuf2, KjCnts, KjStrt, mpi_byte, mpi_comm_col, ierr)
  t = t + MPI_Wtime ()
 
! Unpack the data
  position = 1
  do i = 0, jproc - 1
    do z = kjst (i), kjen (i)
      do y = 1, jisize
        do x = 1, ijsize
          dest (x, y, z) = rbuf2 (position)
          position = position + 1
        end do
      end do
    end do
  end do
 
  dstart (1) = ijstart
  dend (1) = ijend
  dsize (1) = ijsize
  dstart (2) = jistart
  dend (2) = jiend
  dsize (2) = jisize
  dstart (3) = 1
  dend (3) = NZ_fft
  dsize (3) = NZ_fft
 
  return
end subroutine
 
! --------------------------------------
!
!     Transpose Z and X pencils (real data)
!
! --------------------------------------
subroutine rtran_z2x (source, dest, rbuf1, rbuf2, dstart, dend, dsize, t)
  implicit none
 
  real (mytype), intent (in) :: source (ijsize, jisize, NZ_fft)
  real (mytype), intent (out) :: dest (NX_fft, jisize, kjsize)
  real (mytype), intent (inout) :: rbuf1 (*), rbuf2 (*)
  integer, intent (out) :: dstart (3), dend (3), dsize (3)
 
  real (8) :: t
  integer :: x, y, i, ierr, z, xs, j, N, ix, iy
  integer * 8 :: position
 
! Pack the send buffer for exchanging y and x (within a given z plane ) into sendbuf
  position = 1
 
  do i = 0, jproc - 1
 
    do z = kjst (i), kjen (i)
      do y = 1, jisize
        do x = 1, ijsize
          rbuf1 (position) = source (x, y, z)
          position = position + 1
        end do
      end do
    end do
  end do
 
  t = t - MPI_Wtime ()
! Use MPI_Alltoallv
! Exchange the z-x buffers (in rows of processors)
  call mpi_alltoallv (rbuf1, KjCnts, KjStrt, mpi_byte, rbuf2, IjCnts, IjStrt, mpi_byte, mpi_comm_col, ierr)
  t = t + MPI_Wtime ()
 
! Unpack the data
  position = 1
  do i = 0, jproc - 1
    do z = 1, kjsize
      do y = 1, jisize
        do x = ijst (i), ijen (i)
          dest (x, y, z) = rbuf2 (position)
          position = position + 1
        end do
      end do
    end do
  end do
 
  dstart (1) = 1
  dend (1) = NX_fft
  dsize (1) = NX_fft
  dstart (2) = jistart
  dend (2) = jiend
  dsize (2) = jisize
  dstart (3) = kjstart
  dend (3) = kjend
  dsize (3) = kjsize
 
  return
end subroutine
 

 

 

 

 


 
!========================================================
 
!      subroutine p3dfft_rot_x180 (XYZg)
!      use fft_spec
!      implicit none
!
!      complex(mytype), TARGET :: XYZg(iistart:iiend,jjstart:jjend,nz_fft)
!
!
!      integer x,y,z,i,k,nx,ny,nz
!
!      if(.not. mpi_set) then
!         print *,'P3DFFT error: call setup before other routines'
!         return
!      endif
!      nx = nx_fft
!      ny = ny_fft
!      nz = nz_fft
!
!     ! flip data in z-direction
!
!     ! z-pencil to y-pencil
!      if(jproc > 1) then
!          call bcomm1(XYZg,XYgZ,timers(3))
!      endif
!
!     ! flip data in y-direction
!      do k=1,nz_fft
!        do j=jjstart,jjend
!            do i=iistart,iiend
!            enddo
!          enddo
!      enddo
!
!     ! y-pencil to z-pencil
!      if(jproc > 1) then
!          call fcomm2(XYgZ,XYZg,timers(2))
!      endif
!
!      end subroutine p3dfft_rot_x180

      end module


