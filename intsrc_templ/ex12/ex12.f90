program ex12

    implicit none

    integer, parameter :: rk = selected_real_kind(15,300)

    integer :: a
    real(rk) :: B(10,20)
    real(rk) :: C(30)

    call mysub(a, B, C)

    print*, a
    print*, B(1,1)
    print*, c(1)

end program ex12
