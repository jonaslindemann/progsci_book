program loop_sample

	implicit none

	integer :: i

	do i=1,20
		if (i>10) then
			write(*,*) 'Avbryter loop.'
			exit
		else if (i<5) then
			write(*,*) 'Hoppar over.'
			cycle
		end if
		write(*,*) i
	end do

	stop

end program loop_sample