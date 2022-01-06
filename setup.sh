#!/bin/sh

# Helper script to install dependencies neccessary for project development.

set -e

echo "Updating package index..."
apt-get update

echo "Installing must-have dependencies..."
apt-get install -y \
	git \
	build-essential \
	gdb

echo "All dependencies installed!"