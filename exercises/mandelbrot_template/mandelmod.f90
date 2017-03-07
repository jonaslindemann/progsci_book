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
    real(rk), intent(out) :: x_min, x_max, y_min, y_max
    
    ! integer :: fractal(density, density)
    real(rk), intent(inout), dimension(density, density) :: dfractal

    dfractal = 42.0_rk
    x_min = 0.0
    x_max = 1.0
    y_min = 0.0
    y_max = 1.0
    
    ! ---- dfractal is an array density x density, which will be modified in the
    ! ---- wrapper subroutine. 
    
    ! ---- x_min, x_max, y_min, y_max are output parameters
    
    ! ---- Implement the rest of the mandelbrot routine here
    
    ! ---- In this version of the code, Fortran will not write to files. All 
    ! ---- data will be returned through the dfractal array.
    
    ! dfractal = log(real(fractal, dp))

end subroutine mandelbrot_sim

end module mandelmod
