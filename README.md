
# DaKanji-Dependencies

A repository to bundle dependencies such as dynamic libraries, modified packages and assets used by DaKanji.

The release section contains files matching the DaKanji releases
* mecab dictionary
* mecab windows .dll
* tensorflow lite dynamic libraries

## flutter_appavailability
Custom version of `flutter_appavailability` to make the project buildable again.

## lilquid_swipe_flutter
Custom version of `lilquid_swipe_flutter` to match the behavior desired in DaKanji

## TensorflowLite-Binaries

Github actions to build TF Lite desktop binaries for Linux, Windows and Mac OS and publish them in the release section.

Building follows the [official CMake guide](https://www.tensorflow.org/lite/guide/build_cmake) ([cross compiling guide](https://www.tensorflow.org/lite/guide/build_cmake_arm))

Requirements:

* CMake
  * Mac: `brew install cmake`
  * Ubuntu: `sudo apt-get install cmake`
  * Windows: download from [offical cmake page](https://cmake.org/download/)
* Clone Tensorflow source
  * `git clone https://github.com/tensorflow/tensorflow.git tensorflow_src`

The binaries can manually build with make (make and cmake need to be on `$PATH`).
By default they are built with openCL GPU delegate support and otherwise default settings.

``` bash
# macos (creates x86, arm64 and universal binaries on apple silicone, other systems have not been tested)
make mac

# windows (creates )
make win

# linux
make lin
```

and are afterwards available in `build/`os`/binary_name`
