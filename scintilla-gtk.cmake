find_package(PkgConfig REQUIRED)

pkg_check_modules(deps REQUIRED IMPORTED_TARGET atk)
pkg_check_modules(deps REQUIRED IMPORTED_TARGET glib-2.0)
pkg_check_modules(deps REQUIRED IMPORTED_TARGET gtk+-3.0)

add_library(scintilla-gtk
    gtk/PlatGTK.cxx
    gtk/ScintillaGTK.cxx
    gtk/ScintillaGTKAccessible.cxx
    gtk/scintilla-marshal.c
)
target_link_libraries(scintilla-gtk PUBLIC scintilla-core)
target_link_libraries(scintilla-gtk PRIVATE PkgConfig::deps)
target_include_directories(scintilla-gtk PRIVATE ${deps_INCLUDE_DIRS})
target_include_directories(scintilla-gtk PRIVATE include/ src/ gtk/)
target_compile_definitions(scintilla-gtk PRIVATE -DGTK)
set_property(TARGET scintilla-gtk PROPERTY VERSION "${CMAKE_PROJECT_VERSION}")
set_property(TARGET scintilla-gtk PROPERTY SOVERSION 5)
