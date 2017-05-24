module utils

use datatypes

interface printMatrix
    module procedure printMatrixD, printMatrixS
end interface

interface printVector
    module procedure printVectorD, printVectorS
end interface

interface randMat
    module procedure randMatD, randMatS
end interface

contains

subroutine printMatrixD(A, name)

    real(dp), intent(in) :: A(:,:)
    character(*), intent(in), optional :: name
    integer :: rows, cols, slen
    integer :: i, j
    character(255) :: fmt
    character(255) :: sfmt

    rows = size(A,1)
    cols = size(A,2)
    slen = len_trim(name)

    if (slen<10) then
        write(sfmt, '(A,I1,A)') '(TL1,A,A',slen,',A,I3,A,I3,A)'
    else if (slen<100) then
        write(sfmt, '(A,I2,A)') '(TL1,A,A',slen,',A,I3,A,I3,A)'
    else
        write(sfmt, '(A,I3,A)') '(TL1,A,A',slen,',A,I3,A,I3,A)'
    end if

    if (cols<10) then
        write(fmt, '(A,I1,A)') '(', cols, 'G10.3)'
    else if (cols<100) then
        write(fmt, '(A,I2,A)') '(', cols, 'G10.3)'
    else
        write(fmt, '(A,I3,A)') '(', cols, 'G10.3)'
    end if

    write(*,'(TL1,A)') '-------------------------------------'
    if (present(name)) then
        write(*,sfmt) 'Matrix ',trim(name),' (',rows, ' x ', cols, ')'
    else
        write(*,'(TL1,A,I3,A,I3,A)') 'Matrix (',rows, ' x ', cols, ')'
    end if
    write(*,'(TL1,A)') '-------------------------------------'


    do i=1,rows
        write(*,fmt) (A(i,j), j=1,cols)
    end do

    write(*,'(TL1,A)') '-------------------------------------'

end subroutine printMatrixD

subroutine printMatrixS(A, name)

    real(sp), intent(in) :: A(:,:)
    character(*), intent(in), optional :: name
    integer :: rows, cols, slen
    integer :: i, j
    character(255) :: fmt
    character(255) :: sfmt

    rows = size(A,1)
    cols = size(A,2)
    slen = len_trim(name)

    if (slen<10) then
        write(sfmt, '(A,I1,A)') '(TL1,A,A',slen,',A,I3,A,I3,A)'
    else if (slen<100) then
        write(sfmt, '(A,I2,A)') '(TL1,A,A',slen,',A,I3,A,I3,A)'
    else
        write(sfmt, '(A,I3,A)') '(TL1,A,A',slen,',A,I3,A,I3,A)'
    end if

    if (cols<10) then
        write(fmt, '(A,I1,A)') '(', cols, 'G10.3)'
    else if (cols<100) then
        write(fmt, '(A,I2,A)') '(', cols, 'G10.3)'
    else
        write(fmt, '(A,I3,A)') '(', cols, 'G10.3)'
    end if

    write(*,'(TL1,A)') '-------------------------------------'
    if (present(name)) then
        write(*,sfmt) 'Matrix ',trim(name),' (',rows, ' x ', cols, ')'
    else
        write(*,'(TL1,A,I3,A,I3,A)') 'Matrix (',rows, ' x ', cols, ')'
    end if
    write(*,'(TL1,A)') '-------------------------------------'


    do i=1,rows
        write(*,fmt) (A(i,j), j=1,cols)
    end do

    write(*,'(TL1,A)') '-------------------------------------'

end subroutine printMatrixS

subroutine printVectorD(A, name)

    real(dp), intent(in) :: a(:)
    character(*), intent(in), optional :: name
    integer :: cols, slen
    integer :: i
    character(255) :: fmt
    character(255) :: sfmt

    cols = size(A,1)
    slen = len_trim(name)

    if (slen<10) then
        write(sfmt, '(A,I1,A)') '(TL1,A,A',slen,',A,I3,A)'
    else if (slen<100) then
        write(sfmt, '(A,I2,A)') '(TL1,A,A',slen,',A,I3,A)'
    else
        write(sfmt, '(A,I3,A)') '(TL1,A,A',slen,',A,I3,A)'
    end if

    if (cols<10) then
        write(fmt, '(A,I1,A)') '(', cols, 'G10.3)'
    else if (cols<100) then
        write(fmt, '(A,I2,A)') '(', cols, 'G10.3)'
    else
        write(fmt, '(A,I3,A)') '(', cols, 'G10.3)'
    end if

    write(*,'(TL1,A)') '-------------------------------------'
    if (present(name)) then
        write(*,sfmt) 'Vector ',trim(name),' (',cols,')'
    else
        write(*,'(TL1,A,I3,A)') 'Vector (',cols,')'
    end if
    write(*,'(TL1,A)') '-------------------------------------'


    write(*,fmt) (a(i), i=1,cols)

    write(*,'(TL1,A)') '-------------------------------------'

end subroutine printVectorD

subroutine printVectorS(A, name)

    real(sp), intent(in) :: a(:)
    character(*), intent(in), optional :: name
    integer :: cols, slen
    integer :: i
    character(255) :: fmt
    character(255) :: sfmt

    cols = size(A,1)
    slen = len_trim(name)

    if (slen<10) then
        write(sfmt, '(A,I1,A)') '(TL1,A,A',slen,',A,I3,A)'
    else if (slen<100) then
        write(sfmt, '(A,I2,A)') '(TL1,A,A',slen,',A,I3,A)'
    else
        write(sfmt, '(A,I3,A)') '(TL1,A,A',slen,',A,I3,A)'
    end if

    if (cols<10) then
        write(fmt, '(A,I1,A)') '(', cols, 'G10.3)'
    else if (cols<100) then
        write(fmt, '(A,I2,A)') '(', cols, 'G10.3)'
    else
        write(fmt, '(A,I3,A)') '(', cols, 'G10.3)'
    end if

    write(*,'(TL1,A)') '-------------------------------------'
    if (present(name)) then
        write(*,sfmt) 'Vector ',trim(name),' (',cols,')'
    else
        write(*,'(TL1,A,I3,A)') 'Vector (',cols,')'
    end if
    write(*,'(TL1,A)') '-------------------------------------'


    write(*,fmt) (a(i), i=1,cols)

    write(*,'(TL1,A)') '-------------------------------------'

end subroutine printVectorS

subroutine randMatD(A, randMin, randMax)

    real(dp), intent(inout) :: A(:,:)
    real(dp), intent(in) :: randMin, randMax

    call random_number(A)

    !    min ---- max

    A = randMin + (randMax-randMin) * A

end subroutine randMatD

subroutine randMatS(A, randMin, randMax)

    real(sp), intent(inout) :: A(:,:)
    real(sp), intent(in) :: randMin, randMax

    call random_number(A)

    !    min ---- max

    A = randMin + (randMax-randMin) * A

end subroutine randMatS

subroutine initRand()
    integer :: values(1:8), k
    integer, dimension(:), allocatable :: seed
    real(real64) :: r
    call date_and_time(values=values)
    call random_seed(size=k)
    allocate(seed(1:k))
    seed(:) = values(8)
    call random_seed(put=seed)
end subroutine

end module utils
