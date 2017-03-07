# Procedures as argument

 * procedures in Fortran 95 can take procedures as arguments
 * Properties of ?dummy? procedure arguments must agree
 * The procedure type is declared in the specification part
 * Internal procedures can?t be used

# Exempel 31

ex31.f90

    program sample2

        use utils
        use functions
        use tabulate

        implicit none

        call printTable(0.0_8, 3.14_8, 0.1_8, myfunc1)

    end program sample2

functions.f90

    module functions

        use utils

        implicit none

    contains

    real(rk) function myfunc1(x)

        real(rk), intent(in) :: x

        myfunc1 = sin(x)

    end function myfunc1

    real(rk) function myfunc2(x)

        real(rk), intent(in) :: x

        myfunc2 = sqrt(x)

    end function myfunc2

    end module functions
    
tabulate.f90

    module tabulate

        use utils

        implicit none

    contains

    subroutine printTable(startInterval, endInterval, step, func)

        real(rk), intent(in) :: startInterval, endInterval, step
        real(rk) :: x

        interface
            real(rk) function func(x)
                use utils ! <---- IMPORTANT
                real(rk), intent(in) :: x
            end function func
        end interface

        x = startInterval
        do while (x<endInterval)
            print *, x, func(x)
            x = x + step
        end do

        return

    end subroutine printTable

    end module tabulate

# Keyword and optional arugments

 * Many procedures have long argument lists
   - All arguments not needed
 * Procedural arguments in Fortran can be given the attribute optional 
   - real, optional :: a
 * Optional arguments can be omitted in the procedure call
   - Presence of an argument can be tested with the present function.
 * Arguments can be specified with keywords

# Example 32

    program sample2

        use utils

        implicit none

        call order_icecream(2)
        !call order_icecream(2, 1)
        !call order_icecream(4, 4, 2)
        !call order_icecream(4, topping=3)

    contains

    subroutine order_icecream(number, flavor, topping)

            integer :: number
            integer, optional :: flavor
            integer, optional :: topping

            print *, number, 'icecreams ordered.'

            if (present(flavor)) then
                    print *, 'Flavor is ', flavor
            else
                    print *, 'No flavor was given.'
            end if

            if (present(topping)) then
                    print *, 'Topping is ', topping
            else
                    print *, 'No topping was given.'
            end if

    end subroutine order_icecream

    end program sample2

# Overloading

 * Procedure call to different procedures depending on datatype
 * Declare an interface with procedural interfaces for all used datatypes
 * Explicit interfaces (modules) can use a simpler form 
   * module procedure procedure-name-list

# Example 33

ex33.f90

    program overloading

        use utils
        use special

        implicit none

        integer :: a = 42
        real(rk) :: b = 42.0_8

        a = func(a)
        b = func(b)

        print *, a
        print *, b

    end program overloading

special.f90

    module special

    use utils

    interface func
        module procedure ifunc, rfunc
    end interface

    contains

    integer function ifunc(x)

        integer, intent(in) :: x
        ifunc = x * 42

    end function ifunc

    real(rk) function rfunc(x)

        real(rk), intent(in) :: x
        rfunc = x / 42.0_rk

    end function rfunc

    end module special

# Operator overloading

 * Define operations on derived types
 * Vector / Matrix operations
 * interface operator(operator) used to define a function implementing the operations for this operator
 * Function has the form
   * type(derived-type-name) function-name(operand1, operand2)

# Example 34

vector_operations.f90

    module vector_operations

    use utils

    type vector
        real(rk) :: components(3)
    end type vector

    interface operator(+)
        module procedure vector_plus_vector
    end interface

    contains

    type(vector) function vector_plus_vector(v1, v2)

        type(vector), intent(in) :: v1, v2
        vector_plus_vector % components = v1 % components + v2 % components

    end function vector_plus_vector

    end module vector_operations


ex34.f90

    program operator_overloading

        use vector_operations

        implicit none

        type(vector) :: v1
        type(vector) :: v2
        type(vector) :: v

        v1 % components = (/1.0, 0.0, 0.0/)
        v2 % components = (/0.0, 1.0, 0.0/)

        v = v1 + v2

        print *, v

    end program operator_overloading

# Public and private attributes

 * Control visibility of variables and functions
 * Hide module implementation details
 * Prevent side effects in modules
 * Visibility of variables controlled by private and  public attributes
 * procedure visibility controlled by 
   * private access-list
 * public is the default for all module variables and procedures

# Example 35

