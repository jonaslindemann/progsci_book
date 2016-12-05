program exercise1_19

	implicit none
	
	! Variables
	
	integer, parameter :: ap = selected_real_kind(15,300)
	integer, parameter :: linjeFil = 15
	integer :: nPoints
	integer :: i
	real(ap) :: x, y, lastX, lastY
	real(ap) :: summedLength
	
	! Body of exercise1_19
	
	open(unit=linjeFil, file='linje.dat', &
		access='sequential', &
		action='read', status='old')
	
	read(linjeFil,*) nPoints
	
	summedLength = 0.0_ap
	
	do i=1,nPoints
		read(linjeFil,*) x, y
	
		if (i>1) then
			summedLength = summedLength + sqrt((x-lastX)**2+(y-lastY)**2)
		end if 
	
		lastX = x
		lastY = y
	end do
	
	close(linjeFil)
	
	write(*,'(T1,A,G15.3)') 'Total langd = ',summedLength

end program exercise1_19

