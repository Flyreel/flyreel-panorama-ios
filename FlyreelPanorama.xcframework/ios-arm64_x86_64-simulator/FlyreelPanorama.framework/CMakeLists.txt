cmake_minimum_required(VERSION 3.22.1)
project("panorama-native-lib")

find_package(Eigen CONFIG REQUIRED)
find_package(OpenCV CONFIG REQUIRED)

add_library(
        ${CMAKE_PROJECT_NAME}
        SHARED
        android-native-lib.cpp
        capture.cpp
        leash-generator.cpp
        panel-generator.cpp
        fast_obj.c
        microtar.c
)

find_library(log-lib log)
find_library(jnigraphics-lib jnigraphics)
find_library(android-lib android)

target_link_libraries(
        ${CMAKE_PROJECT_NAME}

        # Eigen Static Library
        Eigen::Eigen

        # OpenCV Static Library
        OpenCV::kleidicv
        OpenCV::kleidicv_hal
        OpenCV::kleidicv_thread
        OpenCV::opencv_calib3d
        OpenCV::opencv_core
        OpenCV::opencv_highgui
        OpenCV::opencv_imgproc
        OpenCV::opencv_objdetect
        OpenCV::opencv_video

        ${jnigraphics-lib}
        ${android-lib}
        ${log-lib}
)
