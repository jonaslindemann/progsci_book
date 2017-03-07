project(mandelbrot)
cmake_minimum_required(VERSION 3.0)
enable_language(Fortran)

add_executable(mandelbrot mandelbrot.f90 types.f90 constants.f90 utils.f90 mesh.f90)


add_library(mandelutils STATIC types.f90 constants.f90 utils.f90 mesh.f90)

set_property(TARGET mandelutils PROPERTY POSITION_INDEPENDENT_CODE ON)

add_custom_command(TARGET mandelutils POST_BUILD
    COMMAND f2py -m mandelmod -c ${PROJECT_SOURCE_DIR}/mandelmod.f90 -lmandelutils -L${CMAKE_BINARY_DIR}
)


