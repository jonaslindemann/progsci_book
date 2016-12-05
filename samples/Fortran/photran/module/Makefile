PROGRAM        = module

PYTHON_MODULE  = $(PROGRAM)
PROGRAM_SUFFIX = exe

F2PY           = f2py.py
F95COMPILER    = gfortran
FFLAGS         = -g -fbounds-check -Wall
LDFLAGS        = 
LIBS           = 
F2PYBUILDDIR   = ./f2pytemp

all: $(PROGRAM)

frame.o: frame.f90 
	$(F95COMPILER) $(FFLAGS) -c frame.f90
main.o: main.f90 truss.o
	$(F95COMPILER) $(FFLAGS) -c main.f90
truss.o: truss.f90 
	$(F95COMPILER) $(FFLAGS) -c truss.f90

module: frame.o main.o truss.o
	$(F95COMPILER) $(LDFLAGS) -o $@ frame.o main.o truss.o $(LIBS)

MODULES_SOURCE = frame.f90 main.f90 truss.f90
ALL_SOURCE = frame.f90 main.f90 truss.f90

python-module: $(PROGRAM)
	$(F2PY) --build-dir $(F2PYBUILDDIR) -m $(PYTHON_MODULE) --compiler=mingw32 --fcompiler=g95 -c $(MODULES_SOURCE)

clean:
	rm -rf $(F2PYBUILDDIR)
	rm -f $(PROGRAM).$(PROGRAM_SUFFIX) *.o *.mod *.dll *.so *.stackdump *.pyc *.pyd *.exe

run:
	@./$(PROGRAM)
