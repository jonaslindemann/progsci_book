program excercise1_21

	implicit none

	! Variables

	character(20) :: c
	real(8) :: value

	! Body of excercise1_21

	c = '2.0'

	value = toReal(c)

	write(*,*) value

	stop

contains

real(8) function toReal(c)

	implicit none
	
	character(20), intent(in) :: c

	read(c, *) toReal

	return

end function toReal

end program excercise1_21

