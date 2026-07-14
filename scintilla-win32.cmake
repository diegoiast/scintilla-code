# Win32 platform. Unverified on this machine (no MSVC/Windows toolchain
# available here) -- source list and link libraries are taken directly from
# win32/scintilla.mak's COMPONENT_OBJS/LIBS, not guessed. Needs a Windows box
# or CI leg to actually confirm it links.
#
# ScintillaDLL.cxx (win32/scintilla.mak's SHARED_OBJS) is intentionally
# excluded: it builds the C-exported Scintilla.dll entry points for
# consumers like SciTE, which scintilla-svision3 does not need -- it links
# scintilla-win32 directly, the same way scintilla-qt-edit is consumed.

add_library(scintilla-win32
    win32/PlatWin.cxx
    win32/ScintillaWin.cxx
    win32/ListBox.cxx
    win32/SurfaceGDI.cxx
    win32/SurfaceD2D.cxx
    win32/HanjaDic.cxx
)
target_link_libraries(scintilla-win32 PUBLIC scintilla-core)
target_link_libraries(scintilla-win32 PRIVATE
    kernel32 user32 gdi32 imm32 ole32 oleaut32 advapi32
)
target_include_directories(scintilla-win32 PRIVATE include/ src/ win32/)
set_property(TARGET scintilla-win32 PROPERTY VERSION "${CMAKE_PROJECT_VERSION}")
set_property(TARGET scintilla-win32 PROPERTY SOVERSION 5)
