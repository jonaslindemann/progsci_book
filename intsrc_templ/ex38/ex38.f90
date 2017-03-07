program allocatable_function

    use utils

    implicit none

    real(rk), allocatable :: A(:)

    A = createVector(20)
    print *, size(A,1)

contains

function createVector(n)

    real(rk), allocatable, dimension(:) :: createVector
    integer, intent(in) :: n

    allocate(createVector(n))

end function createVector

end program allocatable_function
