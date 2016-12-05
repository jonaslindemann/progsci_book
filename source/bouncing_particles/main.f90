program particles

	use particle_defs
	use particle_data
	use particle_sim

	implicit none

	type(particle_system) :: psys
	integer(rk) :: i

	print *, 'Allocating particle system...'
	call allocate_particle_system(psys, 500)
	print *, 'Initialising particle system...'
	call init_particle_system(psys)

	print *, 'Running simulation...'
	
	call write_particle_sizes(psys)

	do i = 1,1000
		call check_collision(psys)
		call check_boundary(psys)
		call update_particle_system(psys)
		call write_particle_positions(psys)		
	end do

	call print_particle_system(psys)

	print *, 'Deallocating particle system...'	

	call deallocate_particle_system(psys)

end program particles