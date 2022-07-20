#!/bin/sh

echo "Install OpenCV"
  cd /home/agentdvr
  wget -O opencv.zip https://github.com/opencv/opencv/archive/4.5.4.zip
  wget -O opencv_contrib.zip https://github.com/opencv/opencv_contrib/archive/4.5.4.zip
  unzip opencv.zip
  unzip opencv_contrib.zip
  mv opencv-4.5.4 opencv
  mv opencv_contrib-4.5.4 opencv_contrib
  rm opencv.zip
  rm opencv_contrib.zip
  cd ~/opencv
  mkdir build
  cd build
  cmake -D CMAKE_BUILD_TYPE=RELEASE \
  -D CMAKE_INSTALL_PREFIX=/usr/local \
  -D OPENCV_EXTRA_MODULES_PATH=~/opencv_contrib/modules \
  -D ENABLE_NEON=ON \
  -D ENABLE_VFPV3=ON \
  -D WITH_OPENMP=ON \
  -D WITH_OPENCL=OFF \
  -D BUILD_ZLIB=ON \
  -D BUILD_TIFF=ON \
  -D WITH_FFMPEG=ON \
  -D WITH_TBB=ON \
  -D BUILD_TBB=ON \
  -D BUILD_TESTS=OFF \
  -D WITH_EIGEN=OFF \
  -D WITH_GSTREAMER=ON \
  -D WITH_V4L=ON \
  -D WITH_LIBV4L=ON \
  -D WITH_VTK=OFF \
  -D WITH_QT=OFF \
  -D OPENCV_ENABLE_NONFREE=ON \
  -D INSTALL_C_EXAMPLES=OFF \
  -D INSTALL_PYTHON_EXAMPLES=OFF \
  -D BUILD_opencv_python3=TRUE \
  -D OPENCV_GENERATE_PKGCONFIG=ON \
  -D BUILD_EXAMPLES=OFF ..
  make -j4
  make install
  ldconfig
  make clean
  echo "Congratulations!"
  echo "You've successfully installed OpenCV"
