find_package(ZLIB REQUIRED)

ExternalProject_Add(htslib
        PREFIX ${CMAKE_BINARY_DIR}/htslib
        URL ${CMAKE_SOURCE_DIR}/vendor/htslib-1.9.tar.bz2
        BUILD_IN_SOURCE ON
        CONFIGURE_COMMAND autoheader && autoconf && ./configure
        BUILD_COMMAND make
        INSTALL_COMMAND make install prefix=${CMAKE_INSTALL_PREFIX}
        )

if (APPLE)
    set(htslib_LIBRARIES ${CMAKE_INSTALL_PREFIX}/lib/libhts.dylib)
    set(htslib_STATIC_LIBRARIES ${CMAKE_INSTALL_PREFIX}/lib/libhts.dylib)
else ()
    set(htslib_LIBRARIES ${CMAKE_INSTALL_PREFIX}/lib/libhts.so)
    set(htslib_STATIC_LIBRARIES ${CMAKE_INSTALL_PREFIX}/lib/libhts.a)
endif ()

set(htslib_INCLUDE_DIR ${CMAKE_INSTALL_PREFIX}/include)