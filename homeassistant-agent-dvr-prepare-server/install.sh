#!/bin/sh

ABSOLUTE_PATH="${PWD}"

echo "installing build tools"

apt-get update && apt-get install --no-install-recommends -y unzip python3 curl make g++ build-essential libvlc-dev vlc libx11-dev libtbb-dev libc6-dev gss-ntlmssp libusb-1.0-0-dev apt-transport-https libatlas-base-dev alsa-utils libxext-dev ffmpeg

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

echo "finding installer for amd64"
AGENTURL=$(curl -s --fail "https://www.ispyconnect.com/api/Agent/DownloadLocation2?productID=24&is64=true&platform=Linux" | tr -d '"')
echo "Downloading $AGENTURL"
curl --show-error --location "$AGENTURL" -o "AgentDVR.zip"
unzip AgentDVR.zip
rm AgentDVR.zip

echo "Installing dotnet 3.1.300"
curl -s -L "https://dot.net/v1/dotnet-install.sh" | bash -s -- --version "3.1.300" --install-dir "$ABSOLUTE_PATH/AgentDVR/.dotnet"

cd $ABSOLUTE_PATH

name=$(whoami)
echo "Adding permission for local device access"
sudo adduser $name video
sudo usermod -a -G video $name

exit 0
