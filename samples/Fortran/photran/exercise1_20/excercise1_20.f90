program excercise1_20

	implicit none

	! Variables

	character(7) :: c1
	character(2) :: c2
	character(4) :: c3
	character(15) :: c4

	! Body of excercise1_20

	c1 = 'Fortran'
	c2 = 'är'
	c3 = 'kul.'

	c4 = c1//' '//c2//' '//c3

	write(*,*) c4

	stop

end program excercise1_20

