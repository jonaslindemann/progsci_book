program particles

    use particle_defs
    use particle_sys_mod
    use particle_sim_mod

    implicit none

    integer(rk) :: i

    type(particle_system_class) :: particle_system
    type(particle_simulator_class) :: particle_simulator

    call particle_system % init(500)
    call particle_simulator % init(particle_system)

    print *, 'Running simulation...'

    call particle_simulator % run(1000)

    call particle_system % print()

    print *, 'Deallocating particle system...'

    call particle_system % destroy()

end program particles
