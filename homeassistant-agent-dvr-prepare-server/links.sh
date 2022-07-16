#!/bin/sh

echo "Link data to persist in hassio"
  cd /home/agentdvr/AgentDVR

  mkdir -p /data/XML
  mv XML /data/XML
  ln -s /data/XML/
  cd ..

  mkdir -p /data/Commands
  mv Commands /data/Commands
  ln -s /data/Commands/
  cd ..

  mkdir -p /data/Media
  mv Media /data/Media
  ln -s /data/Media/
  cd ..

  chmod -R 777 /home/agentdvr
  chmod -R 777 /data/XML
  chmod -R 777 /data/Commands
  chmod -R 777 /data/Media

  chown -R agentdvr:agentdvr /home/agentdvr
  chown -R agentdvr:agentdvr /data/XML
  chown -R agentdvr:agentdvr /data/Commands
  chown -R agentdvr:agentdvr /data/Media
