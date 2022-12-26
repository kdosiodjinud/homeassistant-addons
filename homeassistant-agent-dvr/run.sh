#!/bin/bash

echo "Kill original process"
PROCESS_PID=$(pgrep -u root Agent)
kill $PROCESS_PID

echo "Link configs"

echo "- /agent/Media/XML/"
mkdir -p /agent/Media/XML
if [ ! -d "/data/XML" ]
then
  echo "-- moving original"
  mv /agent/Media/XML/ /data/XML/
else
  echo "-- use persisted"
  rm -rf /agent/Media/XML/
fi
cd /agent/Media/
ln -s /data/XML

echo "- /agent/Media/WebServerRoot/Media"
mkdir -p /agent/Media/WebServerRoot
if [ ! -d "/data/Media" ]
then
  echo "-- moving original"
  mv /agent/Media/WebServerRoot/ /data/Media/
else
  echo "-- use persisted"
  rm -rf /agent/Media/WebServerRoot/Media/
fi
mkdir -p /agent/Media/WebServerRoot/
ln -s /data/Media

echo "- /agent/Commands/"
mkdir -p /data/Commands
if [ ! -d "/data/Commands" ]
then
  echo "-- moving original"
  mv /agent/Commands/ /data/Commands/
else
  echo "-- use persisted"
  rm -rf /agent/Commands/
fi
cd /agent/
ln -s /data/Commands

echo "Start AgentDVR"
/agent/Agent

for (( ; ; ))
do
   sleep 60
done
