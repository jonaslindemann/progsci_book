module tabulate

    use utils

    implicit none

contains

subroutine printTable(startInterval, endInterval, step, func)

    real(rk), intent(in) :: startInterval, endInterval, step
    real(rk) :: x

    interface
        real(rk) function func(x)
            use utils ! <--- Important
            real(rk), intent(in) :: x
        end function
    end interface

    x = startInterval
    do while (x<endInterval)
        print*, x, func(x)
        x = x + step
    end do

    return

end subroutine printTable

end module tabulate
