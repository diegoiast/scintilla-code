set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)
set(CMAKE_AUTOUIC ON)

find_package(QT NAMES Qt6 Qt5 COMPONENTS Core REQUIRED)
find_package(Qt${QT_VERSION_MAJOR} COMPONENTS Core Gui Widgets REQUIRED)

if (Qt6_FOUND)
    find_package(Qt${QT_VERSION_MAJOR} COMPONENTS Core5Compat REQUIRED)
endif()

set(SCINTILLA_QT_EDIT_BASE_SOURCES
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

if (BUILD_STATIC)
    set(CMAKE_STATIC_LIBRARY_SUFFIX "_static${CMAKE_STATIC_LIBRARY_SUFFIX}")
    add_library(scintilla-qt-edit-base STATIC ${SCINTILLA_QT_EDIT_BASE_SOURCES})
    target_compile_definitions(scintilla-qt-edit-base PUBLIC SCINTILLA_STATIC)
else()
    add_library(scintilla-qt-edit-base SHARED ${SCINTILLA_QT_EDIT_BASE_SOURCES})
endif()
target_include_directories(scintilla-qt-edit-base PRIVATE include/ src/ qt/)
target_include_directories(scintilla-qt-edit-base PUBLIC include/)
target_link_libraries(scintilla-qt-edit-base PRIVATE Qt::Widgets)
if (UNIX)
    target_link_libraries(scintilla-qt-edit-base PRIVATE pthread)
endif()
if (Qt6_FOUND)
    target_link_libraries(scintilla-qt-edit-base PRIVATE Qt6::Core5Compat)
endif()
set_property(TARGET scintilla-qt-edit-base PROPERTY VERSION "${CMAKE_PROJECT_VERSION}")
set_property(TARGET scintilla-qt-edit-base PROPERTY SOVERSION 5 )

if (BUILD_STATIC)
    set(CMAKE_STATIC_LIBRARY_SUFFIX "_static${CMAKE_STATIC_LIBRARY_SUFFIX}")
    add_library(scintilla-qt-edit STATIC qt/ScintillaEdit/ScintillaEdit.cpp qt/ScintillaEdit/ScintillaDocument.cpp)
    target_compile_definitions(scintilla-qt-edit PUBLIC SCINTILLA_STATIC)
else()
    add_library(scintilla-qt-edit SHARED qt/ScintillaEdit/ScintillaEdit.cpp qt/ScintillaEdit/ScintillaDocument.cpp)
endif()
target_include_directories(scintilla-qt-edit PRIVATE include/ src/ qt/ qt/ScintillaEditBase)
target_compile_definitions(scintilla-qt-edit PRIVATE
    -DSCINTILLA_QT=1
    -DMAKING_LIBRARY=1
    -DSCI_LEXER=1
    -D_CRT_SECURE_NO_DEPRECATE=1
)
target_include_directories(scintilla-qt-edit PUBLIC include/ src/ qt/ScintillaEdit qt/ScintillaEditBase )
target_link_libraries(scintilla-qt-edit PRIVATE Qt::Widgets scintilla-qt-edit-base)
if (Qt6_FOUND)
    target_link_libraries(scintilla-qt-edit PRIVATE Qt6::Core5Compat)
endif()
set_property(TARGET scintilla-qt-edit PROPERTY VERSION "${CMAKE_PROJECT_VERSION}")
set_property(TARGET scintilla-qt-edit PROPERTY SOVERSION 5 )
