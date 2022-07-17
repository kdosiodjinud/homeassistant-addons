#!/bin/sh

echo "Link data to persist in hassio"
  cd /home/agentdvr/AgentDVR

  mkdir -p /data/XML
  rm -rf XML
  ln -s /data/XML/

  mkdir -p /data/Commands
  rm -rf Commands
  ln -s /data/Commands/

  mkdir -p /data/Media
  rm -rf Media
  ln -s /data/Media/


  chmod -R 777 /data/
  chown -R agentdvr:agentdvr /data/
  chmod -R 777 /home/agentdvr
  chown -R agentdvr:agentdvr /home/agentdvr

  exit 0;
