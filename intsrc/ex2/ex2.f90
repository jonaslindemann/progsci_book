program ex2

    implicit none

    integer, parameter :: rk = selected_real_kind(15,300)
    integer, parameter :: ik = selected_real_kind(6)

    real(kind=rk) :: x
    real(rk) :: y

    integer(kind=ik) :: i
    integer(ik) :: j

    print*, rk
    print*, ik

end program ex2
