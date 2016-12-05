program logic

	implicit none

	integer :: x
	logical :: flag

	! Läs in ett heltal

	write(*,*) 'Ange ett heltal.'
	read(*,*) x

	! Korrigera inmatat värde till intervallet
	! (0-1000)

	flag = .FALSE.

	if (x>1000) then
		x = 1000
		flag = .TRUE.
	end if
	
	if (x<0) then
		x = 0
		flag = .TRUE.
	end if

	! Om flag = .TRUE. har inmatad värde
	! korrigerats

	if (flag) then
		write(*,'(a,I4)') 'Korrigerat varde = ', x
	else
		write(*,'(a,I4)') 'Varde = ', x
	end if

	stop

end program logic
