#!/bin/bash

su agentdvr
#/home/agentdvr/AgentDVR/.dotnet/dotnet /home/agentdvr/AgentDVR/Agent.dll

for (( ; ; ))
do
   echo "Container with Agent DVR!"
   echo whoami
   sleep 60
done
