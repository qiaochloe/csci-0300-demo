#!/bin/sh

# Builds an image containing the base cs300 dev environment

IMG_NAME=cs300-base-image

docker buildx build --load -t $IMG_NAME --platform linux/amd64 .