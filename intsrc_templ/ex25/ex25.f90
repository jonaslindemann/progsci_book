program ex25

    use utils

    implicit none

    real(rk) :: A(10,10)
    logical  :: B(10,10)
    real(rk) :: v1(3)
    real(rk) :: v2(3)
    real(rk) :: dp

    call initRand()
    call randMat(A, -10.0_rk, 10.0_rk)

    B = .true.

    if (all(B).eqv. .true.) then
        print*, 'All elements are true'
    else
        print*, 'Not all elements are true'
    end if

    B = .false.
    !B(5,5) = .true.

    if (any(B) .eqv. .true.) then
        print *, 'Some element sin B are true'
    else
        print*, 'None of the elements in b are true'
    end if

    print*, maxval(A)
    print*, minval(A)
    print*, product(A)
    print*, sum(A)

end program ex25
