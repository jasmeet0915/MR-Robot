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

Clone MR. Robot repository into cd catkin_ws/src/

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

<p align="right">(<a href="#readme-top">back to top</a>)</p>

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

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## Depth Sensor Setup


### PointCloud2

A point cloud is essentially a huge collection of tiny individual points plotted in 3D space. It’s made up of a multitude of points captured using a 3D laser scanner. If you’re scanning a building, for example, each virtual point would represent a real point on the wall, window, stairway, metalwork  or any surface the laser beam comes into contact with.

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
git clone git@github.com:OpenKinect/libfreenect.git

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
git clone git@github.com:ros-drivers/freenect_stack.git
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
On Rviz add __PointCloud2__ and change topic to __/kinect/depth/points__

Now change Fixed Frame in __Rviboot order mai ubuntu haz__: __map__ to __odom__
          __!!!Hola depth camera working!!!__

<p align="right">(<a href="#readme-top">back to top</a>)</p>


### Octomapping

The OctoMap library implements a 3D occupancy grid mapping approach, providing data structures and mapping algorithms in C++ particularly suited for robotics. The map implementation is based on an octree and is designed to meet the following requirements:

__Full 3D model:__ The map is able to model arbitrary environments without prior assumptions about it. The representation models occupied areas as well as free space. Unknown areas of the environment are implicitly encoded in the map. While the distinction between free and occupied space is essential for safe robot navigation, information about unknown areas is important, e.g., for autonomous exploration of an environment.


__Updatable:__ It is possible to add new information or sensor readings at any time. Modeling and updating is done in a probabilistic fashion. This accounts for sensor noise or measurements which result from dynamic changes in the environment, e.g., because of dynamic objects. Furthermore, multiple robots are able to contribute to the same map and a previously recorded map is extendable when new areas are explored.


__Flexible:__ The extent of the map does not have to be known in advance. Instead, the map is dynamically expanded as needed. The map is multi-resolution so that, for instance, a high-level planner is able to use a coarse map, while a local planner may operate using a fine resolution. This also allows for efficient visualizations which scale from coarse overviews to detailed close-up views.


__Compact:__ The map is stored efficiently, both in memory and on disk. It is possible to generate compressed files for later usage or convenient exchange between robots even under bandwidth constraints.


<p align="right">(<a href="#readme-top">back to top</a>)</p>

__Install Octomap__
```sh
sudo apt-get install ros-noetic-octomap ros-noetic-octomap-mapping ros-noetic-octomap-msgs ros-noetic-octomap-ros ros-noetic-octomap-rviz-plugins ros-noetic-octomap-server
```
__Octomap dependencies__

```sh
cd
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

in __line_14__ __odom_combined__ --> __odom__
in __line_20__ __/narrow_stereo/points_filtered2__ --> __/kinect/depth/points__

### 

Run 
```sh
roslaunch octomap_server octomap_mapping.launch
```
###

Now on Rviz add __MarkerArray__ and change topic to __/occupied_cells_vis_array__

<p align="right">(<a href="#readme-top">back to top</a>)</p>

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

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## Saving the new map

Now that we have created a new map, we need to save it to be able to use it in future. Open a new terminal in the maps directory inside the mr_robot_nav package and execute the following command there :

```sh
rosrun octomap_server octomap_saver -f custom_map.bt
```

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- CONTRIBUTING -->
## Contributing

Contributions are what make the open source community such an amazing place to learn, inspire, and create. Any contributions you make are **greatly appreciated**.

If you have a suggestion that would make this better, please fork the repo and create a pull request. You can also simply open an issue with the tag "enhancement".
Don't forget to give the project a star! Thanks again!

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

For more info refer to [contributing.md](https://github.com/atom-robotics-lab/MR-Robot/blob/main/contributing.md)
<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- CONTACTS -->
## Contacts

Our Socials - [Linktree](https://linktr.ee/atomlabs) - atom@inventati.org

Demo: [Video]("")

<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- ACKNOWLEDGMENTS-->
## Acknowledgement

* [Our wiki](https://atom-robotics-lab.github.io/wiki)
* [ROS Official Documentation](http://wiki.ros.org/Documentation)
* [Opencv Official Documentation](https://docs.opencv.org/4.x/)
* [Rviz Documentation](http://wiki.ros.org/rviz)
* [Gazebo Tutorials](https://classic.gazebosim.org/tutorials)
* [Ubuntu Installation guide](https://ubuntu.com/tutorials/install-ubuntu-desktop#1-overview)
* [Raspberrypi Documentation](https://www.raspberrypi.com/documentation/)
* [Esp32 Documentation](https://docs.espressif.com/projects/esp-idf/en/latest/esp32/)
* [Blender Documentaion](https://docs.blender.org/)

<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->
[contributors-shield]: https://img.shields.io/github/contributors/atom-robotics-lab/MR-Robot.svg?style=for-the-badge
[contributors-url]: https://github.com/atom-robotics-lab/MR-Robot/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/atom-robotics-lab/MR-Robot.svg?style=for-the-badge
[forks-url]: https://github.com/atom-robotics-lab/wiki/network/members
[stars-shield]: https://img.shields.io/github/stars/atom-robotics-lab/MR-Robot.svg?style=for-the-badge
[stars-url]: https://github.com/atom-robotics-lab/wiki/stargazers
[issues-shield]: https://img.shields.io/github/issues/atom-robotics-lab/MR-Robot.svg?style=for-the-badge
[issues-url]: https://github.com/atom-robotics-lab/MR-Robot/issues
[linkedin-shield]: https://img.shields.io/badge/-LinkedIn-black.svg?style=for-the-badge&logo=linkedin&colorB=555
[linkedin-url]: https://www.linkedin.com/company/a-t-o-m-robotics-lab/

