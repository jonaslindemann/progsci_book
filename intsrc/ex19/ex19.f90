program ex19

    implicit none

    integer, parameter :: rk = selected_real_kind(15,300)

    real(rk), allocatable :: A(:,:)
    real(rk), allocatable :: B(:,:)

    allocate(A(20,20), B(20,20))

    call init_random()
    call random_number(A)
    call random_number(B)

    where (A>0.8_rk) A = 0.8

    where (A<0.2_rk)
        A = 0.2_rk
    end where

    where (B<0.5_rk)
        B = 0.0_rk
    else where
        B = 1.0_rk
    end where

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

end program ex19
