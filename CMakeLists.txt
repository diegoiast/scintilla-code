cmake_minimum_required(VERSION 3.20)

project(scintilla
    VERSION 5.3.3
    DESCRIPTION "A free source code editing component"
    LANGUAGES CXX
)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

option(BUILD_QT "Build the Qt Scintilla platform (ScintillaEdit)" ON)
option(BUILD_GTK "Build the GTK3 Scintilla platform" OFF)
option(BUILD_WIN32 "Build the Win32 Scintilla platform" OFF)

# Platform-agnostic Editor/Document engine, shared by every platform below.
include(scintilla-core.cmake)

if(BUILD_GTK)
    include(scintilla-gtk.cmake)
endif()

if(BUILD_WIN32)
    if(NOT WIN32)
        message(FATAL_ERROR "BUILD_WIN32 requires a Windows toolchain")
    endif()
    include(scintilla-win32.cmake)
endif()

# TODO: Create a cocoa version
#include(scintilla-cocoa.cmake)

if(BUILD_QT)
    include(scintilla-qt.cmake)
endif()
