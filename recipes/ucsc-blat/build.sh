#!/bin/bash
export USE_HIC=0
mkdir -p "${PREFIX}/bin"
export MACHTYPE=x86_64
export BINDIR=`pwd`/bin
export INCLUDE_PATH="${PREFIX}/include"
export LD_LIBRARY_PATH="${PREFIX}/lib"
export LDFLAGS="-L${PREFIX}/lib"
export CFLAGS="-I${PREFIX}/include ${LDFLAGS}"
export CXXFLAGS="-I${PREFIX}/include ${LDFLAGS}"
export L="${LDFLAGS}"
mkdir -p ${BINDIR}
cd ${SRC_DIR}/kent/src/lib && make CC=${CC} CXX=${CXX} CFLAGS="${CFLAGS}" CXXFLAGS="${CXXFLAGS}"
cd ${SRC_DIR}/kent/src/htslib && make CC=${CC} CXX=${CXX} CFLAGS="${CFLAGS}" CXXFLAGS="${CXXFLAGS}"
cd ${SRC_DIR}/kent/src/jkOwnLib && make CC=${CC} CXX=${CXX} CFLAGS="${CFLAGS}" CXXFLAGS="${CXXFLAGS}"
cd ${SRC_DIR}/kent/src/blat && make CC=${CC} CXX=${CXX} CFLAGS="${CFLAGS}" CXXFLAGS="${CXXFLAGS}"
cp ${SRC_DIR}/bin/blat "${PREFIX}/bin"
chmod +rx "${PREFIX}/bin/blat"
