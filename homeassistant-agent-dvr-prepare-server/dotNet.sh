#!/bin/sh

su agentdvr
echo "Install Dotnet"
  cd /home/agentdvr
	echo -n "Install dotnet 3.1.300 for Agent"
  curl -s -L "https://dot.net/v1/dotnet-install.sh" | bash -s -- --version "3.1.300" --install-dir "/home/agentdvr/AgentDVR/.dotnet"
