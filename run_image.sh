#!/bin/bash

# Map host's display socket to Docker
DOCKER_ARGS+=("-v $HOME/.Xauthority:/home/admin/.Xauthority:rw")
DOCKER_ARGS+=("-e DISPLAY")
DOCKER_ARGS+=("-e LIBGL_ALWAYS_SOFTWARE=1") # Enable software rendering by default

xhost +local:root
image_name="mr_robot_docker"
container_name="mr_robot_docker_build"

# Check if NVIDIA GPU is available
if command -v nvidia-smi &>/dev/null && nvidia-smi -L &>/dev/null; then
    echo "NVIDIA GPU detected. Configuring for NVIDIA runtime..."
    DOCKER_ARGS+=("--runtime=nvidia")
    DOCKER_ARGS+=("-e NVIDIA_VISIBLE_DEVICES=all")
    DOCKER_ARGS+=("-e NVIDIA_DRIVER_CAPABILITIES=all")
else
    echo "No NVIDIA GPU detected. Configuring for software rendering..."
    DOCKER_ARGS+=("-e LIBGL_ALWAYS_SOFTWARE=1") # Ensure software rendering
fi

# Check if container is already running
if docker ps --format '{{.Names}}' | grep -q "$container_name"; then
    docker exec -it $container_name /bin/bash
else
    docker run -it --rm \
        ${DOCKER_ARGS[@]} \
        -e DISPLAY=$DISPLAY \
        -v /tmp/.X11-unix:/tmp/.X11-unix \
        -v $PWD/build_files:/workspaces/mr_robo_ws/ \
        -v $PWD:/workspaces/mr_robo_ws/src \
        -v /etc/localtime:/etc/localtime:ro \
        --name "$container_name" \
        --workdir /workspaces/mr_robo_ws \
        "$image_name":1.0 \
        /bin/bash
fi
