find_package(PkgConfig REQUIRED)

# FIXME this does not link even

pkg_check_modules(deps REQUIRED IMPORTED_TARGET atk)
pkg_check_modules(deps REQUIRED IMPORTED_TARGET glib-2.0)
pkg_check_modules(deps REQUIRED IMPORTED_TARGET gtk+-2.0)
pkg_check_modules(deps REQUIRED IMPORTED_TARGET gdk-2.0)

add_library(sintilla-gtk
	src/AutoComplete.cxx
	src/CallTip.cxx
	src/CaseConvert.cxx
	src/CaseFolder.cxx
	src/CellBuffer.cxx
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
	src/Selection.cxx
	src/Style.cxx
	src/UniqueString.cxx
	src/UniConversion.cxx
	src/ViewStyle.cxx
	src/XPM.cxx
	src/ScintillaBase.cxx
	gtk/PlatGTK.cxx
	gtk/ScintillaGTK.cxx
	gtk/ScintillaGTKAccessible.o
)
target_link_libraries(sintilla-gtk PkgConfig::deps)
target_include_directories(sintilla-gtk PRIVATE ${deps_INCLUDE_DIRS} )
target_include_directories(sintilla-gtk PUBLIC include/)
target_include_directories(sintilla-gtk PRIVATE include/ src/)
