program ex28

    use utils

    implicit none

    real(rk) :: a(3)
    integer  :: b(4)
    integer  :: i, j

    ! Write table header

    a = (/ 1.0, 2.0, 3.0 /)
    b = (/ 4, 5, 6, 7 /)

    write(*, '(3A8,4A5)') 'aaaaaaaa', 'bbbbbbbb', 'cccccccc', &
        'ddddd', 'eeeeee', 'fffff', 'ggggg'

    write(*, '(3G10.4,4I5)') (a(i), i=1,3), (b(i), i=1,4)

end program ex28
