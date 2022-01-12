#!/bin/sh

# Starts and enters the cs300 development environment

. ./env.sh # load variables

if_container_created() {
    [ $( docker ps -a | grep $CONTAINER_NAME | wc -l ) -gt 0 ] # tests whether a container called $CONTAINER_NAME exists
}

start_container() {
    echo "starting container..."
    docker start $CONTAINER_NAME                # ensure container has started
    docker exec -it $CONTAINER_NAME /bin/bash   # enter the container!
    docker stop $CONTAINER_NAME                 # upon exiting the terminal, kill this container
}

create_and_start_container() {
    echo "starting container for the first time..."

    # configurations:
    # --name        set container name to value stored in var $CONTAINER_NAME
    # --platform    specify container's architecture to be x86-64
    # -v            make the current directory visible inside the container
    # -it           access this container via the terminal
    docker run --name $CONTAINER_NAME \
            --platform linux/amd64 \
            -v "$(pwd):/home/cs300-user/cs300" \
            -it \
            $IMG_NAME

    docker stop $CONTAINER_NAME             # upon exiting the terminal, kill this container
}

# creates and starts dev-environment container if it has not been created,
# or (re)starts the dev environment.
if_container_created && start_container || create_and_start_container