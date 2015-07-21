package: geant4
version: v4.10.01.p02
source: http://github.com/alisw/geant4
requires:
  - clhep
tag: v4.10.01.p02
---
#!/bin/sh

cmake $SOURCEDIR \
  -DCMAKE_CXX_COMPILER="c++" \
  -DCMAKE_CXX_FLAGS="-fPIC" \
  -DCMAKE_INSTALL_PREFIX:PATH="$INSTALLROOT" \
  -DCMAKE_INSTALL_LIBDIR="lib" \
  -DCMAKE_BUILD_TYPE=Release \
  -DGEANT4_BUILD_TLS_MODEL:STRING="global-dynamic" \
  -DGEANT4_ENABLE_TESTING=OFF \
  -DBUILD_SHARED_LIBS=ON \
  -DGEANT4_INSTALL_EXAMPLES=OFF \
  -DGEANT4_USE_SYSTEM_CLHEP=ON \
  -DCLHEP_ROOT_DIR:PATH="$CLHEP_ROOT" \
  -DGEANT4_BUILD_MULTITHREADED=ON \
  -DCMAKE_STATIC_LIBRARY_CXX_FLAGS="-fPIC" \
  -DCMAKE_STATIC_LIBRARY_C_FLAGS="-fPIC"

make ${JOBS+-j $JOBS}
make install
