cmake_minimum_required(VERSION 3.20)

project(scintilla)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# TODO add booleans to enable build of GTK, Win32, cocoa and QT versions


# FIXME: GTK does not build yet, working on that
#include(scintilla-gtk.cmake)

# TODO: Create a win32 version
#include(scintilla-win32.cmake)

# TODO: Create a cocoa version
#include(scintilla-cocoa.cmake)

include(scintilla-qt.cmake)
