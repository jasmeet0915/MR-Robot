#!/bin/bash

# Map host's display socket to docker
DOCKER_ARGS+=("-v $HOME/.Xauthority:/home/admin/.Xauthority:rw")
DOCKER_ARGS+=("-e DISPLAY")
DOCKER_ARGS+=("-e NVIDIA_VISIBLE_DEVICES=all")
DOCKER_ARGS+=("-e NVIDIA_DRIVER_CAPABILITIES=all")
DOCKER_ARGS+=("-e LIBGL_ALWAYS_SOFTWARE=1") 

xhost +local:root
image_name="mr_robot_docker"
container_name="mr_robot_docker_build"

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
        --runtime nvidia \
        --workdir /workspaces/mr_robo_ws \
        $@ \
        "$image_name":1.0 \
        /bin/bash
fi