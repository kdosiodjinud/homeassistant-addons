#!/bin/bash

su agentdvr

echo "Create configs"
/home/agentdvr/AgentDVR/.dotnet/dotnet /home/agentdvr/AgentDVR/Agent.dll & sleep 10 && kill "$!"

sleep 10

echo "Link data to persist in hassio"
  cd /home/agentdvr/AgentDVR

  if [ ! -d "/data/XML" ]
  then
    mkdir -p /data/XML
    mv XML /data/
  else
    rm -rf XML
  fi
  ln -s /data/XML/

  if [ ! -d "/data/Commands" ]
  then
    mkdir -p /data/Commands
    mv Commands /data/
  else
    rm -rf Commands
  fi
  ln -s /data/Commands/

  if [ ! -d "/data/Media" ]
  then
    mkdir -p /data/Media
    mv Media /data/
  else
    rm -rf Media
  fi
  ln -s /data/Media/

echo "Run AgentDVR with persisted configuration"
/home/agentdvr/AgentDVR/.dotnet/dotnet /home/agentdvr/AgentDVR/Agent.dll

for (( ; ; ))
do
   echo "Agent DVR failed!"
   sleep 60
done
