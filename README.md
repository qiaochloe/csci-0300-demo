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

Students running WeensyOS in an ARM container needs to make the following 
changes:

1. Navigate to WeensyOS project directory
2. Create `config.mk` in WeensyOS project root, if this file does not exist
	1. Set `CXX = x86_64-linux-gnu-g++-9`
3. In `build/rules.mk`, set `CCPREFIX ?= x86_64-linux-gnu-`

Note to staff: currently, `rules.mk` overwrites `config.mk` settings. Using the 
above setup, `GNUMakefile` needs to include `config.mk` after `rules.mk`, so 
that `rules.mk` does not overwrite user-specific `CXX` setting. Either update 
the above setup instructions, or make appropriate changes to the stencil code's 
`GNUMakefile`.
