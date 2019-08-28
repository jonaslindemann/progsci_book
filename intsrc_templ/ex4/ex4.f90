program ex4

    implicit none

    integer, parameter :: rk = selected_real_kind(15,300)
    integer, parameter :: ik = selected_real_kind(6)

    integer :: mm
    real(rk) :: pi, pi2
    real(rk) :: K(20,20)
    real(rk) :: A(3,3)
    logical  :: flag
    character(40) :: first_name

    mm = 113
    pi = 3.141592653589793_rk
    pi2 = 3.141592653589793

    K(5,6) = 5.0_rk
    K = 0.0_rk

    A = 0.0_rk
    A(2,:) = (/ 1.0_rk, 2.0_rk, 3.0_rk /)
    A(:,2) = (/ 4.0_rk, 5.0_rk, 6.0_rk /)

    flag = .false.
    flag = .true.

    print*, pi
    print*, pi2

end program ex4
