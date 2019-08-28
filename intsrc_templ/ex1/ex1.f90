program ex1

    integer(kind=4) :: a
    integer(4) :: b ! short form

    real(kind=8) :: c
    real(8) :: d ! short form

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
    textstring = 'Hello'


end program ex1
