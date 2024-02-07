cmake_minimum_required(VERSION 3.16)

project(TeslaInfotainment VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 6.4 REQUIRED COMPONENTS Quick)

qt_standard_project_setup()

qt_add_executable(appTeslaInfotainment
    main.cpp
)

qt_add_qml_module(appTeslaInfotainment
    URI TeslaInfotainment
    VERSION 1.0
    QML_FILES Main.qml
    QML_FILES ui/BottomBar/BottomBar.qml
    QML_FILES ui/RightScreen/RightScreen.qml
    QML_FILES ui/LeftScreen/LeftScreen.qml
RESOURCES ui/assets/cybertruck.png
RESOURCES ui/assets/caricon.png
SOURCES Controllers/system.h Controllers/system.cpp
RESOURCES ui/assets/lock-solid.png
RESOURCES ui/assets/lock-open-solid.png
RESOURCES ui/assets/user-solid.png
RESOURCES ui/assets/search-solid.png
QML_FILES ui/RightScreen/NavigationSearchBar.qml
QML_FILES ui/RightScreen/CanvasPanel.qml
QML_FILES
RESOURCES ui/assets/cylinder.png ui/assets/sphere.png ui/assets/square.png
QML_FILES ui/RightScreen/ShapeComponent.qml
RESOURCES ui/assets/palette-solid.png

)



# Qt for iOS sets MACOSX_BUNDLE_GUI_IDENTIFIER automatically since Qt 6.1.
# If you are developing for iOS or macOS you should consider setting an
# explicit, fixed bundle identifier manually though.
set_target_properties(appTeslaInfotainment PROPERTIES
#    MACOSX_BUNDLE_GUI_IDENTIFIER com.example.appTeslaInfotainment
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(appTeslaInfotainment
    PRIVATE Qt6::Quick
)

include(GNUInstallDirs)
install(TARGETS appTeslaInfotainment
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
