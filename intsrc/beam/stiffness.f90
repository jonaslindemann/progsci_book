program function_sample

    implicit none

    integer, parameter :: rk = selected_real_kind(15,300)

    integer :: i, j

    real(rk) :: x1, x2, y1, y2, z1, z2
    real(rk) :: nx, ny, nz
    real(rk) :: L, E, A
    real(rk) :: Kel(2,2)
    real(rk) :: Ke(6,6)
    real(rk) :: G(2,6)

    ! Initiate scalar values

    E = 1.0_rk
    A = 1.0_rk
    x1 = 0.0_rk
    x2 = 1.0_rk
    y1 = 0.0_rk
    y2 = 1.0_rk
    z1 = 0.0_rk
    z2 = 1.0_rk

    ! Calcuate directional cosines

    L = sqrt( (x2-x1)**2 + (y2-y1)**2 + (z2-z1)**2 )
    nx = (x2-x1)/L
    ny = (y2-y1)/L
    nz = (z2-z1)/L

    ! Calucate local stiffness matrix

    Kel(1,:) = (/ 1.0_rk , -1.0_rk /)
    Kel(2,:) = (/ -1.0_rk, 1.0_rk /)
    Kel = Kel * (E*A/L)

    G(1,:) = (/ nx, ny, nz, 0.0_rk, 0.0_rk, 0.0_rk /)
    G(2,:) = (/ 0.0_rk, 0.0_rk, 0.0_rk, nx, ny, nz /)

    ! Calculate transformed stiffness matrix

    Ke = matmul(matmul(transpose(G),Kel),G)

    ! Print matrix

    do i=1,6
        write(*,'(6G10.3)') (Ke(i,j), j=1,6)
    end do

end program function_sample