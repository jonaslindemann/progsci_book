project(mandelbrot)
cmake_minimum_required(VERSION 3.0)
enable_language(Fortran)

# ---- Working standalone application

add_executable(mandelbrot mandelbrot.f90 types.f90 constants.f90 utils.f90 mesh.f90)

# ---- Library to link with f2py code

add_library(mandelutils STATIC types.f90 constants.f90 utils.f90 mesh.f90)

# ---- Make sure library is built with position independent code, so it
# ---- can be linked with a shared object.

set_property(TARGET mandelutils PROPERTY POSITION_INDEPENDENT_CODE ON)

# ---- Uncomment the following code when you have written your wrapper

add_custom_command(TARGET mandelutils POST_BUILD
    COMMAND f2py -m mandelmod -c ${PROJECT_SOURCE_DIR}/mandelmod.f90 -lmandelutils -L${CMAKE_BINARY_DIR}
)


