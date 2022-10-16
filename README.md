<!-- Improved compatibility of back to top link: See: https://github.com/othneildrew/Best-README-Template/pull/73 -->
<a name="readme-top"></a>
<!--
*** Thanks for checking out the Best-README-Template. If you have a suggestion
*** that would make this better, please fork the repo and create a pull request
*** or simply open an issue with the tag "enhancement".
*** Don't forget to give the project a star!
*** Thanks again! Now go create something AMAZING! :D
-->



<!-- PROJECT SHIELDS -->
<!--
*** I'm using markdown "reference style" links for readability.
*** Reference links are enclosed in brackets [ ] instead of parentheses ( ).
*** See the bottom of this document for the declaration of the reference variables
*** for contributors-url, forks-url, etc. This is an optional, concise syntax you may use.
*** https://www.markdownguide.org/basic-syntax/#reference-style-links
-->
[![Contributors][contributors-shield]][contributors-url]
[![Forks][forks-shield]][forks-url]
[![Stargazers][stars-shield]][stars-url]
[![Issues][issues-shield]][issues-url]
[![LinkedIn][linkedin-shield]][linkedin-url]



<!-- PROJECT LOGO -->
<br />
<div align="center">
  <a href="https://github.com/atom-robotics-lab/assets/blob/main/logo_1.png?raw=true">
    <img src="https://github.com/atom-robotics-lab/assets/blob/main/logo_1.png?raw=true" alt="Logo" width="120" height="120">
  </a>

<h3 align="center">MR Robot</h3>

  <p align="center">
    This is the repo for the <a href="https://github.com/atom-robotics-lab/MR-Robot">MR-Robot: ModulaR Robot</a> Project, Mr robot is autonomous navigation robot made by A.T.O.M Robotics capable of doing multiple day to day operations such as mapping, navigation for transportation, sanitaion etc. Various other operations can also be performed thanks to its modularity.
    If you’re interested in helping to improve our Project</a>, find out how to <a href="https://github.com/atom-robotics-lab/MR-Robot/blob/main/contributing.md">contribute<a>. 
    <br />
    <a href=""><strong>Demo video »</strong></a>
    <br />
    <br />
    <a href="https://github.com/atom-robotics-lab/MR-Robot/issues/new?labels=bug&assignees=jasmeet0915,Kartik9250,insaaniManav,namikxgithub">Report Bug</a>
    ·
    <a href="https://github.com/atom-robotics-lab/MR-Robot/issues/new?labels=enhancement&assignees=jasmeet0915,Kartik9250,insaaniManav,namikxgithub">Request Feature</a>
  </p>
</div>


<!-- TABLE OF CONTENTS -->
<details>
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#about-the-project">About The Project</a>
      </li>
      <li>      
      <a href="#installation">INSTALLATION</a>      
      <ul>        
        <li><a href="#mr-robot-setup">MR Robot setup</a></li>
        <li><a href="#gazebo-setup">Gazebo Setup</a></li>           
       </ul>
       </li>
       <li>
       <a href="#depth-sensor-setup">Depth Sensor Setup</a>
       <ul>
       <li><a href="#pointcloud2">PointCloud2</a></li>
       <li><a href="#octomapping">Octomapping</a></li>       
        </ul>
        </li>
        <li>
        <a href="#creating-map">Creating map</a>
        </li>
        <li>
        <a href="#saving-the-new-map">Saving the new map</a>
        </li>        
    </li>
  </ol>
</details>



<!-- ABOUT THE PROJECT -->
## About The Project

This is the repo for the <a href="https://github.com/atom-robotics-lab/MR-Robot">MR-Robot: ModulaR Robot</a> Project, Mr robot is autonomous navigation robot made by A.T.O.M Robotics capable of doing multiple day to day operations such as mapping, navigation for transportation, sanitaion etc. Various other operations can also be performed thanks to its modularity.
If you’re interested in helping to improve our Project</a>, find out how to <a href="https://github.com/atom-robotics-lab/MR-Robot/contributing.md">contribute<a>.   

<p align="right">(<a href="#readme-top">back to top</a>)</p>



### Built With

