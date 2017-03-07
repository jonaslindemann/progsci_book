program test_loadtxt
use types, only: dp
use utils, only: loadtxt, savetxt, assert
implicit none

real(dp) :: d(3, 2), e(2, 3)
real(dp), allocatable :: d2(:, :)
d = reshape([1, 2, 3, 4, 5, 6], [3, 2])
call savetxt("tmp.dat", d)
call loadtxt("tmp.dat", d2)
call assert(all(shape(d2) == [3, 2]))
call assert(all(d == d2))

e = reshape([1, 2, 3, 4, 5, 6], [2, 3])
call savetxt("tmp.dat", e)
call loadtxt("tmp.dat", d2)
call assert(all(shape(d2) == [2, 3]))
call assert(all(e == d2))

end program
