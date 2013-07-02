set(SDL_IMAGE_VERSION 1.2.12)


set(SDL_IMAGE_ARCHIVE    SDL_image-devel-${SDL_IMAGE_VERSION}-VC.zip)
set(SDL_IMAGE_ROOT       ${LOGOPRISM_LIBDIR}/SDL_image-${SDL_IMAGE_VERSION})
set(SDL_IMAGE_LIBRARYDIR ${SDL_IMAGE_ROOT}/lib/x86)

if(NOT EXISTS ${LOGOPRISM_LIBDIR}/${SDL_IMAGE_ARCHIVE})
  message(STATUS "Downloading SDL_image dependencies...")
  file(DOWNLOAD
    http://www.libsdl.org/projects/SDL_image/release/${SDL_IMAGE_ARCHIVE}
    ${LOGOPRISM_LIBDIR}/${SDL_IMAGE_ARCHIVE}
    SHOW_PROGRESS
  )
endif()

if(NOT EXISTS ${SDL_IMAGE_ROOT})

  message(STATUS "Extracting SDL dependencies...")
  execute_process(
    COMMAND ${7ZIP_EXECUTABLE} x -y -bd ${LOGOPRISM_LIBDIR}/${SDL_IMAGE_ARCHIVE}
    WORKING_DIRECTORY ${LOGOPRISM_LIBDIR}
  )
endif()

list(APPEND CMAKE_PREFIX_PATH ${SDL_IMAGE_ROOT})
list(APPEND CMAKE_LIBRARY_PATH ${SDL_IMAGE_LIBRARYDIR})