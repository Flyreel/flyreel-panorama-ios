# For more information about using CMake with Android Studio, read the
# documentation: https://d.android.com/studio/projects/add-native-code.html

# Sets the minimum version of CMake required to build the native library.

cmake_minimum_required(VERSION 3.10.2)


include_directories(${OpenCV_DIR}/jni/include)
include_directories(${Eigen_DIR}/eigen-3.4.0)
include_directories(${Eigen_DIR}/optim/header_only_version)


#set(OpenCV_STATIC on)
add_library(lib_opencv STATIC IMPORTED)
set_target_properties(lib_opencv PROPERTIES IMPORTED_LOCATION ${OpenCV_DIR}/libs/${ANDROID_ABI}/libopencv_java4.so)

# Declares and names the project.

project("nativePanoramaV3_native_library")

# Creates and names a library, sets it as either STATIC
# or SHARED, and provides the relative paths to its source code.
# You can define multiple libraries, and CMake builds them for you.
# Gradle automatically packages shared libraries with your APK.

add_library( # Sets the name of the library.
        nativePanoramaV3_native_library

        # Sets the library as a shared library.
        SHARED

        # Provides a relative path to your source file(s).
        android-native-lib.cpp
        capture.cpp
        leash-generator.cpp
        panel-generator.cpp
        fast_obj.c
        microtar.c


        )

# Searches for a specified prebuilt library and stores the path as a
# variable. Because CMake includes system libraries in the search path by
# default, you only need to specify the name of the public NDK library
# you want to add. CMake verifies that the library exists before
# completing its build.

find_library( # Sets the name of the path variable.
        log-lib

        # Specifies the name of the NDK library that
        # you want CMake to locate.
        log)

# Specifies libraries CMake should link to your target library. You
# can link multiple libraries, such as libraries you define in this
# build script, prebuilt third-party libraries, or system libraries.
find_library(jnigraphics-lib jnigraphics)
find_library(android-lib android)
target_link_libraries( # Specifies the target library.
        nativePanoramaV3_native_library

        lib_opencv
        ${jnigraphics-lib}
        ${android-lib}

        # Links the target library to the log library
        # included in the NDK.
        ${log-lib})