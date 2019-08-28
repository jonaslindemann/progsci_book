program ex18

    implicit none

    integer, parameter :: rk = selected_real_kind(15,300)

    integer :: n
    real(rk), allocatable :: f(:)
    real(rk), dimension(:,:), allocatable :: K
    !real(rk), allocatable :: K(:,:)

    n = 200

    allocate(f(n))
    allocate(K(n,n))

    K = 42.0_rk
    f = 84.0_rk

    deallocate(f)
    deallocate(K)

end program ex18
