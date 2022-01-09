FROM ubuntu:focal

ENV DEBIAN_FRONTEND noninteractive

# include manual pages and documentation
ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update && \
    yes | unminimize

RUN apt-get -y install \
    man \
    sudo \
    strace \
    time

RUN apt-get -y install python3

RUN apt-get -y install \
    locales

# Set locale
RUN locale-gen en_US.UTF-8  
ENV LANG en_US.UTF-8  
ENV LANGUAGE en_US:en  
ENV LC_ALL en_US.UTF-8

# Create student user
RUN useradd -m -s /bin/bash cs300-user && \
    echo "cs300-user ALL=(ALL:ALL) NOPASSWD: ALL" > /etc/sudoers.d/cs300-init

WORKDIR /home/cs300-user
CMD ["/bin/bash", "-l"]