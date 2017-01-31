program ex28

    use utils

    implicit none

    real(rk) :: a(3)
    integer  :: b(4)
    integer  :: i, j

    a = (/1.0, 2.0, 3.0/)
    b = (/4, 5, 6, 7/)

    write(*, '(3A8,4A5)') 'aaaaaaaa', 'bbbbbbbb', 'cccccccc', 'dddddd', 'eeeee', 'fffff', 'ggggg'

    do j=1,10
        write(*, '(3G12.5,4I5)') (a(i), i=1,3), (b(i), i=1,3)
    end do

end program ex28
