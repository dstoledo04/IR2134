# generated from ament/cmake/core/templates/nameConfig.cmake.in

# prevent multiple inclusion
if(_kioto_CONFIG_INCLUDED)
  # ensure to keep the found flag the same
  if(NOT DEFINED kioto_FOUND)
    # explicitly set it to FALSE, otherwise CMake will set it to TRUE
    set(kioto_FOUND FALSE)
  elseif(NOT kioto_FOUND)
    # use separate condition to avoid uninitialized variable warning
    set(kioto_FOUND FALSE)
  endif()
  return()
endif()
set(_kioto_CONFIG_INCLUDED TRUE)

# output package information
if(NOT kioto_FIND_QUIETLY)
  message(STATUS "Found kioto: 0.0.0 (${kioto_DIR})")
endif()

# warn when using a deprecated package
if(NOT "" STREQUAL "")
  set(_msg "Package 'kioto' is deprecated")
  # append custom deprecation text if available
  if(NOT "" STREQUAL "TRUE")
    set(_msg "${_msg} ()")
  endif()
  # optionally quiet the deprecation message
  if(NOT ${kioto_DEPRECATED_QUIET})
    message(DEPRECATION "${_msg}")
  endif()
endif()

# flag package as ament-based to distinguish it after being find_package()-ed
set(kioto_FOUND_AMENT_PACKAGE TRUE)

# include all config extra files
set(_extras "")
foreach(_extra ${_extras})
  include("${kioto_DIR}/${_extra}")
endforeach()
