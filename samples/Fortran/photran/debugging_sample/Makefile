PROGRAM        = debugging_sample

PYTHON_MODULE  = $(PROGRAM)
PROGRAM_SUFFIX = exe

F2PY           = f2py.py
F95COMPILER    = gfortran
FFLAGS         = -g -fbounds-check -Wall
LDFLAGS        = 
LIBS           = 
F2PYBUILDDIR   = ./f2pytemp

all: $(PROGRAM)

debugging_sample.o: debugging_sample.f90 
	$(F95COMPILER) $(FFLAGS) -c debugging_sample.f90

debugging_sample: debugging_sample.o
	$(F95COMPILER) $(LDFLAGS) -o $@ debugging_sample.o $(LIBS)

MODULES_SOURCE = 
ALL_SOURCE = debugging_sample.f90

python-module: $(PROGRAM)
	$(F2PY) --build-dir $(F2PYBUILDDIR) -m $(PYTHON_MODULE) --compiler=mingw32 --fcompiler=g95 -c $(MODULES_SOURCE)

clean:
	rm -rf $(F2PYBUILDDIR)
	rm -f $(PROGRAM).$(PROGRAM_SUFFIX) *.o *.mod *.dll *.so *.stackdump *.pyc *.pyd *.exe

run:
	@./$(PROGRAM)
