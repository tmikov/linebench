cmake_minimum_required(VERSION 2.8)

find_package(FLEX)

FLEX_TARGET(count count.l  ${CMAKE_CURRENT_BINARY_DIR}/count.c COMPILE_FLAGS -F)

add_executable( bench bench.c )
add_executable( pbench pbench.cxx )
add_executable( count ${FLEX_count_OUTPUTS} )
