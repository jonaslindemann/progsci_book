# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.5

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /home/bmjl/cmake/bin/cmake

# The command to remove a file.
RM = /home/bmjl/cmake/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/bmjl/Development/progsci_book/exercises/mandelbrot_template

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/bmjl/Development/progsci_book/exercises/mandelbrot_template/build

# Include any dependencies generated for this target.
include CMakeFiles/mandelutils.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/mandelutils.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/mandelutils.dir/flags.make

CMakeFiles/mandelutils.dir/types.f90.o: CMakeFiles/mandelutils.dir/flags.make
CMakeFiles/mandelutils.dir/types.f90.o: ../types.f90
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/bmjl/Development/progsci_book/exercises/mandelbrot_template/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building Fortran object CMakeFiles/mandelutils.dir/types.f90.o"
	/sw/easybuild/software/Core/GCCcore/6.2.0/bin/gfortran  $(Fortran_DEFINES) $(Fortran_INCLUDES) $(Fortran_FLAGS) -c /home/bmjl/Development/progsci_book/exercises/mandelbrot_template/types.f90 -o CMakeFiles/mandelutils.dir/types.f90.o

CMakeFiles/mandelutils.dir/types.f90.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing Fortran source to CMakeFiles/mandelutils.dir/types.f90.i"
	/sw/easybuild/software/Core/GCCcore/6.2.0/bin/gfortran  $(Fortran_DEFINES) $(Fortran_INCLUDES) $(Fortran_FLAGS) -E /home/bmjl/Development/progsci_book/exercises/mandelbrot_template/types.f90 > CMakeFiles/mandelutils.dir/types.f90.i

CMakeFiles/mandelutils.dir/types.f90.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling Fortran source to assembly CMakeFiles/mandelutils.dir/types.f90.s"
	/sw/easybuild/software/Core/GCCcore/6.2.0/bin/gfortran  $(Fortran_DEFINES) $(Fortran_INCLUDES) $(Fortran_FLAGS) -S /home/bmjl/Development/progsci_book/exercises/mandelbrot_template/types.f90 -o CMakeFiles/mandelutils.dir/types.f90.s

CMakeFiles/mandelutils.dir/types.f90.o.requires:

.PHONY : CMakeFiles/mandelutils.dir/types.f90.o.requires

CMakeFiles/mandelutils.dir/types.f90.o.provides: CMakeFiles/mandelutils.dir/types.f90.o.requires
	$(MAKE) -f CMakeFiles/mandelutils.dir/build.make CMakeFiles/mandelutils.dir/types.f90.o.provides.build
.PHONY : CMakeFiles/mandelutils.dir/types.f90.o.provides

CMakeFiles/mandelutils.dir/types.f90.o.provides.build: CMakeFiles/mandelutils.dir/types.f90.o


CMakeFiles/mandelutils.dir/constants.f90.o: CMakeFiles/mandelutils.dir/flags.make
CMakeFiles/mandelutils.dir/constants.f90.o: ../constants.f90
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/bmjl/Development/progsci_book/exercises/mandelbrot_template/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building Fortran object CMakeFiles/mandelutils.dir/constants.f90.o"
	/sw/easybuild/software/Core/GCCcore/6.2.0/bin/gfortran  $(Fortran_DEFINES) $(Fortran_INCLUDES) $(Fortran_FLAGS) -c /home/bmjl/Development/progsci_book/exercises/mandelbrot_template/constants.f90 -o CMakeFiles/mandelutils.dir/constants.f90.o

CMakeFiles/mandelutils.dir/constants.f90.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing Fortran source to CMakeFiles/mandelutils.dir/constants.f90.i"
	/sw/easybuild/software/Core/GCCcore/6.2.0/bin/gfortran  $(Fortran_DEFINES) $(Fortran_INCLUDES) $(Fortran_FLAGS) -E /home/bmjl/Development/progsci_book/exercises/mandelbrot_template/constants.f90 > CMakeFiles/mandelutils.dir/constants.f90.i

CMakeFiles/mandelutils.dir/constants.f90.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling Fortran source to assembly CMakeFiles/mandelutils.dir/constants.f90.s"
	/sw/easybuild/software/Core/GCCcore/6.2.0/bin/gfortran  $(Fortran_DEFINES) $(Fortran_INCLUDES) $(Fortran_FLAGS) -S /home/bmjl/Development/progsci_book/exercises/mandelbrot_template/constants.f90 -o CMakeFiles/mandelutils.dir/constants.f90.s

