#!/bin/bash

/root/AgentDVR/.dotnet/dotnet /root/AgentDVR/Agent.dll

for (( ; ; ))
do
   echo "Container with Agent DVR!"
   sleep 30
done
