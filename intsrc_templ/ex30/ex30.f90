program sample2

    use utils

    implicit none
    real(rk), allocatable :: infield(:,:)
    real(rk), allocatable :: rowsum(:)
    integer :: rows, i, j

    integer, parameter :: infile = 15
    integer, parameter :: outfile = 16

    rows = 5
    allocate(infield(3,rows))
    allocate(rowsum(rows))

    open(unit=infile, file='indata.dat', access='sequential', action='read')
    open(unit=outfile, file='utdata.dat', access='sequential', action='write')

    do i=1,rows
        read(infile,*) (infield(j,i), j=1,3)
        rowsum(i) = infield(1,i)+infield(2,i)+infield(3,i)
        write(outfile,*) rowsum(i)
    end do

    close(infile)
    close(outfile)

    deallocate(infield)
    deallocate(rowsum)

	
end program sample2
