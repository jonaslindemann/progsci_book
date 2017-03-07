module mandelmod

! From http://www.fortran90.org/src/rosetta.html

use types
use constants
use mesh
use utils

implicit none

contains

subroutine mandelbrot_sim(iterations, density, dfractal, x_min, x_max, y_min, y_max)

    integer, parameter :: rk = selected_real_kind(15,300)

    integer, intent(in) :: iterations
    integer, intent(in) :: density
    real(rk), intent(inout), dimension(density, density) :: dfractal
    real(rk), intent(out) :: x_min, x_max, y_min, y_max
    
    real(rk), dimension(density, density) :: x, y
    complex(rk), dimension(density, density) :: c, z
    integer, dimension(density, density) :: fractal
    integer :: n

    x_min = -2.68_dp
    x_max = 1.32_dp
    y_min = -1.5_dp
    y_max = 1.5_dp

    call meshgrid(linspace(x_min, x_max, density), &
        linspace(y_min, y_max, density), x, y)
        
    c = x + I_*y
    z = c
    fractal = 255

    do n = 1, iterations
        print "('Iteration ', i0)", n
        where (abs(z) <= 10) z = z**2 + c
        where (fractal == 255 .and. abs(z) > 10) fractal = 254 * (n-1) / iterations
    end do
    
    dfractal = log(real(fractal, dp))

end subroutine mandelbrot_sim

end module mandelmod
