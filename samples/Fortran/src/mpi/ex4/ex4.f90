program ex2

    use mpi

    implicit none

    integer :: ierr, icode, id, tasks, request
    integer :: stat(MPI_STATUS_SIZE)

    real(8), allocatable :: globalVector(:)
    real(8), allocatable :: localVector(:)
    real(8)              :: globalSum, localSum, taskSum
    integer, parameter   :: globalSize = 100
    integer              :: localSize
    integer              :: i

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

    ! Do real work

    localSize = globalSize / tasks

    ! Allocate work vector

    allocate(localVector(localSize))

    if (id==0) then

        print *, "Tasks =", tasks
    
        ! Allocate vector and fill with random numbers 

        print *, "Allocating global vector."

        allocate(globalVector(globalSize))

        call srand(36483)
        
        do i=1,globalSize
            globalVector(i) = rand()
        end do

        print *, "Sending vector to workers."
        print *, "Size of subvectors =", localSize

        do i=1,tasks-1
            call mpi_isend(globalVector(i*localSize+1:(i+1)*localSize), localSize, &
                MPI_DOUBLE_PRECISION, i, 99, MPI_COMM_WORLD, request, ierr)
        end do
        
        localVector = globalVector(1:localSize)

    else 
        
        ! Receive local work vector

        call mpi_irecv(localVector, localSize, MPI_DOUBLE_PRECISION, 0, 99, &
            MPI_COMM_WORLD, request, ierr)
            
        print *, "irecv error =", ierr
            
    end if 
    
    ! Wait for receives to complete before calculating sum
    
    if (id/=0) then
        print *, "Waiting for receive to complete."
        call mpi_wait(request, stat, ierr)
        print *, ierr
        print *, localVector
    end if
    
    ! Calculate sum
    
    print *, "Calculating sum."
    
    localSum = sum(localVector)
    
    ! Do a reduce operation to collect the results from the worker nodes.
    ! There is no need to wait for the sends to complete as the worker
    ! nodes will wait for the receives to complete. mpi_reduce will
    ! wait for all nodes before the reduce operation.
        
    call mpi_reduce(localSum, globalSum, 1, MPI_DOUBLE_PRECISION, &
        MPI_SUM, 0, MPI_COMM_WORLD, ierr)

    ! Let the master node print the sum

    if (id==0) then
        print *, "Total sum =", globalSum
        print *, "Should be =", sum(globalVector)
    end if

    ! Finalize MPI and exit

    call mpi_finalize(ierr)

end program ex2
