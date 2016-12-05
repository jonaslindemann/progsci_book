program exercise2_22

	use conversions

	! Variables

	character(20) :: c
	character(20) :: d
	real(8) :: floatValue
	integer :: intValue

	! Body of excercise1_21

	c = '2.0'
	d = '42'

	floatValue = toReal(c)
	intValue = toInteger(d)

	write(*,*) 'Hej hopp!'
	write(*,*) intValue
	print *, c
	print *, d

	stop

end program exercise2_22

