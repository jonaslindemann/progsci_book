program ex1

    integer :: a
    integer(kind=4) :: b

    real(kind=8) :: c
    real(8) :: d

    character(len=20) :: textstring
    character :: t
    character(20) :: textstring2
    character(len=20, kind=1) :: textstring3

    a = 4
    b = 5
    c = 1.0_8
    d = 2.0_8
    e = 0.0_8

    t = 'a'
    textstring = 'hello'
    textstring2 = 'World'
    textstring3 = 'English'

    print*, a
    print*, c
    print*, textstring3

end program ex1
