program sample2

    implicit none
    real(8), allocatable :: infield(:,:)
    real(8), allocatable :: rowsum(:)
    integer :: rows, i, j
    integer, parameter :: infile = 15
    integer, parameter :: outfile = 16

    !  Allokera matriser

    rows=5
    allocate(infield(3,rows))
    allocate(rowsum(rows))

    !  Öppna indata och utdata filer

    open(unit=infile,file='indata.dat',&
        access='sequential',&
        action='read',status='old')
    open(unit=outfile,file='utdata.dat',&
        access='sequential',&
        action='write',status='unknown')

    !  Läs indata från fil

    do i=1,rows
        read(infile,*) (infield(j,i),j=1,3)
        rowsum(i)=&
            infield(1,i)+infield(2,i)+infield(3,i)
        write(outfile,*) rowsum(i)
    end do

    !  Stäng filer

    close(infile)
    close(outfile)

    !  Frigör minne

    deallocate(infield)
    deallocate(rowsum)
	
    stop
	
end program sample2
