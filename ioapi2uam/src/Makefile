SHELL = /bin/sh

# FC = pgf90
# FFLAGS = -O2 -Mdalign -Mnoframe -byteswapio -Mlfs -Bstatic_pgi

FC = mpifort
FFLAGS  = -g -O3

PROGRAM = ../ioapi2uam.exe

NETCDF  = ../../lib/netcdf
IOAPI   = ../../lib/ioapi

LIBS    = -L$(IOAPI)/Linux4_aarch64 -lioapi -lgomp \
          -L$(NETCDF)/lib -lnetcdff -lnetcdf -lm -liomp5 -lpthread

INCLUDE = -I$(IOAPI)/ioapi/fixed_src \
          -I$(NETCDF)/include

RAW = ioapi2uam.o

.f.o:
	$(FC) $(FFLAGS) $(INCLUDE) -c -o $@ $<

.F.o:
	$(FC) $(FFLAGS) $(INCLUDE) -c -o $@ $<

$(PROGRAM):     $(RAW)
	$(FC) $(FFLAGS) $(INCLUDE) -o $(@) $(RAW) $(LIBS)

clean:
	rm -f *.o *.mod
cleanall:
	rm -f $(PROGRAM) *.o *.mod *.core
