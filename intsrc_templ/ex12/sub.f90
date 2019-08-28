subroutine mysub(a, B, C)

    implicit none

    integer, parameter :: rk = selected_real_kind(15,300)

    integer, intent(out) :: a
    real(rk), intent(out) :: B(10,20)
    real(rk), intent(out) :: C(30)

    a = 42
    B = 42.0_rk
    C = 84.0_rk

end subroutine mysub
