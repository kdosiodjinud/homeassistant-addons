#!/bin/sh

ABSOLUTE_PATH="${PWD}"

echo "installing build tools"

apt-get update && apt-get install --no-install-recommends -y unzip python3 curl make g++ build-essential libvlc-dev vlc libx11-dev libtbb-dev libc6-dev gss-ntlmssp libusb-1.0-0-dev apt-transport-https libatlas-base-dev alsa-utils libxext-dev ffmpeg

mkdir AgentDVR
cd AgentDVR

FILE=$ABSOLUTE_PATH/AgentDVR/Agent.dll

echo "finding installer"
AGENTURL=$(curl -s --fail "https://www.ispyconnect.com/api/Agent/DownloadLocation4?platform=Linux64&fromVersion=0" | tr -d '"')

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
