#!/bin/bash

echo "Link configs"

echo "- /agent/Media/XML/"
if [ ! -d "/data/XML" ]
then
  echo "-- moving original"
  mv /agent/Media/XML/ /data/XML/
else
  echo "-- use persisted"
  rm -rf /agent/Media/XML/
fi
mkdir -p /agent/Media
cd /agent/Media/
ln -s /data/XML

echo "- /agent/Media/WebServerRoot/Media"
if [ ! -d "/data/Media" ]
then
  echo "-- moving original"
  mv /agent/Media/WebServerRoot/ /data/Media/
else
  echo "-- use persisted"
  rm -rf /agent/Media/WebServerRoot/Media/
fi
mkdir -p /agent/Media/WebServerRoot
cd /agent/Media/WebServerRoot/
ln -s /data/Media

echo "- /agent/Commands/"
if [ ! -d "/data/Commands" ]
then
  echo "-- moving original"
  mv /agent/Commands/ /data/Commands/
else
  echo "-- use persisted"
  rm -rf /agent/Commands/
fi
mkdir -p /data/Commands
cd /agent/
ln -s /data/Commands

echo "Start AgentDVR"
/agent/Agent

for (( ; ; ))
do
   sleep 60
done
