#!/bin/bash

/root/AgentDVR/.dotnet/dotnet ../Agent.dll

for (( ; ; ))
do
   echo "Container with Agent DVR run!"
   sleep 30
done
