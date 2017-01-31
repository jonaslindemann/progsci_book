program ex9

    use utils

    implicit none

    real(rk) :: v1, v2

    call initRand()
    call randVal(v1, 0.0_rk, 1.0_rk)

    !if (v1>0.5_rk) then
    !    v2 = 0.5_rk
    !end if

    !if (v1>0.5) v2 = 0.5

    !if (v1>0.5_rk) then
    !    v2 = 0.5_rk
    !else
    !    v2 = v1
    !end if

    if (v1>0.5_rk) then
        v2 = 0.5
    else if (v1<0.2_rk) then
        v2 = 0.2
    else
        v2 = v1
    end if

    print*, v1
    print*, v2
end program ex9
