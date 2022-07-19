#!/bin/sh

echo "Install AgentDVR as system service"

chmod 644 ./AgentDVR.service
chown agentdvr -R /home/agentdvr/AgentDVR
cp AgentDVR.service /etc/systemd/system/AgentDVR.service

#systemctl daemon-reload
#systemctl enable AgentDVR.service
#systemctl start AgentDVR
