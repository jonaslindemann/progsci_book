# Loading modules on aurora-desktop

    $ module load foss/2016.09
    $ module load qtcreator
    $ module load allinea_forge

# Unpacking and building examples (command line)

    $ tar xvzf compute_intsrc.tar.gz
    $ cd intsrc
    $ mkdir build
    $ cd build
    $ cmake ..
    -- The C compiler identification is GNU 4.8.5
    -- The CXX compiler identification is GNU 4.8.5
    -- Check for working C compiler: /bin/cc
    -- Check for working C compiler: /bin/cc -- works
    -- Detecting C compiler ABI info
    -- Detecting C compiler ABI info - done
    -- Detecting C compile features
    -- Detecting C compile features - done
    -- Check for working CXX compiler: /bin/c++
    -- Check for working CXX compiler: /bin/c++ -- works
    -- Detecting CXX compiler ABI info
    -- Detecting CXX compiler ABI info - done
    -- Detecting CXX compile features
    -- Detecting CXX compile features - done
    -- The Fortran compiler identification is GNU 6.2.0
    -- Check for working Fortran compiler: /sw/easybuild/software/Core/GCCcore/6.2.0/bin/gfortran
    -- Check for working Fortran compiler: /sw/easybuild/software/Core/GCCcore/6.2.0/bin/gfortran  -- works
    -- Detecting Fortran compiler ABI info
    -- Detecting Fortran compiler ABI info - done
    -- Checking whether /sw/easybuild/software/Core/GCCcore/6.2.0/bin/gfortran supports Fortran 90
    -- Checking whether /sw/easybuild/software/Core/GCCcore/6.2.0/bin/gfortran supports Fortran 90 -- yes
    -- Configuring done
    -- Generating done
    -- Build files have been written to: /home/bmjl/Development/testdir/intsrc/build
    $ make
    [xxx] Building...
    $ cd ex1
    $ ls
    CMakeFiles  cmake_install.cmake  ex1  Makefile
    $ ./ex1

Source is located in intsrc/exNN

# Example 1 - Data types

    program ex1

        integer(kind=4)   :: a
        integer(4)        :: b ! Short form

        real(kind=8)      :: c
        real(8)           :: d ! Short form

        character(len=20) :: textstring
        character         :: t
        character(20)     :: textstring2
        character(len=20, kind=1) :: textstring3     ! english string

        a = 4
        b = 5
        c = 1.0_8
        d = 2.0_8
        e = 0.0_8

        t = 'a'
        textstring = 'Hello'
        textstring2 = 'World!'
        textstring3 = 'English'

    end program ex1

# Example 2 - Selecting precision

    program ex2

        implicit none

        integer, parameter :: rk = selected_real_kind(15,300)
        integer, parameter :: ik = selected_real_kind(6)

        real(kind=rk) :: x
        real(rk) :: y

        integer(kind=ik) :: i
        integer(ik) :: j

        print*, rk
        print*, ik

    end program ex2

# Example 3 - Arrays

    program ex3

        implicit none

        integer :: A(16)
        integer :: B(8,2)
        integer :: C(2,8)

        integer  :: i, j

        do i = 1, 16
            A(i) = i
        end do

        B = reshape(A, (/8, 2/))
        C = reshape(A, (/2, 8/))

    end program ex3

# Example 4 - Assignment and precision

    program ex4

        implicit none

        integer, parameter :: rk = selected_real_kind(15,300)
        integer, parameter :: ik = selected_real_kind(6)

        integer :: mm
        real(rk) :: pi, pi2
        real(rk) :: K(20,20)
        real(rk) :: A(3,3)
        logical  :: flag
        character(40) :: first_name

        mm = 113
        pi = 3.141592653589793_rk
        pi2 = 3.141592653589793

        K(5,6) = 5.0_rk
        K = 5.0_rk

        A = 0.0_rk
        A(2,:) = (/ 1.0_rk, 2.0_rk, 3.0_rk /)
        A(:,2) = (/ 4.0_rk, 5.0_rk, 6.0_rk /)

        print*, pi
        print*, pi2

        flag = .false.
        first_name = 'jan'

        print*, flag
        print*, first_name

    end program ex4

