#!/bin/bash

set -eu

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd)
target_user="${1:-cs300-user}"

CI_UID=1001
CI_GID=1001

# set up default locale
export LANG=en_US.UTF-8

# install clang-related packages
apt-get -y install\
 clang\
 clang-18-doc\
 lldb\
 clang-format

# Install C++ dev packages
apt-get -y install \
 cmake \
 libstdc++-14-pic \
 libstdc++-14-dev

# install qemu for WeensyOS (sadly, this pulls in a lot of crap)
apt-get -y --no-install-recommends install\
 qemu-system-x86

# install programs used for system exploration
apt-get -y install\
 blktrace\
 linux-tools-generic\
 strace\
 tcpdump

# install interactive programs (emacs, vim, nano, man, sudo, etc.)
apt-get -y install\
 bc\
 curl\
 dc\
 git\
 git-doc\
 man\
 micro\
 nano\
 psmisc\
 sudo\
 wget\
 file\
 xxd\
 hexedit\
 htop

# install rust
RUSTUP_HOME=/opt/rust CARGO_HOME=/opt/rust \
  bash -c "curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sudo -E sh -s -- -y"

# set up libraries
apt-get -y install\
 libreadline-dev\
 locales\
 wamerican\
 libssl-dev

# generate default locale
locale-gen en_US.UTF-8

# install programs used for networking
apt-get -y install\
 dnsutils\
 inetutils-ping\
 iproute2\
 net-tools\
 netcat-openbsd\
 telnet\
 time\
 traceroute

# remove unneeded .deb files
rm -r /var/lib/apt/lists/*

# Set up the container user
if [[ $target_user == "cs300-user" ]]; then
    userdel ubuntu || true
    groupdel ubuntu || true
    useradd -m -s /bin/bash $target_user

    # Also add a runner user
    groupadd -g ${CI_GID} runner
    useradd -s /bin/bash -u ${CI_UID} -g ${CI_GID} -m runner
else
    # If using the host's user, don't create one--podman will do this
    # automatically.  However, the default shell will be wrong, so set
    # a profile rule to update this
    chmod +x /etc/profile.d/20-fix-default-shell.sh # Copied in Podmanfile
fi

# set up passwordless sudo for user cs300-user
echo "${target_user} ALL=(ALL:ALL) NOPASSWD: ALL" > /etc/sudoers.d/cs300-init

if [[ $target_user == "cs300-user" ]]; then
    echo "runner ALL=(ALL:ALL) NOPASSWD: ALL" >> /etc/sudoers.d/cs300-init
fi
