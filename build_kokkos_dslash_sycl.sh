source ./env.sh

pushd ${BUILDDIR}

export PK_MODULE=kokkos_dslash

if [ -d ./build_${PK_MODULE}  ];
then
  rm -rf ./build_${PK_MODULE}
fi

mkdir  ./build_${PK_MODULE}
cd ./build_${PK_MODULE}


#export OMPI_CXX=$HOME/bin/nvcc_wrapper
CXX="${PK_CXX}" CC="${PK_CC}" CXXFLAGS="${PK_CXXFLAGS}" cmake \
	-DCMAKE_EXE_LINKER_FLAGS="${PK_LDFLAGS}" \
    -G"Eclipse CDT4 - Unix Makefiles" \
    -DCMAKE_ECLIPSE_MAKE_ARGUMENTS=-j8 \
    -DCMAKE_ECLIPSE_VERSION=4.5.0 \
    -DKOKKOS_ENABLE_OPENMP="OFF" \
    -DKOKKOS_ENABLE_SYCL="ON" \
    -DKOKKOS_ENABLE_DEPRECATED_CODE="OFF" \
    -DCMAKE_CXX_STANDARD="14" \
    -DQDPXX_DIR=${INSTALLDIR}/qdp++-scalar/share \
    -DMG_DEFAULT_LOGLEVEL=DEBUG \
    -DMG_USE_AVX512=OFF \
    -DMG_USE_AVX2=OFF \
    -DMG_FLAT_PARALLEL_DSLASH=ON \
    -DMG_KOKKOS_USE_MDRANGE=OFF \
    -DMG_USE_SYCL=ON \
    -DCMAKE_BUILD_TYPE=DEBUG \
    -DMG_USE_OLD_KOKKOS_LINK=ON \
     ${SRCDIR}/KokkosDslash

#${MAKE}
