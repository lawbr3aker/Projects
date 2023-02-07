cmake_minimum_required(VERSION 3.14)

project(Optitex_Sentinel LANGUAGES CXX)
set(CMAKE_PREFIX_PATH "C:\\Qt5\\5.15.2\\mingw81_64")
set(CMAKE_INCLUDE_CURRENT_DIR ON)

set(CMAKE_AUTOUIC ON)
set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)

set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

set(QT_VERSION_MAJOR 5)

list(APPEND QT_REQUIRED_COMPONENTS Core Quick Network Gui Qml)

foreach (QT_REQUIRED_COMPONENT ${QT_REQUIRED_COMPONENTS})
    list(APPEND QT_REQUIRED_TARGETS Qt${QT_VERSION_MAJOR}::${QT_REQUIRED_COMPONENT})
endforeach ()

find_package(Qt${QT_VERSION_MAJOR} COMPONENTS ${QT_REQUIRED_COMPONENTS} REQUIRED)

set(PROJECT_SOURCES
        main.cpp
        qml.qrc
        Optitex/Scripts/OptitexSentinel.h
        Optitex/Scripts/Optitex.h
        Optitex/Scripts/Controller.h
        )

add_executable(${CMAKE_PROJECT_NAME}
    "WIN32"
        ${PROJECT_SOURCES}
        )

target_compile_definitions(${CMAKE_PROJECT_NAME}
        PRIVATE $<$<OR:$<CONFIG:Debug>,$<CONFIG:RelWithDebInfo>>:QT_QML_DEBUG>)

target_link_libraries(${CMAKE_PROJECT_NAME}
        PRIVATE ${QT_REQUIRED_TARGETS} )

set(QT_PATH "${Qt${QT_VERSION_MAJOR}_DIR}")

while (NOT EXISTS "${QT_PATH}/bin")
    set(QT_PATH "${QT_PATH}/..")
endwhile ()

foreach (QT_REQUIRED_COMPONENT ${QT_REQUIRED_COMPONENTS})
    file(GLOB
            QT_REQUIRED_COMPONENT_DLLS
            "${QT_PATH}/bin/Qt${QT_VERSION_MAJOR}${QT_REQUIRED_COMPONENT}*.dll")
    file(COPY ${QT_REQUIRED_COMPONENT_DLLS}
            DESTINATION ${CMAKE_BINARY_DIR})
endforeach()

file(COPY ${QT_PATH}/qml DESTINATION "${CMAKE_BINARY_DIR}")
file(GLOB QT_REQUIRED_COMPONENT_LIBS "${QT_PATH}/bin/lib*.dll")
file(COPY ${QT_REQUIRED_COMPONENT_LIBS}
    DESTINATION ${CMAKE_BINARY_DIR})
file(COPY ${QT_PATH}/plugins DESTINATION "${CMAKE_BINARY_DIR}")
file(COPY ${CMAKE_SOURCE_DIR}/Assets DESTINATION "${CMAKE_BINARY_DIR}")
