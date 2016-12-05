program tpk
	! Fortran F style
	implicit none
	integer               :: i
	real                  :: y
	real, dimension(0:10) :: A
	read *, A
	do i = 10, 0, -1        ! Backwards
		y = fun(A(I))
		if ( y < 400.0 ) then
			print *, i, y
		else
			print *, i, "Too large"
		end if
	end do
contains                ! Local function
	function fun(t) result(fun_result)
		real :: fun_result
		real, intent(in) :: t
		fun_result = sqrt(abs(t)) + 5.0*t**3
	end function fun
end program tpk