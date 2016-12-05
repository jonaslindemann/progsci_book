project(sciprog)
cmake_minimum_required(VERSION 2.8)
enable_language(Fortran)

subdirs(unformatted_io error_handling array_features oo_programming
    allocatable_dummy allocatable_function dynamic_fcodes pointers overloading
    case formatting modules namelist_io operator_overloading optional_arguments
    private_entities procedures_as_arguments strings submodules
    subroutines sample1 sample2 zero_size logic functions f2py)
