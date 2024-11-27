set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)
set(CMAKE_AUTOUIC ON)

find_package(QT NAMES Qt6 Qt5 COMPONENTS Core REQUIRED)
find_package(Qt${QT_VERSION_MAJOR} COMPONENTS Core Gui Widgets REQUIRED)

if (Qt6_FOUND)
    find_package(Qt${QT_VERSION_MAJOR} COMPONENTS Core5Compat REQUIRED)
endif()

set(SCINTILLA_QT_EDIT_SOURCES
    qt/ScintillaEditBase/PlatQt.cpp
    qt/ScintillaEditBase/PlatQt.h
    qt/ScintillaEditBase/ScintillaEditBase.cpp
    qt/ScintillaEditBase/ScintillaEditBase.h
    qt/ScintillaEditBase/ScintillaQt.cpp
    qt/ScintillaEditBase/ScintillaQt.h
    qt/ScintillaEdit/ScintillaDocument.cpp
    qt/ScintillaEdit/ScintillaDocument.h
    qt/ScintillaEdit/ScintillaEdit.cpp
    qt/ScintillaEdit/ScintillaEdit.h
    src/AutoComplete.cxx
    src/AutoComplete.h
    src/CallTip.cxx
    src/CallTip.h
    src/CaseConvert.cxx
    src/CaseConvert.h
    src/CaseFolder.cxx
    src/CaseFolder.h
    src/CellBuffer.cxx
    src/CellBuffer.h
    src/ChangeHistory.cxx
    src/ChangeHistory.h
    src/CharacterCategoryMap.cxx
    src/CharacterCategoryMap.h
    src/CharacterType.cxx
    src/CharacterType.h
    src/CharClassify.cxx
    src/CharClassify.h
    src/ContractionState.cxx
    src/ContractionState.h
    src/DBCS.cxx
    src/DBCS.h
    src/Debugging.h
    src/Decoration.cxx
    src/Decoration.h
    src/Document.cxx
    src/Document.h
    src/EditModel.cxx
    src/EditModel.h
    src/Editor.cxx
    src/Editor.h
    src/EditView.cxx
    src/EditView.h
    src/ElapsedPeriod.h
    src/Geometry.cxx
    src/Geometry.h
    src/Indicator.cxx
    src/Indicator.h
    src/KeyMap.cxx
    src/KeyMap.h
    src/LineMarker.cxx
    src/LineMarker.h
    src/MarginView.cxx
    src/MarginView.h
    src/Partitioning.h
    src/PerLine.cxx
    src/PerLine.h
    src/Platform.h
    src/PositionCache.cxx
    src/PositionCache.h
    src/Position.h
    src/RESearch.cxx
    src/RESearch.h
    src/RunStyles.cxx
    src/RunStyles.h
    src/ScintillaBase.cxx
    src/ScintillaBase.h
    src/Selection.cxx
    src/Selection.h
    src/SparseVector.h
    src/SplitVector.h
    src/Style.cxx
    src/Style.h
    src/UndoHistory.cxx
    src/UndoHistory.h
    src/UniConversion.cxx
    src/UniConversion.h
    src/UniqueString.cxx
    src/UniqueString.h
    src/ViewStyle.cxx
    src/ViewStyle.h
    src/XPM.cxx
    src/XPM.h
)

add_library(scintilla-qt-edit ${SCINTILLA_QT_EDIT_SOURCES} )

target_include_directories(scintilla-qt-edit PRIVATE include/ src/ qt/ qt/ScintillaEditBase)
target_compile_definitions(scintilla-qt-edit PRIVATE
    -DSCINTILLA_QT=1
    -DMAKING_LIBRARY=1
    -DSCI_LEXER=1
    -D_CRT_SECURE_NO_DEPRECATE=1
)
target_include_directories(scintilla-qt-edit PUBLIC include/ src/ qt/ScintillaEdit qt/ScintillaEditBase )
target_link_libraries(scintilla-qt-edit PRIVATE Qt::Widgets )
if (Qt6_FOUND)
    target_link_libraries(scintilla-qt-edit PRIVATE Qt6::Core5Compat)
endif()
set_property(TARGET scintilla-qt-edit PROPERTY VERSION "${CMAKE_PROJECT_VERSION}")
set_property(TARGET scintilla-qt-edit PROPERTY SOVERSION 5 )
