module particle_sim

	use particle_defs
	use particle_data
	use vector_operations

	implicit none

contains

subroutine update_particle_system(psys, dtin)

	type(particle_system), intent(inout) :: psys
	integer(ik) :: i
	real(rk), intent(in), optional :: dtin
	real(rk) :: dt
	
	if (present(dtin)) then
		dt = dtin
	else
		dt = psys%rmin/(3.0_rk*psys%v0)
	end if 

	psys%pos = psys%pos + psys%vel * dt

end subroutine update_particle_system

subroutine check_boundary(psys)

	type(particle_system), intent(inout) :: psys
	integer(ik) :: i

	do i=1,psys%n_particles
		if (psys%pos(i,1)<psys%r(i)) psys%vel(i,1) = -psys%vel(i,1)
		if (psys%pos(i,1)>1.0_rk-psys%r(i)) psys%vel(i,1) = -psys%vel(i,1)
		if (psys%pos(i,2)<psys%r(i)) psys%vel(i,2) = -psys%vel(i,2)
		if (psys%pos(i,2)>1.0_rk-psys%r(i)) psys%vel(i,2) = -psys%vel(i,2)
	end do

end subroutine check_boundary

subroutine check_collision(psys)
        type(particle_system), intent(inout) :: psys
        
	integer(ik) :: i, j
	real(rk) :: d, r1, r2
	real(rk) :: vi(2), vj(2)
	real(rk) :: si(2), sj(2)
	real(rk) :: n(2), vdiff(2)
	real(rk) :: q
	
	!       | -------------|
	!               d
	! | --- o --- |   | -- o -- |
	!          r1       r2
	! 
	! collide is true if d < (r1+r2)
	
	do i=1,psys%n_particles
		do j=i+1,psys%n_particles
			n = psys%pos(j,:) - psys%pos(i,:)
			d = sqrt((psys%pos(j,1)-psys%pos(i,1))**2.0_rk+(psys%pos(j,2)-psys%pos(i,2))**2)
			vdiff = psys%vel(j,:) - psys%vel(i,:)
			if ((d<(psys%r(i)+psys%r(j))).and.(dot_product(n,vdiff)<0.0_rk)) then
				q = dot_product(vdiff,n)/dot_product(n,n)
				psys%vel(i,:) = psys%vel(i,:) + n * q
				psys%vel(j,:) = psys%vel(j,:) - n * q
			endif
		end do
	end do       

end subroutine check_collision

subroutine check_collision2(psys)
        type(particle_system), intent(inout) :: psys
        
	integer(ik) :: i, j
	real(rk) :: d, r1, r2
	type(vector) :: vi, vj
	type(vector) :: si, sj
	type(vector) :: n, vdiff
	real(rk) :: q
	
	!       | -------------|
	!               d
	! | --- o --- |   | -- o -- |
	!          r1       r2
	! 
	! collide is true if d < (r1+r2)
	
	do i=1,psys%n_particles
		do j=i+1,psys%n_particles
			n%c = psys%pos(j,:) - psys%pos(i,:)
			si%c = psys%pos(i,:)
			sj%c = psys%pos(j,:)
			vi%c = psys%vel(i,:)
			vj%c = psys%vel(j,:)
			d = len(sj - si)
			!d = sqrt((psys%pos(j,1)-psys%pos(i,1))**2.0_rk+(psys%pos(j,2)-psys%pos(i,2))**2)
			vdiff = vj - vi
			if ((d<(psys%r(i)+psys%r(j))).and.(n.dot.vdiff)<0.0_rk) then
				q = (vdiff.dot.n)/(n.dot.n)
				psys%vel(i,:) = psys%vel(i,:) + n%c * q
				psys%vel(j,:) = psys%vel(j,:) - n%c * q
			endif
		end do
	end do       

end subroutine check_collision2

end module particle_sim
