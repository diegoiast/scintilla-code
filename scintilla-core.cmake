set(SCINTILLA_CORE_SOURCES
    src/AutoComplete.cxx
    src/CallTip.cxx
    src/CaseConvert.cxx
    src/CaseFolder.cxx
    src/CellBuffer.cxx
    src/ChangeHistory.cxx
    src/CharacterCategoryMap.cxx
    src/CharacterType.cxx
    src/CharClassify.cxx
    src/ContractionState.cxx
    src/DBCS.cxx
    src/Decoration.cxx
    src/Document.cxx
    src/EditModel.cxx
    src/Editor.cxx
    src/EditView.cxx
    src/Geometry.cxx
    src/Indicator.cxx
    src/KeyMap.cxx
    src/LineMarker.cxx
    src/MarginView.cxx
    src/PerLine.cxx
    src/PositionCache.cxx
    src/RESearch.cxx
    src/RunStyles.cxx
    src/ScintillaBase.cxx
    src/Selection.cxx
    src/Style.cxx
    src/UndoHistory.cxx
    src/UniConversion.cxx
    src/UniqueString.cxx
    src/ViewStyle.cxx
    src/XPM.cxx
)

add_library(scintilla-core ${SCINTILLA_CORE_SOURCES})

target_include_directories(scintilla-core PRIVATE src/)
target_compile_definitions(scintilla-core PRIVATE
    -DMAKING_LIBRARY=1
    -D_CRT_SECURE_NO_DEPRECATE=1
)
target_compile_definitions(scintilla-core PUBLIC -DSCI_LEXER=1)
target_include_directories(scintilla-core PUBLIC include/)
set_property(TARGET scintilla-core PROPERTY VERSION "${CMAKE_PROJECT_VERSION}")
set_property(TARGET scintilla-core PROPERTY SOVERSION 5)
