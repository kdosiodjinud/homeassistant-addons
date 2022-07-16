#!/bin/sh

echo "Link data to persist in hassio"
  cd /home/agentdvr/AgentDVR

  if [ ! -d "/data/XML" ]
  then
    mkdir -p /data/XML
    mv XML /data/
    ln -s /data/XML/

    chmod -R 777 /data/XML
    chown -R agentdvr:agentdvr /data/XML
  else
    rm -rf XML
    ln -s /data/XML/
  fi

  if [ ! -d "/data/Commands" ]
  then
    mkdir -p /data/Commands
    mv Commands /data/
    ln -s /data/Commands/

    chmod -R 777 /data/Commands
    chown -R agentdvr:agentdvr /data/Commands
  else
    rm -rf Commands
    ln -s /data/Commands/
  fi

  if [ ! -d "/data/Media" ]
  then
    mkdir -p /data/Media
    mv Media /data/
    ln -s /data/Media/

    chmod -R 777 /data/Media
    chown -R agentdvr:agentdvr /data/Media
  else
    rm -rf Media
    ln -s /data/Media/
  fi

  chmod -R 777 /home/agentdvr
  chown -R agentdvr:agentdvr /home/agentdvr

  exit 0;
