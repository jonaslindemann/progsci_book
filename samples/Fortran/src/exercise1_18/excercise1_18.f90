program excercise1_18

	implicit none

	! Variables

	integer, parameter :: ap = selected_real_kind(15,300)
	real(ap) :: x
	real(ap) :: f

	! Body of excercise1_18

	write(*,'(t5,a,t21,a)') 'x','f(x)'

	x = -1.0_ap
	do while (x<1.05)
		f = sin(x)
		write(*,'(t4,f6.3,t20,f6.3)') x, f
		x = x + 0.1_ap
	end do

	stop
	
end program excercise1_18

