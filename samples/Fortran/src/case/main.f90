program case_sample

	integer :: value
	
	print *, "Enter a value"
	read(*,*) value
	
	select case (value)
		case (:0)
			print *, "St�rre �n ett."
		case (1)
			print *, "Nummer ett!"
		case (2:9)
			print *, "Mellan 2 och 9."
		case (10)
			print *, "Nummer 10!"
		case (11:41)
			print *, "Mindre �n 42 men st�rre �n 10."
		case (42)
			print *, "Meningen med livet eller kanske 6*7."
		case (43:)
			print *, "St�rre �n 42."
		case default
			print *, "Detta skall aldrig intr�ffa!"
	end select

	stop

end program case_sample