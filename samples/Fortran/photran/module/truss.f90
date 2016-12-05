module truss

! -----------------------------------------------------
! Variabeldeklarationer
! -----------------------------------------------------

! Deklarationer som skall vara synliga utåt

integer, public, parameter :: &
ap = selected_real_kind(15,300)

! Privata deklarationer

integer, private :: my_private_variable

contains

! -----------------------------------------------------
! Subrutiner
! -----------------------------------------------------

subroutine bar3e(ex,ey,ez,ep,Ke)

	implicit none


	real(ap) :: ex(2), ey(2), ez(2), ep(2)
	real(ap) :: Ke(6,6)

	real(ap) :: nxx, nyx, nzx
	real(ap) :: L, E, A
	real(ap) :: Kel(2,2)
	real(ap) :: G(2,6)

	! Beräkna riktningskosiner

	L = sqrt( (ex(2)-ex(1))**2 + (ey(2)-ey(1))**2 + (ez(2)-ez(1))**2 )
	nxx = (ex(2)-ex(1))/L
	nyx = (ey(2)-ey(1))/L
	nzx = (ez(2)-ez(1))/L

	! Beräkna lokal styvhetsmatris

	Kel(1,:) = (/  1.0_ap , -1.0_ap  /)
	Kel(2,:) = (/ -1.0_ap,   1.0_ap  /)

	Kel = Kel * (ep(1)*ep(2)/L)

	G(1,:) = (/ nxx, nyx, nzx, 0.0_ap, 0.0_ap, 0.0_ap /)
	G(2,:) = (/ 0.0_ap, 0.0_ap, 0.0_ap, nxx, nyx, nzx /)

	! Beräkna transformerad styvhetsmatris

	Ke = matmul(matmul(transpose(G),Kel),G)

	return

end subroutine bar3e

! -----------------------------------------------------

subroutine writeMatrix(A)

	real(ap) :: A(6,6)

	! Skriv ut matris

	do i=1,6
		write(*,'(6G10.4)') (A(i,j), j=1,6)
	end do

	return

end subroutine writeMatrix

! -----------------------------------------------------

end module truss