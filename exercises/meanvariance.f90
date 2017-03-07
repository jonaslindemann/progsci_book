subroutine meanvariance(a, n, mean, variance)

	implicit none
	integer, parameter :: rp = selected_real_kind(15,300)

	real(rp), intent(in) :: a(n)
	integer, intent(in) :: n
	real(rp), intent(out) :: mean
	real(rp), intent(out) :: variance
	
	real(rp) :: sum

	mean = sum(a)/n
	variance = 1.0_rp*sum(a**2 - mean)/(n-1)

end subroutine meanvariance


	
