FROM osrf/ros:noetic-desktop-full

SHELL ["/bin/bash","-c"]

RUN echo "source /opt/ros/noetic/setup.bash" >> ~/.bashrc
RUN echo "source /workspaces/mr_robo_ws/devel/setup.bash" >> ~/.bashrc
RUN echo "source /usr/share/gazebo-11/setup.sh" >> ~/.bashrc
RUN echo "export LIBGL_ALWAYS_SOFTWARE=1" >> ~/.bashrc


RUN apt-get update

RUN apt-get install --no-install-recommends -yqqq \
    python3-pip 

RUN pip3 install ultralytics 
RUN apt-get install --no-install-recommends -yqqq \
    tmux \
    libfreenect-dev
     

RUN apt-get install --no-install-recommends -yqqq \
    ros-noetic-turtlebot3-gazebo\
    ros-noetic-turtlebot3-description\
    ros-noetic-turtlebot3-navigation\
    ros-noetic-ros-control \
    ros-noetic-gazebo-ros-pkgs \
    libopencv-dev \ 
    python3-opencv \
    ros-noetic-map-server \
    ros-noetic-move-base \
    ros-noetic-amcl \
    libgazebo11-dev \
    ros-noetic-rgbd-launch  

RUN mkdir -p /workspaces/mr_robo_ws/src

RUN rm -rf /var/lib/apt/lists/* \
&& apt-get clean

CMD ["sleep", "infinity"]