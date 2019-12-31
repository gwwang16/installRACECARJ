#!/bin/bash
# Install the MIT RACECAR software
# This is for NVIDIA Jetson L4T 28.3
# This will install the whole software stack for the MIT RACECAR
# Includes ROS installation

# Install ZED driver
# ./scripts/installZED-SDK-TX2.sh

# L4T 28.3 does not have a cdc-acm driver
./scripts/installCDCACM.sh
# Setup the UDEV rules for the ESC and IMU
./scripts/installRACECARUdev.sh
# Install ROS
./scripts/installROS.sh
# Then setup the Catkin Workpsace for the RACECAR
./scripts/setupCatkinWorkspace.sh racecar-ws
# One of the dependencies is missing, opencv3 for ros
sudo apt-get install ros-kinetic-opencv3 -y
# And now install the MIT RACECAR packages
./scripts/installMITRACECAR.sh racecar-ws
# Print out a little info at the end
./scripts/echoInfo.sh
echo "The RACECAR Packages should now be installed in the directory racecar-ws"
echo " " 



