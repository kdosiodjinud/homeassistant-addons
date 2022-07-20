#!/bin/bash

echo "Create configs"
/home/agentdvr/AgentDVR/.dotnet/dotnet /home/agentdvr/AgentDVR/Agent.dll & sleep 5 && kill "$!"

sleep 5

ls -la /home/agentdvr/AgentDVR

echo "Link data to persist in hassio"
  cd /home/agentdvr/AgentDVR

  if [ ! -d "/data/Media/" ]
  then
    cp -R /home/agentdvr/AgentDVR/Media /data/
  fi
  rm -rf /home/agentdvr/AgentDVR/Media
  cd /home/agentdvr/AgentDVR && ln -s /data/Media/

  if [ ! -d "/data/Commands" ]
  then
    cp -R /home/agentdvr/AgentDVR/Commands /data/
  fi
  rm -rf /home/agentdvr/AgentDVR/Commands
  cd /home/agentdvr/AgentDVR && ln -s /data/Commands/

  chmod -R 777 /data/
  chmod -R 777 /home/agentdvr/AgentDVR/
  chown -R agentdvr:agentdvr /data/
  chown -R agentdvr:agentdvr /home/agentdvr/AgentDVR/

echo "Run AgentDVR with persisted configuration"
/home/agentdvr/AgentDVR/.dotnet/dotnet /home/agentdvr/AgentDVR/Agent.dll

for (( ; ; ))
do
   echo "Agent DVR failed!"
   sleep 60
done
