PROGRAM        = exercise1_20

PYTHON_MODULE  = $(PROGRAM)
PROGRAM_SUFFIX = exe

F2PY           = f2py.py
F95COMPILER    = gfortran
FFLAGS         = -g -fbounds-check -Wall
LDFLAGS        = 
LIBS           = 
F2PYBUILDDIR   = ./f2pytemp

all: $(PROGRAM)

excercise1_20.o: excercise1_20.f90 
	$(F95COMPILER) $(FFLAGS) -c excercise1_20.f90

exercise1_20: excercise1_20.o
	$(F95COMPILER) $(LDFLAGS) -o $@ excercise1_20.o $(LIBS)

MODULES_SOURCE = 
ALL_SOURCE = excercise1_20.f90

python-module: $(PROGRAM)
	$(F2PY) --build-dir $(F2PYBUILDDIR) -m $(PYTHON_MODULE) --compiler=mingw32 --fcompiler=g95 -c $(MODULES_SOURCE)

clean:
	rm -rf $(F2PYBUILDDIR)
	rm -f $(PROGRAM).$(PROGRAM_SUFFIX) *.o *.mod *.dll *.so *.stackdump *.pyc *.pyd *.exe

run:
	@./$(PROGRAM)
