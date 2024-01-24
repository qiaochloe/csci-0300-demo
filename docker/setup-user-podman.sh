#!/bin/bash

target_user="$1"

# set up passwordless sudo for user cs300-user
useradd -m -s /bin/bash $target_user && \
    echo "$target_user ALL=(ALL:ALL) NOPASSWD: ALL" > /etc/sudoers.d/cs300-init
