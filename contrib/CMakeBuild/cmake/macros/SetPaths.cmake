#
# I got tired of scrolling through all of these definitions and factored them
# out.  Note the use of macro (versuses function, which in turn does not create
# a new scope)
#

macro(set_paths)
    #The directory containing the macros directory
    get_filename_component(NWXBASE_CMAKE ${NWXBASE_MACROS} DIRECTORY)

    #The root of the CMakeBuild install
    get_filename_component(NWXBASE_ROOT ${NWXBASE_CMAKE} DIRECTORY)

    #The location of our find scripts
    set(NWXBASE_FIND_SCRIPTS ${NWXBASE_CMAKE}/find_external)

    #The location of our build scripts
    set(NWXBASE_BUILD_SCRIPTS ${NWXBASE_CMAKE}/build_external)

    #Effective root of the file system during the build
    set(STAGE_DIR ${CMAKE_BINARY_DIR}/stage)

    #During the build, path where we install things
    set(STAGE_INSTALL_DIR ${STAGE_DIR}${CMAKE_INSTALL_PREFIX})

    #Where we install the tests (different to avoid installing them)
    set(TEST_STAGE_DIR ${CMAKE_BINARY_DIR}/test_stage)

    #Where we install the methods
    set(METHODS_STAGE_DIR ${CMAKE_BINARY_DIR}/methods_stage)

    #Source and include our macros
    list(APPEND CMAKE_MODULE_PATH ${NWXBASE_MACROS} ${NWXBASE_FIND_SCRIPTS}
                ${NWXBASE_BUILD_SCRIPTS})

    #Prepend our stage install dir so staged dependencies and their CMake
    #files can be found (and are preferred)
    set(CMAKE_PREFIX_PATH "${STAGE_INSTALL_DIR}" "${CMAKE_PREFIX_PATH}")
    set(CMAKE_MODULE_PATH "${STAGE_INSTALL_DIR}" "${CMAKE_MODULE_PATH}")
endmacro()
