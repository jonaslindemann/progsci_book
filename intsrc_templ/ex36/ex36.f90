program pointers

    implicit none

    integer, allocatable, dimension(:,:), target :: A
    integer, dimension(:,:), pointer :: B, C

    allocate(A(20,20))

    B => A

    print*, size(B,1), size(B,2)

    call createArray(C)

    print*, size(C,1), size(C,2)

    B => null()

    B(1,1) = 0 ! <-- dangerous


contains

subroutine createArray(D)

    integer, dimension(:,:), pointer :: D

    allocate(D(10,10))

end subroutine createArray

end program pointers
