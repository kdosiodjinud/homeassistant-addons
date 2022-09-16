#!/bin/bash

echo "Link configs"

cd /agent/Media/
echo "- /agent/Media/XML/"
if [ ! -d "/data/XML" ]
then
  echo "-- moving original"
  mv /agent/Media/XML/ /data/XML/
else
  echo "-- use persisted"
  rm -rf /agent/Media/XML/
fi
ln -s /data/XML

cd /agent/Media/WebServerRoot/
echo "- /agent/Media/WebServerRoot/Media"
if [ ! -d "/data/Media" ]
then
  echo "-- moving original"
  mv /agent/Media/WebServerRoot/ /data/Media/
else
  echo "-- use persisted"
  rm -rf /agent/Media/WebServerRoot/Media/
fi
ln -s /data/Media

cd /agent/
echo "- /agent/Commands/"
if [ ! -d "/data/Commands" ]
then
  echo "-- moving original"
  mv /agent/Commands/ /data/Commands/
else
  echo "-- use persisted"
  rm -rf /agent/Commands/
fi
ln -s /data/Commands

echo "Start AgentDVR"

/agent/Agent

for (( ; ; ))
do
   sleep 60
done
