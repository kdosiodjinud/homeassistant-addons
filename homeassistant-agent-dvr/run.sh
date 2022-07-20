#!/bin/bash

echo "Link configs"
mkdir -p /data/Media
mkdir -p /data/XML
mkdir -p /data/Commands
cd /AgentDVR/
ln -s /data/Media
ln -s /data/XML
ln -s /data/Commands

echo "Start AgentDVR"
/AgentDVR/.dotnet/dotnet /AgentDVR/Agent.dll

for (( ; ; ))
do
   echo "Agent DVR failed!"
   sleep 60
done
