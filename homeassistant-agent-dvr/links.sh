#!/bin/bash

su agentdvr
echo "Create configs"
/home/agentdvr/AgentDVR/.dotnet/dotnet /home/agentdvr/AgentDVR/Agent.dll & sleep 10 && kill "$!"

echo "Link data to persist in hassio"
  cd /home/agentdvr/AgentDVR

  mkdir -p /data/XML
  rm -rf XML
  ln -s /data/XML/

  mkdir -p /data/Commands
  rm -rf Commands
  ln -s /data/Commands/

  mkdir -p /data/Media
  rm -rf Media
  ln -s /data/Media/

  exit 0;
