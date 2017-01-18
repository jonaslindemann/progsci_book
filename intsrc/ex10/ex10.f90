program ex10

    implicit none

    integer, parameter :: rk = selected_real_kind(15,300)

    real(rk) :: r
    integer  :: v

    call init_random()
    call random_number(r)

    v = nint(50.0_rk - 100.0_rk * r)

    print*, v

    select case (v)
    case (:-20)
        print*, "v <= -1"
    case (0)
        print*, "v == 0"
    case (20:)
        print*, "v >=1"
    case default
        print*, "v is in the default range"
    end select

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

end program ex10
