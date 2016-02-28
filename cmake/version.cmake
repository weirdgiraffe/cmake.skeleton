set(VERSION_MAJOR 0)
set(VERSION_MINOR 1)
set(VERSION_REV 0)  # default value for revision is 0

# if git executable found then set $VERSION_REV
find_package(Git)
if (${GIT_EXECUTABLE})
	# Get the current working branch
	execute_process(
	  COMMAND ${GIT_EXECUTABLE} rev-parse --abbrev-ref HEAD
	  WORKING_DIRECTORY ${CMAKE_SOURCE_DIR}
	  OUTPUT_VARIABLE GIT_BRANCH
	  OUTPUT_STRIP_TRAILING_WHITESPACE
	)

	# Get the latest abbreviated commit hash of the working branch
	execute_process(
	  COMMAND ${GIT_EXECUTABLE} log -1 --format=%h
	  WORKING_DIRECTORY ${CMAKE_SOURCE_DIR}
	  OUTPUT_VARIABLE GIT_COMMIT_HASH
	  OUTPUT_STRIP_TRAILING_WHITESPACE
	)
	set(VERSION_REV "${GIT_COMMIT_HASH}_${GIT_BRANCH}")
endif()

set(VERSION_STR "${VERSION_MAJOR}.${VERSION_MINOR}.${VERSION_REV}")

