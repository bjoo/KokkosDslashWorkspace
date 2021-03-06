. /opt/intel/oneapi/setvars.sh
module load cmake-3.13.4

TOPDIR=`pwd`

BUILDDIR=${TOPDIR}/build
INSTALLDIR=${TOPDIR}/install
SRCDIR=${TOPDIR}/src

PK_CXX="icpx"
PK_CC="icx"
PK_OMP_ENABLE=""
PK_CXXFLAGS=" -g -O3 -std=c++17  -qnextgen  -fiopenmp -fopenmp-targets=spir64"
PK_CXXFLAGS_NVCC="${PK_CXXFLAGS}"
PK_CFLAGS="-g -O3 -std=gnu99  -qnextgen  -fiopenmp -fopenmp-targets=spir64"
PK_LDFLAGS="-qnextgen  -fiopenmp -fopenmp-targets=spir64"
MAKE="make -j 8"


