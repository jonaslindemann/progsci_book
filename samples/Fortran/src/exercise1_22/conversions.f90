module conversions

	implicit none

contains

real(8) function toReal(c)

	implicit none
	
	character(20), intent(in) :: c

	read(c, *) toReal

	return

end function toReal

integer function toInteger(c)

	implicit none
	
	character(20), intent(in) :: c

	read(c, *) toInteger

	return

end function toInteger

end module conversions
