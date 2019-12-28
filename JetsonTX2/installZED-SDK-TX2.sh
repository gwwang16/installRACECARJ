#!/bin/bash
# Download the Stereolabs SDK for the Jetson TX2 (JetPack 4.2 version, CUDA 10.0)
# Then run the installer
echo " "
echo "Downloading and installing the Stereolabs ZED SDK version 2.8.4"
echo "Installer will be placed in ~/ZED unless specified on command line"
echo " "
DEFAULTDIR=~/ZED
CLDIR="$1"
if [ ! -z "$CLDIR" ]; then 
 DEFAULTDIR=~/"$CLDIR"
fi
mkdir -p "$DEFAULTDIR"
cd "$DEFAULTDIR"

wget https://stereolabs.sfo2.digitaloceanspaces.com/zedsdk/2.8/ZED_SDK_JP4.2_v2.8.4c.run
chmod +x ZED_SDK_JP4.2_v2.8.4c.run
./ZED_SDK_JP4.2_v2.8.4c.run
