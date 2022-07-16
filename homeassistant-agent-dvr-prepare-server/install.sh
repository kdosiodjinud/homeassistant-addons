#!/bin/sh

echo "Create user"
 adduser --disabled-password --gecos "" agentdvr

echo "installing build tools"
	apt-get update
	apt-get install -y pip wget systemd unzip python3 curl make g++ build-essential libvlc-dev vlc libx11-dev ffmpeg build-essential cmake git unzip pkg-config gfortran libjpeg-dev libtiff-dev libpng-dev libavcodec-dev libavformat-dev libswscale-dev libgtk2.0-dev libcanberra-gtk* libgtk-3-dev libgstreamer1.0-dev gstreamer1.0-gtk3 libgstreamer-plugins-base1.0-dev gstreamer1.0-gl libxvidcore-dev libx264-dev python-dev python3-pip python3-dev python3-numpy libtbb2 libtbb-dev libdc1394-22-dev libv4l-dev v4l-utils libopenblas-dev libatlas-base-dev libblas-dev liblapack-dev gfortran libhdf5-dev libprotobuf-dev libgoogle-glog-dev libgflags-dev protobuf-compiler
	python3 -m pip install numpy

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

echo "Install AgentDVR"
  cd /home/agentdvr
  mkdir AgentDVR
  cd AgentDVR
#	curl --show-error --location "https://ispyfiles.azureedge.net/downloads/Agent_ARM32_3_7_6_0.zip" -o "AgentDVR.zip"
	curl --show-error --location "https://ispyfiles.azureedge.net/downloads/Agent_Linux64_4_1_0_0.zip" -o "AgentDVR.zip"
	unzip AgentDVR.zip
	rm AgentDVR.zip

echo "Install Dotnet"
  cd /home/agentdvr
	echo -n "Install dotnet 3.1.300 for Agent"
  curl -s -L "https://dot.net/v1/dotnet-install.sh" | bash -s -- --version "3.1.300" --install-dir "/home/agentdvr/AgentDVR/.dotnet"

echo "Link data to persist in hassio"
  cd /home/agentdvr/AgentDVR

  mkdir -p /data/XML
  mv XML /data/XML
  ln -s /data/XML/
  cd ..

  mkdir -p /data/Commands
  mv Commands /data/Commands
  ln -s /data/Commands/
  cd ..

  mkdir -p /data/Media
  mv Media /data/Media
  ln -s /data/Media/
  cd ..

  chmod -R 777 /home/agentdvr
  chmod -R 777 /data/XML
  chmod -R 777 /data/Commands
  chmod -R 777 /data/Media

  chown -R agentdvr:agentdvr /home/agentdvr
  chown -R agentdvr:agentdvr /data/XML
  chown -R agentdvr:agentdvr /data/Commands
  chown -R agentdvr:agentdvr /data/Media

exit