# Example 5 - Array Assignment

    program ex5

        implicit none

        integer, parameter :: rk = selected_real_kind(15,300)

        real(rk) :: A(20,20)
        real(rk) :: B(20,20)
        real(rk) :: C(20,20)
        integer  :: i, j

        A(10,:) = 1.0_rk
        A(:,10) = 2.0_rk
        
        B = 0.0_rk
        
        do i=1,20
            do j=1,20
                C(i,j) = 42.0_rk
            end do
        end do

    end program ex5

# ,Example 6 - Operators

    program ex6

        implicit none

        integer, parameter :: rk = selected_real_kind(15,300)

        real(rk) :: x, y
        real(rk) :: a, b, c

        x = 3.0_rk
        y = 4.0_rk

        print*, x**-y   ! --- Ok with some compilers
        print*, x**(-y) ! --- Correct expression

        a = 3.0_rk
        b = 2.0_rk
        c = 4.0_rk

        print*, -a+b+c
        print*, -a+b*c     ! --- Evaluates as ((-a)+(b*c))
        print*, (-a+b)*c
        print*, -(a+b)*c   ! --- Evaluates as -((a+b)*c)
        print*, -((a+b)*c)
        print*, a**b**c    ! --- Evaluates as a**(b**c)
        print*, a**(b**c)
        print*, (a**b)**c

        print*, 6/3
        print*, 8/3
        print*, -8/3

        print*, 2**3
        print*, 2**(-3)    ! --- = 1/(2**3)
        print*, 1/(2**3)
        print*, 2.0_rk**(-3.0_rk)

    end program ex6

# Example 7 - Mixed expressions

    program ex5

        implicit none

        integer, parameter :: rk = selected_real_kind(15,300)

        real(rk) :: a
        real(rk) :: b
        integer  :: i, c

        a = 0.5_rk
        i = 5
        b = a*i
        c = a*i

        print*, b
        print*, c

    end program ex5

# Example 8 - Array expressions

    program ex8

        implicit none

        integer, parameter :: rk = selected_real_kind(15,300)

        real(rk) :: a(10,20), b(10,20)
        real(rk) :: v(5)
        integer  :: i, c

        real(rk) :: ex1(10,20)
        real(rk) :: ex2(5)
        real(rk) :: ex3(5)
        logical  :: ex4(10,20)

        a = 20.0_rk
        a(1,1) = 2.0_rk

        b = 2.0_rk
        v = 2.0_rk

        ex1 = a/b
        ex2 = v + 2.0_rk
        ex3 = 5/v + a(1:5,5)
        ex4 = a.eq.b

    end program ex8

# Example 9 - if statements

    program ex9

        use utils

        implicit none

        real(rk) :: v1, v2

        call initRand()
        call randVal(v1, 0.0_rk, 1.0_rk)

        !if (v1>0.5) then
        !    v2 = 0.5
        !endif

        !if (v1>0.5) then
        !    v2 = 0.5
        !else
        !    v2 = v1
        !endif

        if (v1>0.5) then
            v2 = 0.5
        else if (v1<0.2) then
            v2 = 0.2
        else
            v2 = v1
        end if

        print*, v1
        print*, v2

    end program ex9

# Example 10 - Case statements

    program ex10

        use utils

        implicit none

        real(rk) :: r
        integer  :: v

        call initRand()
        call randVal(r, 0.0_rk, 1.0_rk)

        v = nint(50.0_rk - 100.0_rk * r)

        print*, v

        select case (v)
        case (:-20)
            print*, "v <= -1"
        case (0)
            print*, "v == 0"
        case (20:)
            print*, "v >=1"
        case default
            print*, "v is in the default range"
        end select

    end program ex10

# Example 11 - Loops

    program ex11

        implicit none

        integer, parameter :: rk = selected_real_kind(15,300)

        integer :: i

        do i = 1, 10
            print*, i
        end do

        print*, '----'

        do i = 2, 30, 4
            print*, i
            ! i = 3
        end do

        print*, '----'

        do i = 1, 1000

            if (i>50) then
                print*, 'i>50, exiting'
                exit
            else if (i<20) then
                print*, 'i<20, cycling'
                cycle
            end if

            print*, i

        end do

    end program ex11

