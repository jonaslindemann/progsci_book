program testatan2

	real(8) :: x, y, angle

	x = 1.0
	y = 0.0
	angle = atan2(y,x)

	write(*,*) angle

	x = 0.0
	y = 1.0
	angle = atan2(y,x)

	write(*,*) angle

	x = -1.0
	y = 0
	angle = atan2(y,x)

	write(*,*) angle

	x = 0.0
	y = -1.0
	angle = atan2(y,x)

	write(*,*) angle

	stop

end program testatan2


