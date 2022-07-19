#!/bin/bash

su agentdvr
echo "Run AgentDVR with persisted configuration"
/home/agentdvr/AgentDVR/.dotnet/dotnet /home/agentdvr/AgentDVR/Agent.dll

for (( ; ; ))
do
   echo "Container with Agent DVR!"
  whoami
   sleep 60
done