mymodule.f90

    module mymodule

        implicit none

        integer, public :: visible
        integer, private :: invisible

        private privatefunc
        public publicfunc

    contains

    subroutine privatefunc

        print *, 'This function can only be called from within a module.'

    end subroutine privatefunc

    subroutine publicfunc

        call privatefunc

    end subroutine publicfunc

    end module mymodule

ex35.f90

    program private_entities

        use mymodule

        implicit none

        call publicfunc
        ! call privatefunc

    end program private_entities

# Pointers

 * Pointer = reference to a variable
 * Strictly typed
 * Pointer targets must have target attribute
   * For compiler optimisation
 * Enables the return of allocatable arrays from procedures
 * nullify(pointer) disassociates pointer from target
 * => operator is used to associated a pointer with a target

# Example 36

    program pointers

        implicit none

        integer, allocatable, dimension(:,:), target :: A
        integer, dimension(:,:), pointer :: B, C

        allocate(A(20,20))

        B => A

        print *, size(B,1), size(B,2)

        call createArray(C)

        print *, size(C,1), size(C,2)

        deallocate(C)

        B => null()

        B(1,1) = 0 ! Dangerous!

    contains

    subroutine createArray(D)

        integer, dimension(:,:), pointer :: D

        allocate(D(10,10))

    end subroutine createArray

    end program pointers

# FILE IO POWERPOINT

# Allocatable array extensions

 * Remove the need for pointers to use allocatable arrays as dummy arguments
 * Inefficient 

# Example 37 - Allocatable dummy arguments

    program allocatable_dummy

        use utils

        implicit none

        real(rk), allocatable :: A(:,:)

        call createArray(A)

        print *, size(A,1), size(A,2)

        deallocate(A)

    contains

    subroutine createArray(A)

        real(rk), allocatable, intent(out) :: A(:,:)

        allocate(A(20,20))

    end subroutine createArray

    end program allocatable_dummy

# Example 38 - Allocatable function

    program allocatable_function

        use utils

        implicit none

        real :: A(20)

        A = createVector(20)
        print *, size(A,1)

    contains

    function createVector(n)

        real(rk), allocatable, dimension(:) :: createVector
        integer, intent(in) :: n

        allocate(createVector(n))

    end function createVector

    end program allocatable_function

# Example 39 - Allocatable components

    program allocatable_function

        use utils

        implicit none

        type particles_type
            real(rk), allocatable :: pos(:,:)
            real(rk), allocatable :: vel(:,:)
            real(rk), allocatable :: mass(:)
        end type particles_type

        type(particles_type) :: particles

        call initParticles(particles, 1000)

        print*, shape(particles % pos)
        print*, shape(particles % vel)
        print*, shape(particles % mass)

        call deallocateParticles(particles)

    contains

    subroutine initParticles(particles, n)

        type(particles_type), intent(inout) :: particles
        integer, intent(in) :: n

        allocate(particles % pos(3,n))
        allocate(particles % vel(3,n))
        allocate(particles % mass(n))

    end subroutine initParticles

    subroutine deallocateParticles(particles)

        type(particles_type), intent(inout) :: particles

        deallocate(particles % pos)
        deallocate(particles % vel)
        deallocate(particles % mass)

    end subroutine deallocateParticles

    end program allocatable_function

# Example 41 - C Interop

    program c_interop

            use iso_c_binding

            implicit none

            integer(c_int) :: a
            real(c_float) :: b
            real(c_double) :: c

            a = 42
            b = 42.0_c_float
            c = 84.0_c_double

            print *, a, b, c

    end program c_interop

# Example 42 - C Interop

myfunc.cpp

    #include <iostream>

    using namespace std;

    extern "C" void myfunc(int a, double b, double *c)
    {
    cout << "a = " << a << endl;
    cout << "b = " << b << endl;
    cout << "c = " << *c << endl; 
    }

ex42.f90

    program c_interop

        use iso_c_binding

        implicit none

        real(c_double) :: c

        interface
            subroutine myfunc(a, b, c) bind(C, name="myfunc")
            use iso_c_binding
            integer(c_int), value :: a
            real(c_double), value :: b
            real(c_double) :: c
            end subroutine myfunc
        end interface

        c = 42.0_c_double

        call myfunc(1, 2.0_c_double, c)

    end program c_interop

# Exeample 43 - Enviroment functions

    program ex43

        implicit none

        character(255) :: homedir
        character(255) :: argument
        integer :: argc

        call get_environment_variable('HOME', homedir)

        print*, trim(homedir)

        argc = command_argument_count()
        print*, argc

        call get_command_argument(0, argument)

        print*, trim(argument)

    end program ex43






