cmake_minimum_required(VERSION 3.0)

project(particles_oo)
enable_language(Fortran)

add_executable(particles_oo main.f90 particle_defs.f90 particle_utils.f90 particle_sys.f90
particle_sim.f90 vector_operations.f90)

#add_library(particle particle_defs.f90 particle_utils.f90
#particle_data.f90 particle_sim.f90 particle_state.f90 vector_operations.f90)
