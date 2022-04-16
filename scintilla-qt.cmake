#find_package(PkgConfig REQUIRED)

set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)
set(CMAKE_AUTOUIC ON)

# TODO add support for Qt6
find_package(Qt5 COMPONENTS Widgets REQUIRED)

# TODO make a common library for scintilla-qt
# Note how scintilla-qt-edit-base and scintilla-qt-edit share a lot of
# code. This can be shared in another 3d parent library. This means that
# libraries dependent on this (lexillay for example) does not have to
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


add_library(scintilla-qt-edit
    qt/ScintillaEdit/ScintillaEdit.cpp
    qt/ScintillaEdit/ScintillaDocument.cpp
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
target_include_directories(scintilla-qt-edit PRIVATE include/ src/ qt/ qt/ScintillaEditBase)
target_include_directories(scintilla-qt-edit PUBLIC include/ src/ qt/ScintillaEdit qt/ScintillaEditBase )
target_link_libraries(scintilla-qt-edit Qt5::Widgets)
target_compile_definitions(scintilla-qt-edit PRIVATE
    -DSCINTILLA_QT=1
    -DMAKING_LIBRARY=1
    -DSCI_LEXER=1
    -D_CRT_SECURE_NO_DEPRECATE=1
)

# TODO add `NDEBUG` only on relase builds
# inside the original PRI file this was done only on release. However - I found an assert
# that crashes NotepadNext. I am not touching this right now
target_compile_definitions(scintilla-qt-edit PRIVATE  -DNDEBUG=1)