CMakeFiles/mandelutils.dir/constants.f90.o.requires:

.PHONY : CMakeFiles/mandelutils.dir/constants.f90.o.requires

CMakeFiles/mandelutils.dir/constants.f90.o.provides: CMakeFiles/mandelutils.dir/constants.f90.o.requires
	$(MAKE) -f CMakeFiles/mandelutils.dir/build.make CMakeFiles/mandelutils.dir/constants.f90.o.provides.build
.PHONY : CMakeFiles/mandelutils.dir/constants.f90.o.provides

CMakeFiles/mandelutils.dir/constants.f90.o.provides.build: CMakeFiles/mandelutils.dir/constants.f90.o


CMakeFiles/mandelutils.dir/utils.f90.o: CMakeFiles/mandelutils.dir/flags.make
CMakeFiles/mandelutils.dir/utils.f90.o: ../utils.f90
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/bmjl/Development/progsci_book/exercises/mandelbrot_template/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building Fortran object CMakeFiles/mandelutils.dir/utils.f90.o"
	/sw/easybuild/software/Core/GCCcore/6.2.0/bin/gfortran  $(Fortran_DEFINES) $(Fortran_INCLUDES) $(Fortran_FLAGS) -c /home/bmjl/Development/progsci_book/exercises/mandelbrot_template/utils.f90 -o CMakeFiles/mandelutils.dir/utils.f90.o

CMakeFiles/mandelutils.dir/utils.f90.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing Fortran source to CMakeFiles/mandelutils.dir/utils.f90.i"
	/sw/easybuild/software/Core/GCCcore/6.2.0/bin/gfortran  $(Fortran_DEFINES) $(Fortran_INCLUDES) $(Fortran_FLAGS) -E /home/bmjl/Development/progsci_book/exercises/mandelbrot_template/utils.f90 > CMakeFiles/mandelutils.dir/utils.f90.i

CMakeFiles/mandelutils.dir/utils.f90.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling Fortran source to assembly CMakeFiles/mandelutils.dir/utils.f90.s"
	/sw/easybuild/software/Core/GCCcore/6.2.0/bin/gfortran  $(Fortran_DEFINES) $(Fortran_INCLUDES) $(Fortran_FLAGS) -S /home/bmjl/Development/progsci_book/exercises/mandelbrot_template/utils.f90 -o CMakeFiles/mandelutils.dir/utils.f90.s

CMakeFiles/mandelutils.dir/utils.f90.o.requires:

.PHONY : CMakeFiles/mandelutils.dir/utils.f90.o.requires

CMakeFiles/mandelutils.dir/utils.f90.o.provides: CMakeFiles/mandelutils.dir/utils.f90.o.requires
	$(MAKE) -f CMakeFiles/mandelutils.dir/build.make CMakeFiles/mandelutils.dir/utils.f90.o.provides.build
.PHONY : CMakeFiles/mandelutils.dir/utils.f90.o.provides

CMakeFiles/mandelutils.dir/utils.f90.o.provides.build: CMakeFiles/mandelutils.dir/utils.f90.o


CMakeFiles/mandelutils.dir/mesh.f90.o: CMakeFiles/mandelutils.dir/flags.make
CMakeFiles/mandelutils.dir/mesh.f90.o: ../mesh.f90
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/bmjl/Development/progsci_book/exercises/mandelbrot_template/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building Fortran object CMakeFiles/mandelutils.dir/mesh.f90.o"
	/sw/easybuild/software/Core/GCCcore/6.2.0/bin/gfortran  $(Fortran_DEFINES) $(Fortran_INCLUDES) $(Fortran_FLAGS) -c /home/bmjl/Development/progsci_book/exercises/mandelbrot_template/mesh.f90 -o CMakeFiles/mandelutils.dir/mesh.f90.o

CMakeFiles/mandelutils.dir/mesh.f90.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing Fortran source to CMakeFiles/mandelutils.dir/mesh.f90.i"
	/sw/easybuild/software/Core/GCCcore/6.2.0/bin/gfortran  $(Fortran_DEFINES) $(Fortran_INCLUDES) $(Fortran_FLAGS) -E /home/bmjl/Development/progsci_book/exercises/mandelbrot_template/mesh.f90 > CMakeFiles/mandelutils.dir/mesh.f90.i

