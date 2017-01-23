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

end program ex20
