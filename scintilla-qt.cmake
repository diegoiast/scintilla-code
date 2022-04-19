set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)
set(CMAKE_AUTOUIC ON)

# TODO add support for Qt6
find_package(Qt5 COMPONENTS Widgets REQUIRED)

# TODO make a common library for scintilla-qt
# Note how scintilla-qt-edit-base and scintilla-qt-edit share a lot of
# code. This can be shared in another 3d parent library. This means that
# libraries dependent on this (lexilla for example) does not have to
# choose an implementation, instead use the shared library.
# Or am I reading this bad, and scintilla-qt-edit should depend on scintilla-qt-edit-base?
add_library(scintilla-qt-edit-base
    qt/ScintillaEditBase/PlatQt.cpp
    qt/ScintillaEditBase/ScintillaQt.cpp
    qt/ScintillaEditBase/ScintillaEditBase.cpp
    src/XPM.cxx
    src/ViewStyle.cxx
    src/UniqueString.cxx
    src/UniConversion.cxx
    src/Style.cxx
    src/Selection.cxx
    src/ScintillaBase.cxx
    src/RunStyles.cxx
    src/RESearch.cxx
    src/PositionCache.cxx
    src/PerLine.cxx
    src/MarginView.cxx
    src/LineMarker.cxx
    src/KeyMap.cxx
    src/Indicator.cxx
    src/Geometry.cxx
    src/EditView.cxx
    src/Editor.cxx
    src/EditModel.cxx
    src/Document.cxx
    src/Decoration.cxx
    src/DBCS.cxx
    src/ContractionState.cxx
    src/CharClassify.cxx
    src/CharacterType.cxx
    src/CharacterCategoryMap.cxx
    src/CellBuffer.cxx
    src/CaseFolder.cxx
    src/CaseConvert.cxx
    src/CallTip.cxx
    src/AutoComplete.cxx
)
target_include_directories(scintilla-qt-edit-base PRIVATE include/ src/ qt/)
target_include_directories(scintilla-qt-edit-base PUBLIC include/)
target_link_libraries(scintilla-qt-edit-base Qt5::Widgets)
set_property(TARGET scintilla-qt-edit-base PROPERTY VERSION "${CMAKE_PROJECT_VERSION}")
set_property(TARGET scintilla-qt-edit-base PROPERTY SOVERSION 5 )

add_library(scintilla-qt-edit
    qt/ScintillaEdit/ScintillaEdit.cpp
    qt/ScintillaEdit/ScintillaDocument.cpp
)
target_include_directories(scintilla-qt-edit PRIVATE include/ src/ qt/ qt/ScintillaEditBase)
target_compile_definitions(scintilla-qt-edit PRIVATE
    -DSCINTILLA_QT=1
    -DMAKING_LIBRARY=1
    -DSCI_LEXER=1
    -D_CRT_SECURE_NO_DEPRECATE=1
)
target_include_directories(scintilla-qt-edit PUBLIC include/ src/ qt/ScintillaEdit qt/ScintillaEditBase )
target_link_libraries(scintilla-qt-edit Qt5::Widgets scintilla-qt-edit-base)
set_property(TARGET scintilla-qt-edit PROPERTY VERSION "${CMAKE_PROJECT_VERSION}")
set_property(TARGET scintilla-qt-edit PROPERTY SOVERSION 5 )


# TODO - this part is too ugly, and should not be here
if ("${CMAKE_CXX_COMPILER_ID}" MATCHES "Clang")
    target_compile_options(scintilla-qt-edit PRIVATE -Wall -Wextra -pedantic --warn-no-unused-variable -Wformat -Wformat-security)
elseif ("${CMAKE_CXX_COMPILER_ID}" STREQUAL "GNU")
    target_compile_options(scintilla-qt-edit PRIVATE -Wall -Wextra -pedantic --warn-no-unused-variable -Wformat -Wformat-security)
elseif ("${CMAKE_CXX_COMPILER_ID}" STREQUAL "Intel")
    MESSAGE("TODO: Intel compiler uses generic builds - add better compile flags")
elseif ("${CMAKE_CXX_COMPILER_ID}" STREQUAL "MSVC")
    target_compile_options(scintilla-qt-edit PRIVATE /utf-8 /guard:cf)
    target_link_options(scintilla-qt-edit PRIVATE /guard:cf)
endif()
