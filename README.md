
# TensorflowLite-Binaries

This repo contains some pre-built Tensorflow Lite binaries for Linux (x86), Windows and Mac OS (arm, x86, universal).

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
