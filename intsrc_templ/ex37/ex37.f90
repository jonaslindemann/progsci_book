program allocatable_dummy

    use utils

    implicit none

    real(rk), allocatable :: A(:,:)

    call createArray(A)

    print*, size(A,1), size(A,2)

contains

subroutine createArray(A)

    real(rk), allocatable, intent(out) :: A(:,:)

    allocate(A(20,20))

end subroutine

end program allocatable_dummy
