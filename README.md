# installRACECARJ

<em>Dec 28, 2019</em>
Update scripts for Jetpack 4.3 L4T 32.3.1.
- update to ROS Melodic
- Update ZED driver 

<em>Dec 22, 2019</em>

Scripts in this repository will install ROS and the MIT RACECAR packages on a NVIDIA Jetson Development Kit.

This version is for L4T 28.3.1. The scripts assume that the Jetson has been freshly flashed with L4T 28.3.1 using JetPack 3.3.1.


<em>Note that this repository is currently under heavy development, and is subject to change soon.
</em>

### Installation

First, clone the repository and switch to the repository directory:
```
$ git clone https://github.com/gwwang16/installRACECARJ.git
$ cd installRACECARJ
```

Next, install the appropriate ZED camera driver for the Jetson in use. If possible, plug the ZED camera into the RACECAR/J USB hub (in one of the FAST ports, they are full speed USB 3.0). If the ZED is present during installation, the ZED driver installer will download the cameras’ calibration file. To install the Jetson TX2 driver for example:

```
$ cd JetsonTX2
$ ./installZED-SDK-TX2.sh
```

Then, return to the installRACECARJ directory:

```
$ cd ..
```

We’re now ready to install the Robot Operating System (ROS) software and the rest of the RACECAR/J software stack. The installation script does the following:

- L4T 28.1 does not have a cdc-acm driver. The script installs a pre-built cdc-acm driver. The driver expects a stock kernel (4.4.38-tegra)

- Because the electronic speed controller and the IMU both report as ttyACM, a udev rule is installed which names them as vesc and imu respectively.

- ROS is configured and rosbase is installed

- One of the dependencies is missing in the package specifications, so ros-melodic-opencv3 is installed.

- The MIT RACECAR packages are installed, which includes the ZED v2.2.x ROS wrapper.

**To start the installation**

-------

### use installMITRACECAR.sh for earlier 4.X version VESC hardware

```
$ ./installMITRACECARVESC6.sh
```

The directory ‘~/racecar-ws’ is the default workspace directory name; it can be specified on the command line after the script name. Because there is such a large amount of messages during installation, you may want to log everything to a log file:

```
$ ./installMITRACECARVESC6.sh |& tee softinstall.log
```

The log will be placed in the file `softinstall.log` for review. This is useful in case there are installation issues.

After all these finished, you might want to reboot your device to make these settings work.

```
sudo shutdown -r now
```

### Note
Worth noting is that the scripts also set up two environment variables in the .bashrc, namely ROS_MASTER_URI and ROS_IP. These are placeholders, you should replace them with values appropriate to your network layout. Also, while the normal ROS setup.bash is sourced, you may want to source the devel/setup.bash of your workspace.

You will need to modify these environment variables to match your needs and network layout.

### Release Notes

Dec. 2019
* update ZED driver
* modify ROS source to Chinese mirror

January 2018
Initial Release
* L4T 28.1 (JetPack 3.1)
* CUDA 8.0
* cuDNN 6.0.12
* OpenCV4Tegra 2.4.13


