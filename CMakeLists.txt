cmake_minimum_required(VERSION 2.8)

find_package(FLEX)

FLEX_TARGET(count count.l  ${CMAKE_CURRENT_BINARY_DIR}/count.c COMPILE_FLAGS "-F -8")

if (CMAKE_CXX_COMPILER_ID MATCHES ".*Clang.*" AND ${CMAKE_SYSTEM_NAME} MATCHES "Darwin")
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -stdlib=libstdc++")
endif()

add_executable( bench bench.c )
add_executable( pbench pbench.cxx )
add_executable( count ${FLEX_count_OUTPUTS} )
add_executable( gbench gbench.c )


add_custom_command(OUTPUT ${CMAKE_CURRENT_BINARY_DIR}/sample-input.txt
                   COMMAND ${CMAKE_CURRENT_SOURCE_DIR}/gendata.py > ${CMAKE_CURRENT_BINARY_DIR}/sample-input.txt
                   MAIN_DEPENDENCY ${CMAKE_CURRENT_SOURCE_DIR}/gendata.py
                   )

add_custom_target(sample-input ALL DEPENDS ${CMAKE_CURRENT_BINARY_DIR}/sample-input.txt)
