program ex20

    implicit none

    integer, parameter :: rk = selected_real_kind(15,300)

    real(rk), allocatable :: A(:,:)
    real(rk), allocatable :: B(:,:)
    integer :: i, j

    allocate(A(20,20), B(20,20))

    call init_random()
    call random_number(A)
    call random_number(B)

    do i=1,20
        A(i,i) = 2.0_rk * B(i,i)
    end do

    forall(i=1:20) A(i,i) = 2.0_rk * B(i,i)

    forall(i=1:20, j=1:20) A(i,j) = i + j

    forall(i=1:20, j=1:20, A(i,j)/=0.0_rk)
        B(i,j) = 1.0/A(i,j)
    end forall

    deallocate(A, B)

contains

    subroutine init_random()
        integer :: values(1:8), k
        integer, dimension(:), allocatable :: seed
        real(8) :: r
        call date_and_time(values=values)
        call random_seed(size=k)
        allocate(seed(1:k))
        seed(:) = values(8)
        call random_seed(put=seed)
    end subroutine

end program ex20
