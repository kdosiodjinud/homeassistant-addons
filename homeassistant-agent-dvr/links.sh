#!/bin/sh

echo "Link data to persist in hassio"
  cd /home/agentdvr/AgentDVR

  mkdir -p /data/XML
  mv XML -n /data/XMLTmp
  rm -rf /home/agentdvr/AgentDVR/XML
  ln -s /data/XML/
  mv -n XMLTmp ./XML

  mkdir -p /data/Commands
  mv -n Commands /data/CommandsTmp
  rm -rf /home/agentdvr/AgentDVR/Commands
  ln -s /data/Commands/
  mv -n CommandsTmp ./Commands

  mkdir -p /data/Media
  mv -n Media MediaTmp
  rm -rf /home/agentdvr/AgentDVR/Media
  ln -s /data/Media/
  mv -n MediaTmp ./Media

  chmod -R 777 /home/agentdvr
  chmod -R 777 /data/XML
  chmod -R 777 /data/Commands
  chmod -R 777 /data/Media

  chown -R agentdvr:agentdvr /home/agentdvr
  chown -R agentdvr:agentdvr /data/XML
  chown -R agentdvr:agentdvr /data/Commands
  chown -R agentdvr:agentdvr /data/Media

  exit 0;
