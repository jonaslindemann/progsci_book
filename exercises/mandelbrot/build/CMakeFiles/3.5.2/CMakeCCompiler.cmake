set(CMAKE_C_COMPILER "/bin/cc")
set(CMAKE_C_COMPILER_ARG1 "")
set(CMAKE_C_COMPILER_ID "GNU")
set(CMAKE_C_COMPILER_VERSION "4.8.5")
set(CMAKE_C_COMPILER_WRAPPER "")
set(CMAKE_C_STANDARD_COMPUTED_DEFAULT "90")
set(CMAKE_C_COMPILE_FEATURES "c_function_prototypes;c_restrict;c_variadic_macros;c_static_assert")
set(CMAKE_C90_COMPILE_FEATURES "c_function_prototypes")
set(CMAKE_C99_COMPILE_FEATURES "c_restrict;c_variadic_macros")
set(CMAKE_C11_COMPILE_FEATURES "c_static_assert")

set(CMAKE_C_PLATFORM_ID "Linux")
set(CMAKE_C_SIMULATE_ID "")
set(CMAKE_C_SIMULATE_VERSION "")

set(CMAKE_AR "/bin/ar")
set(CMAKE_RANLIB "/bin/ranlib")
set(CMAKE_LINKER "/bin/ld")
set(CMAKE_COMPILER_IS_GNUCC 1)
set(CMAKE_C_COMPILER_LOADED 1)
set(CMAKE_C_COMPILER_WORKS TRUE)
set(CMAKE_C_ABI_COMPILED TRUE)
set(CMAKE_COMPILER_IS_MINGW )
set(CMAKE_COMPILER_IS_CYGWIN )
if(CMAKE_COMPILER_IS_CYGWIN)
  set(CYGWIN 1)
  set(UNIX 1)
endif()

set(CMAKE_C_COMPILER_ENV_VAR "CC")

if(CMAKE_COMPILER_IS_MINGW)
  set(MINGW 1)
endif()
set(CMAKE_C_COMPILER_ID_RUN 1)
set(CMAKE_C_SOURCE_FILE_EXTENSIONS c;m)
set(CMAKE_C_IGNORE_EXTENSIONS h;H;o;O;obj;OBJ;def;DEF;rc;RC)
set(CMAKE_C_LINKER_PREFERENCE 10)

# Save compiler ABI information.
set(CMAKE_C_SIZEOF_DATA_PTR "8")
set(CMAKE_C_COMPILER_ABI "ELF")
set(CMAKE_C_LIBRARY_ARCHITECTURE "")

if(CMAKE_C_SIZEOF_DATA_PTR)
  set(CMAKE_SIZEOF_VOID_P "${CMAKE_C_SIZEOF_DATA_PTR}")
endif()

if(CMAKE_C_COMPILER_ABI)
  set(CMAKE_INTERNAL_PLATFORM_ABI "${CMAKE_C_COMPILER_ABI}")
endif()

if(CMAKE_C_LIBRARY_ARCHITECTURE)
  set(CMAKE_LIBRARY_ARCHITECTURE "")
endif()

set(CMAKE_C_CL_SHOWINCLUDES_PREFIX "")
if(CMAKE_C_CL_SHOWINCLUDES_PREFIX)
  set(CMAKE_CL_SHOWINCLUDES_PREFIX "${CMAKE_C_CL_SHOWINCLUDES_PREFIX}")
endif()




set(CMAKE_C_IMPLICIT_LINK_LIBRARIES "c")
set(CMAKE_C_IMPLICIT_LINK_DIRECTORIES "/sw/easybuild/software/MPI/GCC/6.2.0-2.27/OpenMPI/2.0.1/libffi/3.2.1/lib64;/sw/easybuild/software/Core/GCCcore/6.2.0/lib64;/usr/lib/gcc/x86_64-redhat-linux/4.8.5;/usr/lib64;/lib64;/sw/easybuild/software/MPI/GCC/6.2.0-2.27/OpenMPI/2.0.1/Python/3.5.2/lib;/sw/easybuild/software/MPI/GCC/6.2.0-2.27/OpenMPI/2.0.1/libffi/3.2.1/lib;/sw/easybuild/software/MPI/GCC/6.2.0-2.27/OpenMPI/2.0.1/XZ/5.2.2/lib;/sw/easybuild/software/MPI/GCC/6.2.0-2.27/OpenMPI/2.0.1/GMP/6.1.1/lib;/sw/easybuild/software/MPI/GCC/6.2.0-2.27/OpenMPI/2.0.1/Tk/8.6.5/lib;/sw/easybuild/software/MPI/GCC/6.2.0-2.27/OpenMPI/2.0.1/SQLite/3.13.0/lib;/sw/easybuild/software/MPI/GCC/6.2.0-2.27/OpenMPI/2.0.1/Tcl/8.6.5/lib;/sw/easybuild/software/Compiler/GCCcore/6.2.0/libreadline/6.3/lib;/sw/easybuild/software/Compiler/GCCcore/6.2.0/ncurses/6.0/lib;/sw/easybuild/software/Compiler/GCCcore/6.2.0/zlib/1.2.8/lib;/sw/easybuild/software/MPI/GCC/6.2.0-2.27/OpenMPI/2.0.1/bzip2/1.0.6/lib;/sw/easybuild/software/MPI/GCC/6.2.0-2.27/OpenMPI/2.0.1/ScaLAPACK/2.0.2-OpenBLAS-0.2.19-LAPACK-3.6.1/lib;/sw/easybuild/software/MPI/GCC/6.2.0-2.27/OpenMPI/2.0.1/FFTW/3.3.5/lib;/sw/easybuild/software/MPI/GCC/6.2.0-2.27/OpenMPI/2.0.1/OpenBLAS/0.2.19-LAPACK-3.6.1/lib;/sw/easybuild/software/Compiler/GCC/6.2.0-2.27/OpenMPI/2.0.1/lib;/sw/easybuild/software/Compiler/GCC/6.2.0-2.27/hwloc/1.11.4/lib;/sw/easybuild/software/Compiler/GCC/6.2.0-2.27/numactl/2.0.11/lib;/sw/easybuild/software/Compiler/GCCcore/6.2.0/binutils/2.27/lib;/sw/easybuild/software/Core/GCCcore/6.2.0/lib;/usr/lib")
set(CMAKE_C_IMPLICIT_LINK_FRAMEWORK_DIRECTORIES "")
