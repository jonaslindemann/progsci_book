PROGRAM        = exercise1_22

PYTHON_MODULE  = $(PROGRAM)
PROGRAM_SUFFIX = exe

F2PY           = f2py.py
F95COMPILER    = gfortran
FFLAGS         = -g -fbounds-check -Wall
LDFLAGS        = 
LIBS           = 
F2PYBUILDDIR   = ./f2pytemp

all: $(PROGRAM)

conversions.o: conversions.f90 
	$(F95COMPILER) $(FFLAGS) -c conversions.f90
exercise1_22.o: exercise1_22.f90 conversions.o
	$(F95COMPILER) $(FFLAGS) -c exercise1_22.f90

exercise1_22: conversions.o exercise1_22.o
	$(F95COMPILER) $(LDFLAGS) -o $@ conversions.o exercise1_22.o $(LIBS)

MODULES_SOURCE = conversions.f90
ALL_SOURCE = conversions.f90 exercise1_22.f90

python-module: $(PROGRAM)
	$(F2PY) --build-dir $(F2PYBUILDDIR) -m $(PYTHON_MODULE) --compiler=mingw32 --fcompiler=g95 -c $(MODULES_SOURCE)

clean:
	rm -rf $(F2PYBUILDDIR)
	rm -f $(PROGRAM).$(PROGRAM_SUFFIX) *.o *.mod *.dll *.so *.stackdump *.pyc *.pyd *.exe

run:
	@./$(PROGRAM)
