SUBROUTINE VATAN2(Y,X,ANGLE)

	!DEC$ATTRIBUTES DLLEXPORT, STDCALL :: VATAN2
	!DEC$ATTRIBUTES REFERENCE :: ANGLE
	!DEC$ATTRIBUTES VALUE :: X
	!DEC$ATTRIBUTES VALUE :: Y

	REAL(8) :: Y, X, ANGLE

	ANGLE = ATAN2(Y,X)
	
	RETURN

END SUBROUTINE VATAN2
