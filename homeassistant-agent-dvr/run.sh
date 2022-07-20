#!/bin/bash

echo "Start AgentDVR"
/home/agentdvr/AgentDVR/.dotnet/dotnet /home/agentdvr/AgentDVR/Agent.dll

for (( ; ; ))
do
   echo "Agent DVR failed!"
   sleep 60
done