# Example 12 - Subroutines

    program ex12

        implicit none

        integer, parameter :: rk = selected_real_kind(15,300)

        integer :: a
        real(rk) :: B(10,20)
        real(rk) :: C(30)

        call mysub(a, B, C)

    end program ex12

Subroutine mysub.f90:

    subroutine mysub(a, B, C)

        integer, parameter :: rk = selected_real_kind(15,300)

        integer :: a
        real(rk) :: B(10,20)
        real(rk) :: C(30)

        a = 42
        B = 42.0_rk
        C = 84.0_rk

    end subroutine mysub

# Example 13 - Subroutine with Arrays

    program ex13

        implicit none

        integer, parameter :: rk = selected_real_kind(15,300)

        integer :: a
        real(rk) :: B(10,20)
        real(rk) :: C(30)

        call mysub(a, B, 10, 20, C, 30)

    end program ex13

mysub.f90:

    subroutine mysub(a, B, br, bc, C, cr)

        integer, parameter :: rk = selected_real_kind(15,300)

        integer :: a
        integer :: br, bc, cr
        real(rk) :: B(br,bc)
        real(rk) :: C(cr)

        a = 42
        B = 42.0_rk
        C = 84.0_rk

    end subroutine mysub

# Example 14 - Module Example

    program ex14

        use mymod

        implicit none

        integer :: a
        real(rk) :: B(10,20)
        real(rk) :: C(30)

        call mysub(a, B, C)

    end program ex14

mymod.f90:

    module mymod

    integer, parameter :: rk = selected_real_kind(15,300)

    contains

    subroutine mysub(a, B, C)

        integer :: a
        real(rk) :: B(:,:)
        real(rk) :: C(:)

        print*, size(B,1)
        print*, size(B,2)
        print*, size(C,1)

        a = 42
        B = 42.0_rk
        C = 84.0_rk

    end subroutine mysub

    end module mymod

# Example 15 - Subroutine in contains

    program ex15

        implicit none

        integer, parameter :: rk = selected_real_kind(15,300)

        integer :: a
        real(rk) :: B(10,20)
        real(rk) :: C(30)

        call mysub(a, B, C)

    contains

    subroutine mysub(a, B, C)

        integer :: a
        real(rk) :: B(:,:)
        real(rk) :: C(:)

        print*, size(B,1)
        print*, size(B,2)
        print*, size(C,1)

        a = 42
        B = 42.0_rk
        C = 84.0_rk

    end subroutine mysub

    end program ex15

# Example 16 - Subroutine with interface

    program ex16

        implicit none

        integer, parameter :: rk = selected_real_kind(15,300)

        interface
                subroutine mysub(a, B, C)
                        integer, parameter :: rk = selected_real_kind(15,300)
                        integer :: a
                        real(rk) :: B(:,:)
                        real(rk) :: C(:)
                end subroutine mysub
        end interface

        integer :: a
        real(rk) :: B(10,20)
        real(rk) :: C(30)

        call mysub(a, B, C)

    end program ex16

sub.f90:

    subroutine mysub(a, B, C)

        integer, parameter :: rk = selected_real_kind(15,300)

        integer :: a
        real(rk) :: B(:,:)
        real(rk) :: C(:)

        print*, size(B,1)
        print*, size(B,2)
        print*, size(C,1)

        a = 42
        B = 42.0_rk
        C = 84.0_rk

    end subroutine mysub

# Example 17 - Implict Arrays

    program ex17

        implicit none

        integer, parameter :: rk = selected_real_kind(15,300)

        real(rk) :: A(10,20)

        call mysub(A)

    contains

    subroutine mysub(A)

        real(rk) :: A(:,:)
        real(rk) :: B(size(A,2), size(A,1))

        print*, size(A,1)
        print*, size(A,2)
        print*, size(B,1)
        print*, size(B,2)

        A = 42.0_rk
        B = 84.0_rk

    end subroutine mysub

    end program ex17

# Example 18 - Dynamic allocation

    program ex18

        implicit none

        integer, parameter :: rk = selected_real_kind(15,300)

        real(rk), allocatable :: f(:)
        real(rk), dimension(:,:), allocatable :: K

        allocate(f(20))
        allocate(K(20,20))

        K = 42.0_rk
        f = 84.0_rk

        deallocate(f)
        deallocate(K)

    end program ex18

