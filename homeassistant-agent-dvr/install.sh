#!/bin/sh

# Install script for AgentDVR/Linux

echo "installing build tools"
  apk update && apk add unzip python3 curl make g++ libvlc-dev build-essential vlc libx11-dev


FILE=$ABSOLUTE_PATH/start_agent.sh
if [ ! -f $FILE ]
then
	echo "downloading start script"
	curl --show-error --location "https://raw.githubusercontent.com/ispysoftware/agent-install-scripts/main/start_agent.sh" -o "start_agent.sh"
	chmod a+x ./start_agent.sh
fi

mkdir AgentDVR
cd AgentDVR

FILE=$ABSOLUTE_PATH/AgentDVR/Agent.dll
if [ ! -f $FILE ]
then
	echo "finding installer for $(arch)"
	purl="https://www.ispyconnect.com/api/Agent/DownloadLocation2?productID=24&is64=true&platform=Linux"
	case $(arch) in
		'aarch64' | 'arm64')
			purl="https://www.ispyconnect.com/api/Agent/DownloadLocation2?productID=24&is64=true&platform=ARM"
		;;
		'arm' | 'armv6l' | 'armv7l')
			purl="https://www.ispyconnect.com/api/Agent/DownloadLocation2?productID=24&is64=false&platform=ARM32"
		;;
	esac

	AGENTURL=$(curl -s --fail "$purl" | tr -d '"')
	echo "Downloading $AGENTURL"
	curl --show-error --location "$AGENTURL" -o "AgentDVR.zip"
	unzip AgentDVR.zip
else
	echo "Found Agent in $ABSOLUTE_PATH/AgentDVR - delete it to reinstall"
fi

#if [ ! -d $ABSOLUTE_PATH/AgentDVR/.dotnet ]
#then
#	echo -n "Install dotnetfor Agent (y/n)? "
#	curl -s -L "https://dot.net/v1/dotnet-install.sh" | bash -s -- --version "3.1.300" --install-dir "$ABSOLUTE_PATH/AgentDVR/.dotnet"
#else
#	echo "Found dotnet in $ABSOLUTE_PATH/AgentDVR/.dotnet - delete it to reinstall"
#fi

apk add ffmpeg

cd $ABSOLUTE_PATH

FILE=/etc/systemd/system/AgentDVR.service
if [ ! -f $FILE ]
then
	echo -n "Install AgentDVR as system service"
  echo Yes
  read -p "Enter your username [$(whoami)]: " name
  name=${name:-$(whoami)}
  curl --show-error --location "https://raw.githubusercontent.com/ispysoftware/agent-install-scripts/main/AgentDVR.service" -o "AgentDVR.service"
  sed -i "s|AGENT_LOCATION|$ABSOLUTE_PATH|" AgentDVR.service
  sed -i "s|YOUR_USERNAME|$name|" AgentDVR.service
  chmod 644 ./AgentDVR.service
  chown $name -R $ABSOLUTE_PATH/AgentDVR
  cp AgentDVR.service /etc/systemd/system/AgentDVR.service
  systemctl daemon-reload
  systemctl enable AgentDVR.service
  systemctl start AgentDVR
  echo "started service"
  echo "go to http://localhost:8090 to configure"
  exit
else
	echo "Found service definition in /etc/systemd/system/AgentDVR.service"
	echo "Go to http://localhost:8090"
fi

exit
