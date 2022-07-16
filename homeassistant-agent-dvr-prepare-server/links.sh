#!/bin/sh

echo "Link data to persist in hassio"
  cd /home/agentdvr/AgentDVR

  mkdir -p /data/XML
  mv XML /data/XML
  rm -rf /home/agentdvr/AgentDVR/XML
  ln -s /data/XML/

  mkdir -p /data/Commands
  mv Commands /data/Commands
  rm -rf /home/agentdvr/AgentDVR/Commands
  ln -s /data/Commands/

  mkdir -p /data/Media
  mv Media /data/Media
  rm -rf /home/agentdvr/AgentDVR/Media
  ln -s /data/Media/

  chmod -R 777 /home/agentdvr
  chmod -R 777 /data/XML
  chmod -R 777 /data/Commands
  chmod -R 777 /data/Media

  chown -R agentdvr:agentdvr /home/agentdvr
  chown -R agentdvr:agentdvr /data/XML
  chown -R agentdvr:agentdvr /data/Commands
  chown -R agentdvr:agentdvr /data/Media
