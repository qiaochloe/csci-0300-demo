#!/bin/bash

target_user="$1"

# set up passwordless sudo for user cs300-user
useradd -m -s /bin/bash cs300-user && \
    echo "cs300-user ALL=(ALL:ALL) NOPASSWD: ALL" > /etc/sudoers.d/cs300-init
