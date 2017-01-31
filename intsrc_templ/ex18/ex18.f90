program ex18

    implicit none

    integer, parameter :: rk = selected_real_kind(15,300)

    real(rk), allocatable :: f(:)
    real(rk), allocatable :: K(:,:)

    allocate(f(20))
    allocate(K(20,20))

    f = 0.0_rk
    K = 0.0_rk

    deallocate(f, K)

end program ex18