CMakeFiles/mandelutils.dir/mesh.f90.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling Fortran source to assembly CMakeFiles/mandelutils.dir/mesh.f90.s"
	/sw/easybuild/software/Core/GCCcore/6.2.0/bin/gfortran  $(Fortran_DEFINES) $(Fortran_INCLUDES) $(Fortran_FLAGS) -S /home/bmjl/Development/progsci_book/exercises/mandelbrot_template/mesh.f90 -o CMakeFiles/mandelutils.dir/mesh.f90.s

CMakeFiles/mandelutils.dir/mesh.f90.o.requires:

.PHONY : CMakeFiles/mandelutils.dir/mesh.f90.o.requires

CMakeFiles/mandelutils.dir/mesh.f90.o.provides: CMakeFiles/mandelutils.dir/mesh.f90.o.requires
	$(MAKE) -f CMakeFiles/mandelutils.dir/build.make CMakeFiles/mandelutils.dir/mesh.f90.o.provides.build
.PHONY : CMakeFiles/mandelutils.dir/mesh.f90.o.provides

CMakeFiles/mandelutils.dir/mesh.f90.o.provides.build: CMakeFiles/mandelutils.dir/mesh.f90.o


# Object files for target mandelutils
mandelutils_OBJECTS = \
"CMakeFiles/mandelutils.dir/types.f90.o" \
"CMakeFiles/mandelutils.dir/constants.f90.o" \
"CMakeFiles/mandelutils.dir/utils.f90.o" \
"CMakeFiles/mandelutils.dir/mesh.f90.o"

# External object files for target mandelutils
mandelutils_EXTERNAL_OBJECTS =

libmandelutils.a: CMakeFiles/mandelutils.dir/types.f90.o
libmandelutils.a: CMakeFiles/mandelutils.dir/constants.f90.o
libmandelutils.a: CMakeFiles/mandelutils.dir/utils.f90.o
libmandelutils.a: CMakeFiles/mandelutils.dir/mesh.f90.o
libmandelutils.a: CMakeFiles/mandelutils.dir/build.make
libmandelutils.a: CMakeFiles/mandelutils.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/bmjl/Development/progsci_book/exercises/mandelbrot_template/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Linking Fortran static library libmandelutils.a"
	$(CMAKE_COMMAND) -P CMakeFiles/mandelutils.dir/cmake_clean_target.cmake
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/mandelutils.dir/link.txt --verbose=$(VERBOSE)
	f2py -m mandelmod -c /home/bmjl/Development/progsci_book/exercises/mandelbrot_template/mandelmod.f90 -lmandelutils -L/home/bmjl/Development/progsci_book/exercises/mandelbrot_template/build

# Rule to build all files generated by this target.
CMakeFiles/mandelutils.dir/build: libmandelutils.a

.PHONY : CMakeFiles/mandelutils.dir/build

CMakeFiles/mandelutils.dir/requires: CMakeFiles/mandelutils.dir/types.f90.o.requires
CMakeFiles/mandelutils.dir/requires: CMakeFiles/mandelutils.dir/constants.f90.o.requires
CMakeFiles/mandelutils.dir/requires: CMakeFiles/mandelutils.dir/utils.f90.o.requires
CMakeFiles/mandelutils.dir/requires: CMakeFiles/mandelutils.dir/mesh.f90.o.requires

.PHONY : CMakeFiles/mandelutils.dir/requires

CMakeFiles/mandelutils.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/mandelutils.dir/cmake_clean.cmake
.PHONY : CMakeFiles/mandelutils.dir/clean

CMakeFiles/mandelutils.dir/depend:
	cd /home/bmjl/Development/progsci_book/exercises/mandelbrot_template/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/bmjl/Development/progsci_book/exercises/mandelbrot_template /home/bmjl/Development/progsci_book/exercises/mandelbrot_template /home/bmjl/Development/progsci_book/exercises/mandelbrot_template/build /home/bmjl/Development/progsci_book/exercises/mandelbrot_template/build /home/bmjl/Development/progsci_book/exercises/mandelbrot_template/build/CMakeFiles/mandelutils.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/mandelutils.dir/depend

