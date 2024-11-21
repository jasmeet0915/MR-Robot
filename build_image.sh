#!/bin/bash

# Map host's display socket to docker
DOCKER_ARGS+=("-v /tmp/.X11-unix:/tmp/.X11-unix")
DOCKER_ARGS+=("-v $HOME/.Xauthority:/home/admin/.Xauthority:rw")
# DOCKER_ARGS+=("-e DISPLAY")
DOCKER_ARGS+=("-e NVIDIA_VISIBLE_DEVICES=all")
DOCKER_ARGS+=("-e NVIDIA_DRIVER_CAPABILITIES=all")
# DOCKER_ARGS+=("-e FASTRTPS_DEFAULT_PROFILES_FILE=/usr/local/share/middleware_profiles/rtps_udp_profile.xml")

xhost +local:root

image_name="mr_robot_docker"
container_name="mr_robot_docker_build"

# Initialize variables
force_option=false 
clean_option=false


# Parse options
while [[ $# -gt 0 ]]; do
  case "$1" in
    --force)
      force_option=true
      shift
      ;;

    --clean)
      clean_option=true
      shift
      ;;
      
    *)
      echo "Invalid option: $1"
      exit 1
      ;;
  esac
done


if $force_option; then
  echo "Buidling Existing Docker Image: $image_name"
  docker build -f Dockerfile -t "$image_name":1.0 .
  ./build_image.sh

else
  run_command='source /opt/ros/noetic/setup.bash && catkin_make && source devel/setup.bash && exit'

  if $clean_option; then
    run_command='source /opt/ros/noetic/setup.bash && rm -rf build devel && catkin_make && source devel/setup.bash && exit'
    echo "Force Command Enabled"

  else
    echo "Force Command Disabled"
  fi


  if docker images --format '{{.Repository}}' | grep -q "$image_name"; then

      echo "Found Docker Image: $image_name:1.0"

      echo "Updating the existing Docker image: $image_name:1.0"

      docker run -it --rm=false \
          --privileged \
          ${DOCKER_ARGS[@]} \
          -e DISPLAY=$DISPLAY \
          -v $PWD/build_files:/workspaces/mr_robo_ws/ \
          -v $PWD:/workspaces/mr_robo_ws/src \
          -v /etc/localtime:/etc/localtime:ro \
          --name "$container_name" \
          --runtime nvidia \
          --workdir /workspaces/mr_robo_ws \
          $@ \
          "$image_name":1.0 \
          bash -c "$run_command"

      docker rm "$container_name"

    #   ./run_image.sh

  else
      echo "Building a new Docker image: $image_name"
      docker build -f Dockerfile -t "$image_name":1.0 .
      ./build_image.sh 
  fi

fi