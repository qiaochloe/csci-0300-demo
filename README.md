# cs300: vagrant setup

This repo contains a minimal dev environment setup for CS 300.

## Getting started

1. Install docker version 4.2.0.
	- Version 4.3+ does not work, as it introduces breaking changes that break our VM setup.
2. Install vagrant.
3. Run `vagrant up --provider=docker`