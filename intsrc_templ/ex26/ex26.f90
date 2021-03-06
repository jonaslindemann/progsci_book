program ex26

    use utils

    implicit none

    real(rk) :: A(20,10)
    real(rk) :: B(10,20)
    real(rk) :: C(-10:10) ! -10..10 = 21 elements

    print*, lbound(A)
    print*, ubound(A)

    print*, lbound(C)
    print*, ubound(C)

    print*, shape(A)
    print*, shape(B)
    print*, shape(C)

    print*, size(A,1)
    print*, size(B,1)
    print*, size(C)


end program ex26
