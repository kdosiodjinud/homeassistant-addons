#!/bin/sh

echo "installing build tools"
	apt-get update
	apt-get install -y pip wget systemd unzip python3 curl make g++ build-essential libvlc-dev vlc libx11-dev ffmpeg build-essential cmake git unzip pkg-config gfortran libjpeg-dev libtiff-dev libpng-dev libavcodec-dev libavformat-dev libswscale-dev libgtk2.0-dev libcanberra-gtk* libgtk-3-dev libgstreamer1.0-dev gstreamer1.0-gtk3 libgstreamer-plugins-base1.0-dev gstreamer1.0-gl libxvidcore-dev libx264-dev python-dev python3-pip python3-dev python3-numpy libtbb2 libtbb-dev libdc1394-22-dev libv4l-dev v4l-utils libopenblas-dev libatlas-base-dev libblas-dev liblapack-dev gfortran libhdf5-dev libprotobuf-dev libgoogle-glog-dev libgflags-dev protobuf-compiler
	python3 -m pip install numpy
