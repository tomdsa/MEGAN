SHELL = /bin/sh

# FC= pgf90
# FFLAGS= -O -Mvect=sse -Mextend -Msecond_underscore -Mlfs -Bstatic_pgi

FC      = mpifort
FFLAGS  = -g -O3

PROGRAM = ../daymet.exe

NETCDF  = ../../lib/netcdf
IOAPI   = ../../lib/ioapi

LIBS    = -L$(IOAPI)/Linux4_aarch64 -lioapi -lgomp \
          -L$(NETCDF)/lib -lnetcdff -lnetcdf -lm -liomp5 -lpthread \
	  -L/home/tools/hdf5-1.10.1/lib -lhdf5_hl -lhdf5 -lz
INCLUDE = -I$(IOAPI)/ioapi/fixed_src \
          -I$(NETCDF)/include \
          -I$(CURDIR)/INCLUDE

OBJS = \
     checkmem.o \
     daymet.o

MODULES= *mod.f

#-----------------------------------------------------------------------
# line to allow file.mod files to be recognised by GNU make
%.o : %.mod
#-----------------------------------------------------------------------

.SUFFIXES : .f .f .o

.f.o:
	$(FC) -c $(FFLAGS) $(INCLUDE) $<
.F.o:
	$(FC) -c $(FFLAGS) $(INCLUDE) $<

#-----------------------------------------------------------------------

$(PROGRAM):	$(OBJS)
	$(FC) $(FFLAGS) $(INCLUDE) -o $(@) $(OBJS) $(LIBS)

clean:
	rm -f *.o *.mod
cleanall:
	rm -f $(PROGRAM) *.o *.mod *.core
