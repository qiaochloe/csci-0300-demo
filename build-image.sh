#!/bin/sh

# Builds an image containing the base cs300 dev environment

. ./env.sh # load variables

docker buildx build --load -t $IMG_NAME --platform linux/amd64 .