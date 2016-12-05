program ex5

    use mpi

    implicit none
    
    integer :: ierr, icode, id, tasks, request
    integer :: stat(MPI_STATUS_SIZE)
    
    real(8), allocatable :: c(:,:), A(:,:), b(:,:), row(:,:), res(:,:)
    real(8)              :: scalar(1,1), v
    integer, parameter   :: n = 10000
    integer, parameter   :: master = 0
    integer              :: i, q, r, s, t, totalRecvs, slaveId

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
    
    !print *, "I am", id, "of", tasks, "."

    ! Do real work
    
    allocate(b(n,1))    
    
    if (id == master) then
    
        ! Allocate and fill matrix A and c
        
        allocate(A(n,n))
        allocate(c(n,1))
        
        call init_random_seed()
        call random_number(A)
        call random_number(b)
    
    endif 
    
    ! Broadcast b to all slaves
    
    call mpi_bcast(b, n, MPI_DOUBLE_PRECISION, master, MPI_COMM_WORLD, ierr)
    
    if (id == master) then
    
        ! Send rows to slaves
        
        slaveId = 1
        
        print *, "Sending rows to worker nodes."
        
        do i=1,n
            if (slaveId == tasks) then
                slaveId = 1
            endif 
            call mpi_send(A(i,:), n, MPI_DOUBLE_PRECISION, slaveId, i, MPI_COMM_WORLD, ierr)        
            slaveId = slaveId + 1
        end do
        
        ! Receive row sums
        
        print *, "Receiving results from worker nodes."
        
        do i=1,n
            call mpi_recv(v, 1, MPI_DOUBLE_PRECISION, MPI_ANY_SOURCE, MPI_ANY_TAG, MPI_COMM_WORLD, stat, ierr)        
            r = stat(MPI_TAG)
            c(r,1) = v
        end do

    else
    
        ! allocate row to process

        allocate(row(1,n))
        
        ! Determine number of receives required
        
        r = modulo(n,tasks-1)
        q = (n-r)/(tasks-1)
        
        totalRecvs = q
        
        if (id-1 < r) then
            totalRecvs = totalRecvs + 1
        end if 
        
        allocate(res(totalRecvs,2))
        
        ! Receive work
        
        print *, "Node",id,"working."

        do i=1,totalRecvs
            call mpi_recv(row, n, MPI_DOUBLE_PRECISION, master, MPI_ANY_TAG, MPI_COMM_WORLD, stat, ierr)
            s = stat(MPI_TAG)
            
            ! Do work

            scalar = matmul(reshape(row, (/1, n/)),reshape(b, (/n, 1/)))
            res(i,1) = scalar(1,1)
            res(i,2) = float(s)
            
        end do
        
        print *, "Node", id, "reporting in."
        
        do i=1,totalRecvs

            ! Send results back to master
            
            s = int(res(i,2))
            
            call mpi_send(res(i,1), 1, MPI_DOUBLE_PRECISION, master, s, MPI_COMM_WORLD, ierr)
            
        end do
    endif
    
    call mpi_barrier(MPI_COMM_WORLD, ierr)
    
    if (id == master) then
    
        print *, "Done..."
               
    end if

    ! Finalize MPI and exit

    call mpi_finalize(ierr)
    
contains

    subroutine init_random_seed()
    
        ! From 
        !
        ! http://gcc.gnu.org/onlinedocs/gfortran/RANDOM_005fSEED.html#RANDOM_005fSEED
    
        integer :: i, n, clock
        integer, dimension(:), allocatable :: seed
      
        call random_seed(size = n)
        allocate(seed(n))
      
        call system_clock(count=clock)
      
        seed = clock + 37 * (/ (i - 1, i = 1, n) /)
        call random_seed(put = seed)
      
        deallocate(seed)
    
    end subroutine init_random_seed

end program ex5
