# cs300: dev environment

This repo contains a minimal dev environment setup for CS 300.

## Getting started

```
# 1. build docker image locally
cd docker
./cs300-build-docker.sh

# 2. start development environment
cd ..
./start-container.sh
```

### Running WeensyOS in an ARM container

WeensyOS's build system needs to be updated to cross-compile correctly in an
ARM container. [Here](https://github.com/csci0300/cs300-s21-projects/pull/2)
is one way to update the build system.

## Credits

This setup is lightly modified based on the setup from 
[Harvard CS61](https://cs61.seas.harvard.edu/site/2021/).