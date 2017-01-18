program ex9

    implicit none

    integer, parameter :: rk = selected_real_kind(15,300)

    real(rk) :: v1, v2

    call init_random()

    call random_number(v1)

    !if (v1>0.5) then
    !    v2 = 0.5
    !endif

    !if (v1>0.5) then
    !    v2 = 0.5
    !else
    !    v2 = v1
    !endif

    if (v1>0.5) then
        v2 = 0.5
    else if (v1<0.2) then
        v2 = 0.2
    else
        v2 = v1
    end if

    print*, v1
    print*, v2

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

end program ex9
