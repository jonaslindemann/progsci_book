program ex15

    implicit none

    integer, parameter :: rk = selected_real_kind(15,300)

    integer :: a
    real(rk) :: B(10,20)
    real(rk) :: C(30)

contains

subroutine mysub(a, B, C)

    integer :: a
    real(rk) :: B(:,:)
    real(rk) :: C(:)

    a = 42
    B = 42.0_rk
    C = 84.0_rk

end subroutine mysub

end program ex15
