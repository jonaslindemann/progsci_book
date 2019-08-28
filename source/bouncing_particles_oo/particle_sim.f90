module particle_sim_mod

    use particle_defs
    use particle_sys_mod

    implicit none

    type particle_simulator_class
    private
        type(particle_system_class) :: m_psys
    contains
        procedure :: init              => particle_simulator_init
        procedure :: update            => particle_simulator_update
        procedure :: check_boundaries  => particle_simulator_check_boundaries
        procedure :: check_collisions  => particle_simulator_check_collisions
        procedure :: run               => particle_simulator_run
    end type particle_simulator_class

contains

subroutine particle_simulator_init(this, psys)

    class(particle_simulator_class) :: this
    type(particle_system_class) :: psys

    this % m_psys = psys

end subroutine particle_simulator_init

subroutine particle_simulator_update(this, dtin)

    class(particle_simulator_class) :: this

    real(rk), allocatable :: pos(:,:)
    real(rk), allocatable :: vel(:,:)
    real(rk), allocatable :: r(:)
    integer(ik) :: i
    real(rk), intent(in), optional :: dtin
    real(rk) :: dt

    pos = this % m_psys % positions()
    vel = this % m_psys % velocities()
    r = this % m_psys % radius()

    if (present(dtin)) then
            dt = dtin
    else
            dt = this % m_psys % rmin()/(3.0_rk*this % m_psys % v0())
    end if

    pos = pos + vel * this % m_psys % dt()

end subroutine particle_simulator_update

subroutine particle_simulator_check_boundaries(this)

    class(particle_simulator_class) :: this
    real(rk), allocatable :: pos(:,:)
    real(rk), allocatable :: vel(:,:)
    real(rk), allocatable :: r(:)
    integer(ik) :: i

    pos = this % m_psys % positions()
    vel = this % m_psys % velocities()
    r = this % m_psys % radius()

    do i=1,this % m_psys % count()
        if (pos(i,1) < r(i)) vel(i,1) = -vel(i,1)
        if (pos(i,1)>1.0_rk-r(i)) vel(i,1) = -vel(i,1)
        if (pos(i,2)<r(i)) vel(i,2) = -vel(i,2)
        if (pos(i,2)>1.0_rk-r(i)) vel(i,2) = -vel(i,2)
    end do

end subroutine

subroutine particle_simulator_check_collisions(this)

    class(particle_simulator_class) :: this
    real(rk), allocatable :: pos(:,:)
    real(rk), allocatable :: vel(:,:)
    real(rk), allocatable :: r(:)

    integer(ik) :: i, j
    real(rk) :: d, r1, r2
    real(rk) :: vi(2), vj(2)
    real(rk) :: si(2), sj(2)
    real(rk) :: n(2), vdiff(2)
    real(rk) :: q

    pos = this % m_psys % positions()
    vel = this % m_psys % velocities()
    r = this % m_psys % radius()

    !       | -------------|
    !               d
    ! | --- o --- |   | -- o -- |
    !          r1       r2
    !
    ! collide is true if d < (r1+r2)

    do i=1,this % m_psys % count()
        do j=i+1,this % m_psys % count()
            n = pos(j,:) - pos(i,:)
            d = sqrt((pos(j,1)-pos(i,1))**2.0_rk+(pos(j,2)-pos(i,2))**2)
            vdiff = vel(j,:) - vel(i,:)
            if ((d<(r(i)+r(j))).and.(dot_product(n,vdiff)<0.0_rk)) then
                q = dot_product(vdiff,n)/dot_product(n,n)
                vel(i,:) = vel(i,:) + n * q
                vel(j,:) = vel(j,:) - n * q
            endif
        end do
    end do

end subroutine

subroutine particle_simulator_run(this, n_iterations)

    class(particle_simulator_class) :: this
    integer, intent(in) :: n_iterations
    integer :: i

    call this % m_psys % write_sizes()

    do i = 1,n_iterations
        call this % check_collisions()
        call this % check_boundaries()
        call this % update()
        !call this % m_psys % write_positions()
    end do

end subroutine

end module particle_sim_mod
