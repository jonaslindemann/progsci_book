program debugging_sample

    integer :: input_array(10), output_array(10)
    integer :: i, k, n
    integer, parameter :: infile = 15

    ! Läs tal från fil

    open(unit=infile, file='input.dat', status='old')
    read(infile,*) n, (input_array(i),i=1,n)
    close(infile)

    ! Kvadrera alla tal skilda från 0 och lagra
    ! i output\_array

    k = 0

    do i=1,n
        if (input_array(i).ne.0) then
            output_array(k) = input_array(i)**2
        end if
    end do

    ! Skriv ut alla kvadrerade värden

    write(*,'(A,I2)') 'Antal varden inlasta ', n
    write(*,'(A,I2)') 'Antal varden skilda fran 0', k

    do i=1,k
        write(*,'(A,I2,A,I4)') 'Element ',i,' har vardet ',output_array(i)
    end do

    stop

end program debugging_sample