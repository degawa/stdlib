if(CMAKE_Fortran_COMPILER_ID STREQUAL "GNU")
  set(
    CMAKE_Fortran_FLAGS_INIT
    "-fimplicit-none"
    "-ffree-line-length-132"
  )
  set(
    CMAKE_Fortran_FLAGS_RELEASE_INIT
  )
  set(
    CMAKE_Fortran_FLAGS_DEBUG_INIT
    "-Wall"
    "-Wextra"
    "-Wimplicit-procedure"
    "-std=f2018"
  )
elseif(CMAKE_Fortran_COMPILER_ID MATCHES "^Intel")
  if(CMAKE_Fortran_COMPILER_VERSION VERSION_LESS 19.0)
    set(STANDARD_FLAG_KEYWORD "f15")
  else()
    set(STANDARD_FLAG_KEYWORD "f18")
  endif()
  set(
    CMAKE_Fortran_FLAGS_INIT
  )
  if(WIN32)
    set(
      CMAKE_Fortran_FLAGS_RELEASE_INIT
      "/stand:${STANDARD_FLAG_KEYWORD} /nologo /fpp /MP:3 /O2"
    )
    set(
      CMAKE_Fortran_FLAGS_DEBUG_INIT
      "/stand:${STANDARD_FLAG_KEYWORD} /nologo /fpp /MP:3"
      "/warn:declarations,general,usage,interfaces,unused"
    )
  else()
    set(
      CMAKE_Fortran_FLAGS_RELEASE_INIT
      "-stand ${STANDARD_FLAG_KEYWORD} -nologo -fpp -O2"
    )
    set(
      CMAKE_Fortran_FLAGS_DEBUG_INIT
      "-stand ${STANDARD_FLAG_KEYWORD} -fpp"
      "-warn declarations,general,usage,interfaces,unused"
    )
  endif()
else()
  set(
    CMAKE_Fortran_FLAGS_INIT
  )
  set(
    CMAKE_Fortran_FLAGS_RELEASE_INIT
  )
  set(
    CMAKE_Fortran_FLAGS_DEBUG_INIT
  )
endif()
string(REPLACE ";" " " CMAKE_Fortran_FLAGS_INIT "${CMAKE_Fortran_FLAGS_INIT}")
string(REPLACE ";" " " CMAKE_Fortran_FLAGS_RELEASE_INIT "${CMAKE_Fortran_FLAGS_RELEASE_INIT}")
string(REPLACE ";" " " CMAKE_Fortran_FLAGS_DEBUG_INIT "${CMAKE_Fortran_FLAGS_DEBUG_INIT}")
