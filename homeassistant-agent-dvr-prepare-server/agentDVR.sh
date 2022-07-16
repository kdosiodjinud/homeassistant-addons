#!/bin/sh

echo "Install AgentDVR"
  cd /home/agentdvr
  mkdir AgentDVR
  cd AgentDVR
#	curl --show-error --location "https://ispyfiles.azureedge.net/downloads/Agent_ARM32_3_7_6_0.zip" -o "AgentDVR.zip"
	curl --show-error --location "https://ispyfiles.azureedge.net/downloads/Agent_Linux64_4_1_0_0.zip" -o "AgentDVR.zip"
	unzip AgentDVR.zip
	rm AgentDVR.zip
