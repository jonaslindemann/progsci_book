module particle_sys_mod

    use particle_defs
    use particle_utils

    implicit none

    type particle_system_class
    private
        integer(ik) :: m_n_particles
        real(rk) :: m_v0
        real(rk) :: m_rmin
        real(rk) :: m_rmax
        real(rk) :: m_dt
        real(rk), allocatable :: m_pos(:,:)
        real(rk), allocatable :: m_vel(:,:)
        real(rk), allocatable :: m_r(:)
    contains
        procedure :: init            => particle_system_init
        procedure :: destroy         => particle_system_destroy

        procedure :: print           => particle_system_print
        procedure :: write_sizes     => particle_system_write_sizes
        procedure :: write_positions => particle_system_write_positions

        procedure :: count           => particle_system_count
        procedure :: v0              => particle_system_v0
        procedure :: rmin            => particle_system_rmin
        procedure :: rmax            => particle_system_rmax
        procedure :: dt              => particle_system_dt
        procedure :: positions       => particle_system_positions
        procedure :: velocities      => particle_system_velocities
        procedure :: radius          => particle_system_radius
    end type particle_system_class

contains

subroutine particle_system_init(this, n)

    class(particle_system_class) :: this
    integer(ik), intent(in) :: n
    integer(ik) :: i
    real(rk) :: alfa

    this%m_n_particles = n
    allocate(this%m_pos(n,2))
    allocate(this%m_vel(n,2))
    allocate(this%m_r(n))

    this % m_v0 = 0.001_rk
    this % m_rmin = 0.005_rk
    this % m_rmax = 0.015_rk

    call init_random_seed()

    call random_number(this % m_pos)
    call random_number(this % m_r)

    do i=1,this % m_n_particles
        call random_number(alfa)
        alfa = 2.0_rk*pi*alfa
        this % m_vel(i,1) = this % m_v0 * cos(alfa)
        this % m_vel(i,2) = this % m_v0 * sin(alfa)
    end do

    this % m_r = this % m_rmin + this % m_r * (this % m_rmax - this % m_rmin)

end subroutine particle_system_init

subroutine particle_system_destroy(this)

    class(particle_system_class) :: this

    deallocate(this % m_pos, this % m_vel, this % m_r)
    this % m_n_particles = -1

end subroutine

subroutine particle_system_print(this)

    class(particle_system_class) :: this
    integer(ik) :: i

    print *, 'Max particle x coord = ', maxval(this % m_pos(:,1))
    print *, 'Min particle x coord = ', minval(this % m_pos(:,1))
    print *, 'Max particle y coord = ', maxval(this % m_pos(:,2))
    print *, 'Min particle y coord = ', minval(this % m_pos(:,2))

    !write(*,*) '----- Particle postion - velocity -----------------------------'
    !do i=1,this%n_particles
    !   write(*,'(2F12.5,A5,2F12.5)') this%pos(i,:), '-', this%vel(i,:)
    !end do

	!write(*,*) '----- Particle size -------------------------------------------'
        !do i=1,this%n_particles
        !        write(*,'(F12.5)') this%r(i)
	!end do

end subroutine particle_system_print

subroutine particle_system_write_sizes(this)

    class(particle_system_class) :: this
    integer(ik) :: i

    open(unit=15, file='particle.state', access='APPEND')
    write(15, '(I10)') this % m_n_particles
    do i = 1,this % m_n_particles
            write(15, '(2F12.5)') this % m_r(i)
    end do
    close(unit=15)

end subroutine particle_system_write_sizes

subroutine particle_system_write_positions(this)

    class(particle_system_class) :: this
    integer(ik) :: i

    open(unit=15, file='particle.state', access='APPEND')
    write(15, '(I10)') this % m_n_particles
    do i = 1,this % m_n_particles
            write(15, '(2F12.5)') this % m_pos(i,:)
    end do
    close(unit=15)
	
end subroutine particle_system_write_positions

real(rk) function particle_system_v0(this) result(v0)

    class(particle_system_class) :: this

    v0 = this % m_v0

end function

real(rk) function particle_system_rmin(this) result(rmin)

    class(particle_system_class) :: this

    rmin = this % m_rmin

end function

real(rk) function particle_system_rmax(this) result(rmax)

    class(particle_system_class) :: this

    rmax = this % m_rmax

end function

real(rk) function particle_system_dt(this) result(dt)

    class(particle_system_class) :: this

    dt   = this % m_dt

end function

function particle_system_positions(this) result(arr)

    class(particle_system_class) :: this
    real(rk), allocatable :: arr(:,:)

    arr = this % m_pos

end function

function particle_system_velocities(this) result(arr)

    class(particle_system_class) :: this
    real(rk), allocatable :: arr(:,:)

    arr = this % m_vel

end function

function particle_system_radius(this) result(arr)

    class(particle_system_class) :: this
    real(rk), allocatable :: arr(:)

    arr = this % m_r

end function

function particle_system_count(this) result(count)

    class(particle_system_class) :: this
    integer :: count

    count = this % m_n_particles

end function

end module particle_sys_mod
