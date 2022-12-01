# ScintillaCode - cmake soft/semi fork

![image](https://a.fsdn.com/con/app/proj/scintilla/screenshots/20757.jpg/max/max/1)

<!-- 
![image](https://a.fsdn.com/con/app/proj/scintilla/screenshots/272917.jpg/max/max/1)
![image](https://a.fsdn.com/con/app/proj/scintilla/screenshots/295087.jpg/max/max/1)
 -->

This is a semi fork of ScintillaCode, and a git/github mirror. The main goal 
of this fork is to enable CMake support - and make it  available over
git (upstream uses mercurial).

This mirror's working branch strictly follows upstream's master without
modifications - only adding a new build system, mainly aiming twards Qt5/Qt6.

See official documentation here: https://github.com/elcuco/scintilla-code/blob/cmake-support/README

# Usage

Simplest way to consume this library at the moment is using [CPM](https://github.com/cpm-cmake/CPM.cmake). 
This will eventually get into different package managers, as one of the aims
of this "fork" is to make Scintilla more available on the modern C++ ecosystem.


Add this to your cmake file:
``` CMake
include(CPM.cmake)
CPMAddPackage("gh:elcuco/scintilla-code#cmake-build")
CPMAddPackage("gh:elcuco/lexilla#cmake-build")

add_executable(my_app src/main.cpp ... )
target_link_libraries(my_app PUBLIC scintilla-qt-edit Qt::Widgets)
```

Then in your C++/Qt6/Qt5 code:
``` C++
#include <ScintillaEdit.h>

// now you have a QWigdet base Scintialla in your windows
auto editor = new ScintillaEdit(win);
```

These branches are synced once a week (more or less) with upstream
`mercurial` (master strictly follows upstream master) and `cmake-support`
will also contain a merge from upstream's `master` branch. 

Tags from upstream will also have a similar tag, with `cmake` prefix, which 
should only differ on the build system files.

Available tags:
* 5.3.1
    * https://github.com/elcuco/scintilla-code/releases/tag/rel-5-3-1
    * https://github.com/elcuco/scintilla-code/releases/tag/rel-5-3-1-cmake
* 5.2.2
    * https://github.com/elcuco/scintilla-code/releases/tag/rel-5-2-2
    * https://github.com/elcuco/scintilla-code/releases/tag/rel-5-2-2-cmake
* 5.2.0
    * https://github.com/elcuco/scintilla-code/releases/tag/rel-5-2-2
    * https://github.com/elcuco/scintilla-code/releases/tag/rel-5-2-0-cmake

# Status

I am working on porting [NotepadNext](https://github.com/dail8859/NotepadNext/pull/100) 
to CMake, the app is stable when building the CMake branch.

From my point of view - this fork is as stable as it can be.

Qt6 is actively tested.

Qt5 should work, but not really tested. Seems like it "should work",
comment if you find any problem.

Code actively tested on Linux - but Notepadnext CI can build CL
on OSX and Windows/CL without any problems. CMake makes it transparent,
but if it fails - do report.


# PRs, changes etc

This project does not (yet?) have any unit test enabled, but I might add github workflows for this.

You can send PRs to this project, as long as you do not (!) modify code. All
code modifications should be done upstream: https://sourceforge.net/projects/scintilla/

Things I would like to fix, add:
1. win32 support. Should be trivial.
2. GTK support. Unsure how much this is needed, as GTK community is using Meson these days.
3. Cocoa... again, interesting, but I don't own a mac. Donations are welcomed :)
4. Qt6/Qt5 dynamic/static linking might do someproblems. Be warned.