# Example 19 - where

    program ex19

        use utils

        implicit none

        real(rk), allocatable :: A(:,:)
        real(rk), allocatable :: B(:,:)

        allocate(A(20,20), B(20,20))

        call initRand()
        call randMat(A, 0.0_rk, 1.0_rk)
        call randMat(B, 0.0_rk, 1.0_rk)

        where (A>0.8_rk) A = 0.8

        where (A<0.2_rk)
            A = 0.2_rk
        end where

        where (B<0.5_rk)
            B = 0.0_rk
        else where
            B = 1.0_rk
        end where

        deallocate(A, B)

    end program ex19

# Example 20 - forall

    program ex20

        use utils

        implicit none

        real(rk), allocatable :: A(:,:)
        real(rk), allocatable :: B(:,:)
        integer :: i, j

        allocate(A(20,20), B(20,20))

        call initRand()
        call randMat(A, 0.0_rk, 1.0_rk)
        call randMat(B, 0.0_rk, 1.0_rk)

        do i=1,20
            A(i,i) = 2.0_rk * B(i,i)
        end do

        forall(i=1:20) A(i,i) = 2.0_rk * B(i,i)

        forall(i=1:20, j=1:20) A(i,j) = i + j

        forall(i=1:20, j=1:20, A(i,j)/=0.0_rk)
            B(i,j) = 1.0/A(i,j)
        end forall

        deallocate(A, B)

    end program ex20

# Example 21 - Elemental routines

    program ex21

        implicit none

        integer, parameter :: rk = selected_real_kind(15,300)

        real(rk), allocatable :: A(:,:)
        real(rk), allocatable :: B(:,:)
        integer :: i, j

        allocate(A(20,20), B(20,20))

        A = 42.0_rk
        B = 84.0_rk

        call swap(A, B)

        deallocate(A, B)

    contains

    elemental subroutine swap(a, b)
        real(rk), intent(out) :: a, b
        real(rk) :: work

        work = a
        a = b
        b = work

    end subroutine swap

    end program ex21

# Example 22 - Sub-arrays and indexing

    program ex22

        use utils

        implicit none

        real(rk) :: A(5,10)
        integer :: i, j

        do i=1,5
            do j=1,10
                A(i,j) = (i-1)*10+j
            end do
        end do

        call printMatrix(A, 'A')
        call printMatrix(A(1:2,5:10), 'A2')
        call printVector(A(1,5:10), 'a2')
        call printMatrix(A(:,5:10), 'A3')
        call printMatrix(A((/1,3/),(/2,4/)), 'A4')

    end program ex22

# Example 23 - intrinsic functions

    program ex23

        use utils

        implicit none

        real(rk) :: A(5,10)
        real(rk) :: B(5,10)
        integer :: i, j

        call initRand()
        call randMat(A, -1.0_rk, 1.0_rk)
        call printMatrix(A, 'A')

        B = cos(A)

        call printMatrix(B, 'B')

    end program ex23

# Example 24 - Intrinsic functions

    program ex24

        use utils

        implicit none

        real(rk) :: A(10,10)
        real(rk) :: B(10,10)
        real(rk) :: C(10,10)
        real(rk) :: v1(3)
        real(rk) :: v2(3)
        real(rk) :: dp

        call initRand()
        call randMat(A, -1.0_rk, 1.0_rk)
        call randMat(B, -1.0_rk, 1.0_rk)
        call printMatrix(A, 'A')
        call printMatrix(B, 'B')

        C = matmul(A, B)

        call printMatrix(C, 'C')

        v1 = (/1.0, 0.0, 0.0/)
        v2 = (/0.0, 1.0, 0.0/)
        dp = dot_product(v1, v2)

        print*, dp

    end program ex24

