set(INSTALL_MANIFEST "C:/Users/brier/OpenSourceContributions/polybar/cmake-build-debug/install_manifest.txt")
if(NOT EXISTS ${INSTALL_MANIFEST})
  message(FATAL_ERROR "Cannot find install manifest: ${INSTALL_MANIFEST}")
endif()

file(READ ${INSTALL_MANIFEST} files)
string(REGEX REPLACE "\n" ";" files "${files}")
list(REVERSE files)

foreach(file ${files})
  message(STATUS "Uninstalling $ENV{DESTDIR}${file}")
  if(EXISTS "$ENV{DESTDIR}${file}")
    execute_process(COMMAND "C:/Users/brier/CLion 2022.3.1/bin/cmake/win/x64/bin/cmake.exe"
      -E remove "$ENV{DESTDIR}${file}"
      OUTPUT_VARIABLE rm_out
      RESULT_VARIABLE rm_retval)
    if(NOT ${rm_retval} EQUAL 0)
      message(FATAL_ERROR "Problem when removing $ENV{DESTDIR}${file}")
    endif()
  else()
    message(STATUS "File $ENV{DESTDIR}${file} does not exist")
  endif()
endforeach()
