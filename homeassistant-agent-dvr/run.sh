#!/bin/bash

echo "Link configs"

echo "- /data/Media"
cd /AgentDVR/
mkdir -p /data/Media
ln -s /data/Media

echo "- /data/XML"
if [ ! -d "/data/XML" ]
then
  echo "-- moving original"
  mv /AgentDVR/XML /data/
else
  echo "-- use persisted"
  rm -rf /AgentDVR/XML
fi
ln -s /data/XML

echo "- /data/Commands"
if [ ! -d "/data/Commands" ]
then
  echo "-- moving original"
  mv /AgentDVR/Commands /data/
else
  echo "-- use persisted"
  rm -rf /AgentDVR/Commands
fi
ln -s /data/Commands

echo "Start AgentDVR"
/AgentDVR/.dotnet/dotnet /AgentDVR/Agent.dll

for (( ; ; ))
do
   echo "Agent DVR failed!"
   sleep 60
done
