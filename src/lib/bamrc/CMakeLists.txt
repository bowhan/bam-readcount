cmake_minimum_required(VERSION 2.8)

project(bamrc)

set(HEADERS
        ReadWarnings.hpp
        BasicStat.hpp
        auxfields.hpp
        IndelQueueEntry.hpp
        IndelQueue.hpp
        )

set(SOURCES
        BasicStat.cpp
        IndelQueueEntry.cpp
        IndelQueue.cpp
        )

add_library(bamrc SHARED ${HEADERS} ${SOURCES})

add_dependencies(bamrc htslib)

set_target_properties(bamrc
        PROPERTIES
        PUBLIC_HEADER ${HEADERS}
        )

target_include_directories(bamrc
        PUBLIC
        ${Boost_INCLUDE_DIRS}
        ${htslib_INCLUDE_DIR}
        )

target_link_libraries(bamrc
        ${Boost_LIBRARIES}
        ${htslib_LIBRARIES}
        )

install(TARGETS bamrc
        LIBRARY DESTINATION lib
        PUBLIC_HEADER DESTINATION include/bamrc
        )