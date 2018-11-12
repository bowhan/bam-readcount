cmake_minimum_required(VERSION 2.8)

project(bam-readcount)

set(SOURCES bamreadcount.cpp)

set(EXECUTABLE_NAME bam-readcount)
#xadd_executable(${EXECUTABLE_NAME} ${SOURCES})

add_executable(${EXECUTABLE_NAME} ${SOURCES})

target_include_directories(${EXECUTABLE_NAME}
        PUBLIC
        $<BUILD_INTERFACE:${BAMRC_LIBDIR}>
        $<INSTALL_INTERFACE:include>
        )
target_link_libraries(${EXECUTABLE_NAME}
        PUBLIC
        bamrc)
set_target_properties(${EXECUTABLE_NAME}
        PROPERTIES
        PACKAGE_OUTPUT_NAME ${EXECUTABLE_NAME}${EXE_VERSION_SUFFIX}
        )

install(TARGETS ${EXECUTABLE_NAME}
        RUNTIME DESTINATION bin)
