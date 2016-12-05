PROGRAM        = exercise1_19

PYTHON_MODULE  = $(PROGRAM)
PROGRAM_SUFFIX = exe

F2PY           = f2py.py
F95COMPILER    = gfortran
FFLAGS         = -g -fbounds-check -Wall
LDFLAGS        = 
LIBS           = 
F2PYBUILDDIR   = ./f2pytemp

all: $(PROGRAM)

exercise1_19.o: exercise1_19.f90 
	$(F95COMPILER) $(FFLAGS) -c exercise1_19.f90

exercise1_19: exercise1_19.o
	$(F95COMPILER) $(LDFLAGS) -o $@ exercise1_19.o $(LIBS)

MODULES_SOURCE = 
ALL_SOURCE = exercise1_19.f90

python-module: $(PROGRAM)
	$(F2PY) --build-dir $(F2PYBUILDDIR) -m $(PYTHON_MODULE) --compiler=mingw32 --fcompiler=g95 -c $(MODULES_SOURCE)

clean:
	rm -rf $(F2PYBUILDDIR)
	rm -f $(PROGRAM).$(PROGRAM_SUFFIX) *.o *.mod *.dll *.so *.stackdump *.pyc *.pyd *.exe

run:
	@./$(PROGRAM)
