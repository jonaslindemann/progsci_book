program ex13

    implicit none

    integer, parameter :: rk = selected_real_kind(15,300)

    integer :: a
    real(rk) :: B(10,20)
    real(rk) :: C(30)

    call mysub(a, B, 10, 20, C, 30)

    print*, a
    print*, B(1,1)
    print*, c(1)



end program ex13
