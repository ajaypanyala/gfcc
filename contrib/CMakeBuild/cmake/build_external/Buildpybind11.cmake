bundle_cmake_args(PYBIND11_PYTHON PYTHON_INCLUDE_DIRS PYTHON_LIBRARIES)
ExternalProject_Add(pybind11_External
    GIT_REPOSITORY https://github.com/pybind/pybind11
    GIT_TAG 8edc147d67ca85a93ed1f53628004528dc36a04d
    CMAKE_ARGS ${DEPENDENCY_CMAKE_OPTIONS}
               ${PYBIND11_PYTHON}
               -DPYBIND11_TEST=FALSE
    INSTALL_COMMAND ${CMAKE_MAKE_PROGRAM} install DESTDIR=${STAGE_DIR}
)

