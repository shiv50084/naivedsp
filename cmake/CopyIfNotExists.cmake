if(${CMAKE_ARGC} LESS 5)
  message(FATAL_ERROR "${CMAKE_ARGV0}: invalid arguments")
endif()

if(IS_DIRECTORY ${CMAKE_ARGV4})
  string(REGEX MATCH "[^/\\]*$" filename ${CMAKE_ARGV3})
  if(NOT (EXISTS ${CMAKE_ARGV4}/${filename}))
    execute_process(COMMAND ${CMAKE_COMMAND} -E copy ${CMAKE_ARGV3} ${CMAKE_ARGV4})
  endif()
elseif(NOT (EXISTS ${CMAKE_ARGV4}))
  execute_process(COMMAND ${CMAKE_COMMAND} -E copy ${CMAKE_ARGV3} ${CMAKE_ARGV4})
endif()