# Example 25 - any and all

    program ex25

        use utils

        implicit none

        real(rk) :: A(10,10)
        logical  :: B(10,10)
        real(rk) :: v1(3)
        real(rk) :: v2(3)
        real(rk) :: dp

        call initRand()
        call randMat(A, -10.0_rk, 10.0_rk)

        B = .true.

        if (all(B) .eqv. .true.) then
            print*, 'All elements are true.'
        else
            print*, 'Not all elements are true'
        end if

        B = .false.

        if (any(B) .eqv. .true.) then
            print*, 'Some of the elements in B are true'
        else
            print*, 'None of the elements in B are true'
        end if

        B(5,5) = .true.

        if (any(B) .eqv. .true.) then
            print*, 'Some of the elements in B are true'
        else
            print*, 'None of the elements in B are true'
        end if

        print*, 'Max value in A = ', maxval(A)
        print*, 'Max value in A = ', minval(A)
        print*, 'Product of A   = ', product(A)
        print*, 'Sum of A       = ', sum(A)

    end program ex25

# Example 26 - information functions

    program ex26

        use utils

        implicit none

        real(rk) :: A(20,10)
        real(rk) :: B(10,20)
        real(rk) :: C(-10:10) ! -10..10 = 21 elements

        print*, lbound(A)
        print*, ubound(A)

        print*, lbound(B)
        print*, ubound(B)

        print*, lbound(C)
        print*, ubound(C)

        print*, shape(A)
        print*, shape(B)
        print*, shape(C)

        print*, size(A)
        print*, size(B)
        print*, size(C)

    end program ex26

# Example 27 - Reading and writing 

    program ex27

        use utils
        use iso_fortran_env

        implicit none

        real(rk) :: a(5)
        integer :: i

        read(*,*) a(1), a(2), a(3), a(4), a(5)
        read(input_unit, *) (a(i), i=1,5)
        write(*,*) (a(i), i=1,5)
        write(output_unit, *) (a(i), i=1,5)

        call printVector(a, 'a')

    end program ex27

# Example 28 - Formatted output_unit

    program ex28

        use utils

        implicit none

        real(rk) :: a(3)
        integer  :: b(4)
        integer  :: i, j

        ! Write table header

        a = (/ 1.0, 2.0, 3.0 /)
        b = (/ 4, 5, 6, 7 /)

        write(*, '(3A8,4A5)') 'aaaaaaaa', &
                'bbbbbbbb', 'cccccccc', 'ddddd', 'eeeee', 'fffff', &
                'ggggg'

        ! Write table

        do j=1,10
                write(*, '(3G8.3,4I5)') (a(i),i=1,3), (b(i), i=1,4)
        end do

    end program ex28

# Example 29 - Dynamic format strings

    program ex29

        use utils

        implicit none

        real(rk) :: A(8,8)

        call initRand()
        call randMat(A, 0.0_rk, 100.0_rk)

        call printArray(A)


    contains

    subroutine printArray(A)

        real(rk), dimension(:,:) :: A
        integer :: rows, cols, i, j
        character(255) :: fmt

        rows = size(A,1)
        cols = size(A,2)

        write(fmt, '(A,I1,A)') '(',cols, 'G8.3)'

        do i=1,rows
                print fmt, (A(i,j), j=1,cols)
        end do

    end subroutine printArray

    end program ex29

# Example 30 - Reading and writing to files

    program sample2

        use utils

        implicit none
        real(rk), allocatable :: infield(:,:)
        real(rk), allocatable :: rowsum(:)
        integer :: rows, i, j

        !  File unit numbers

        integer, parameter :: infile = 15
        integer, parameter :: outfile = 16

        !  Allocate matrices

        rows=5
        allocate(infield(3,rows))
        allocate(rowsum(rows))

        !  Open the file 'indata.dat' for reading

        open(unit=infile,file='indata.dat',&
                access='sequential',&
                action='read')

        !  Open the file 'utdata.dat' for writing

        open(unit=outfile,file='utdata.dat',&
                access='sequential',&
                action='write')

        !  Read input from file

        do i=1,rows
            read(infile,*) (infield(j,i),j=1,3)
            rowsum(i)=&
                    infield(1,i)+infield(2,i)+infield(3,i)
            write(outfile,*) rowsum(i)
        end do

        !  Close files

        close(infile)
        close(outfile)

        !  Free used memory

        deallocate(infield)
        deallocate(rowsum)

        stop
        
    end program sample2