* [![ROS](https://img.shields.io/badge/ros-%230A0FF9.svg?style=for-the-badge&logo=ros&logoColor=white)](https://www.sphinx-docs.org)
* [![OpenCV](https://img.shields.io/badge/opencv-%23white.svg?style=for-the-badge&logo=opencv&logoColor=white)](https://opencv.org/)
* [![Blender](https://img.shields.io/badge/blender-%23F5792A.svg?style=for-the-badge&logo=blender&logoColor=white)](https://www.blender.org/)
* [![Raspberry Pi](https://img.shields.io/badge/-RaspberryPi-C51A4A?style=for-the-badge&logo=Raspberry-Pi)](https://www.raspberrypi.org/)
* [![Espressif](https://img.shields.io/badge/espressif-E7352C?style=for-the-badge&logo=espressif&logoColor=white)](https://www.espressif.com/)
* [![Arduino](https://img.shields.io/badge/Arduino-00979D?style=for-the-badge&logo=Arduino&logoColor=white)](https://www.arduino.cc/)
* [![Ubuntu](https://img.shields.io/badge/Ubuntu-E95420?style=for-the-badge&logo=ubuntu&logoColor=white)](https://ubuntu.com/)
* [![Python](https://img.shields.io/badge/Python-3776AB?style=for-the-badge&logo=python&logoColor=white)](https://www.python.org/)

<p align="right">(<a href="#readme-top">back to top</a>)</p>



# INSTALLATION

## MR Robot setup

Clone MR. RObot repository into cd catkin_ws/src/

```sh
cd ~/catkin_ws/src
git@github.com:atom-robotics-lab/MR-Robot.git

```

Now we will use catkin make command to get the ROS on our system to recognise the examples.
```sh
cd ..
catkin_make
```

Source the setup file in newly created ‘devel’ directory so that our ROS environment can recognise the launch files.
```sh
source devel/setup.sh
```

## Gazebo Setup

__Edit your bashrc file__

__Now we need to setup the TurtleBot3-Gazebo package__

Execute the following command to install the turtlebot3-gazebo package

```sh
sudo apt install ros-noetic-turtlebot3-gazebo
```

You need to add these lines in your bashrc file to path MR-robot in gazebo.
To open your bashrc file

```sh
nano ~/.bashrc
```

```sh
export GAZEBO_MODEL_PATH=$GAZEBO_MODEL_PATH:$HOME/catkin_ws/src/MR-Robot/mr_robot_gazebo/models
```

```sh
source ~/.bashrc
```


 Now to launch your world in gazebo 
 ```sh
 roslaunch mr_robot_gazebo turtlebot3_house.launch 
```

## Depth Sensor Setup


### PointCloud2

To 
As always, start with an update and upgrade.
```sh

sudo apt-get update
sudo apt-get upgrade

```


Install the dependencies

```sh

sudo apt-get install git-core cmake freeglut3-dev pkg-config build-essential libxmu-dev libxi-dev libusb-1.0-0-dev

```
```sh
sudo apt install ros-noetic-rgbd-launch
```


Get the libfreenect repository from GitHub

```sh
cd
git clone https://github.com/OpenKinect/libfreenect

```

Make and install

```sh
cd libfreenect
mkdir build
cd build
cmake -L ..
make
sudo make install
sudo ldconfig /usr/local/lib64/

```

To use kinect without sudoing every time

```sh

sudo adduser $USER video
sudo adduser $USER plugdev

```


Next we will add some device rules

```sh
sudo nano /etc/udev/rules.d/51-kinect.rules

```


Paste the following and ctrl-o, enter, ctrl+x to save file
 ```sh
 # ATTR{product}=="Xbox NUI Motor"
SUBSYSTEM=="usb", ATTR{idVendor}=="045e", ATTR{idProduct}=="02b0", MODE="0666"
# ATTR{product}=="Xbox NUI Audio"
SUBSYSTEM=="usb", ATTR{idVendor}=="045e", ATTR{idProduct}=="02ad", MODE="0666"
# ATTR{product}=="Xbox NUI Camera"
SUBSYSTEM=="usb", ATTR{idVendor}=="045e", ATTR{idProduct}=="02ae", MODE="0666"
# ATTR{product}=="Xbox NUI Motor"
SUBSYSTEM=="usb", ATTR{idVendor}=="045e", ATTR{idProduct}=="02c2", MODE="0666"
# ATTR{product}=="Xbox NUI Motor"
SUBSYSTEM=="usb", ATTR{idVendor}=="045e", ATTR{idProduct}=="02be", MODE="0666"
# ATTR{product}=="Xbox NUI Motor"
SUBSYSTEM=="usb", ATTR{idVendor}=="045e", ATTR{idProduct}=="02bf", MODE="0666"
```


Now we will download the required ROS package.

```cd
cd ~/catkin_ws/src
git clone https://github.com/ros-drivers/freenect_stack.git
```


Now we will use catkin make command to get the ROS on our system to recognise the examples.
```sh
cd ..
catkin_make
```


Source the setup file in newly created ‘devel’ directory so that our ROS environment can recognise the launch files.
```sh
source devel/setup.sh
```

Now run these comands to get depth image on rviz and change fixed frame from map to camera_link


```sh
 roslaunch mr_robot_gazebo turtlebot3_house.launch 
```
```sh
roslaunch freenect_launch freenect.launch depth_registration:=true

```
Now change Fixed Frame in __Rviz__: __map__ to __odom__
          __!!!Hola depth camera working!!!__

### Octomapping

__Install Octomap__
```sh
sudo apt-get install ros-noetic-octomap ros-noetic-octomap-mapping ros-noetic-octomap-msgs ros-noetic-octomap-ros ros-noetic-octomap-rviz-plugins ros-noetic-octomap-server
```
__Octomap dependencies__

```sh
git clone git@github.com:OctoMap/octomap.git
cd octomap
mkdir build
cd build
cmake ..
make
```

Clone kinetic-devel branch of octomapping

```sh
cd ~/catkin_ws/src
git clone git@github.com:OctoMap/octomap_mapping.git
cd ..
catkin_make
```
Now go to directory __octomap_mapping/octomap_server/launch__ and open __octomapping.launch__ and change following lines:

in line 14 odom_combined --> odom
in line 20 /narrow_stereo/points_filtered2 --> /kinect/depth/points

### 

Run 
```sh
roslaunch octomap_server octomap_mapping.launch
```
###

Now on Rviz add __MarkerArray__ and change topic to __/occupied_cells_vis_array__


## Creating map

Install Teleop-twist-keyboard

```sh
sudo apt install ros-noetic-teleop-twist-keyboard
```

Now navigate bot in gazebo using teleop twist keyboard 

```sh
rosrun teleop_twist_keyboard teleop_twist_keyboard.py 

``` 
this will create your map

## Saving the new map

Now that we have created a new map, we need to save it to be able to use it in future. Open a new terminal in the maps directory inside the mr_robot_nav package and execute the following command there :

```sh
rosrun octomap_server octomap_saver -f custom_map.bt
```



