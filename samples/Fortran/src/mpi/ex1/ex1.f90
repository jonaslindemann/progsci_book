program hello

    use mpi

    implicit none

    integer :: ierr, icode, id, tasks

    ! Initialize MPI

    call mpi_init(ierr)

    ! Check for errors

    if (ierr /= MPI_SUCCESS) then
        print *, 'Error starting MPI program.'
        call mpi_abort(MPI_COMM_WORLD, icode, ierr)
    end if

    ! Determine rank and number of processors

    call mpi_comm_rank(MPI_COMM_WORLD, id, ierr)
    call mpi_comm_size(MPI_COMM_WORLD, tasks, ierr)

    ! Print status

    print *, 'Number of processors = ', tasks, ' My rank is = ', id

    ! Finalize MPI and exit

    call mpi_finalize(ierr)

end program hello
