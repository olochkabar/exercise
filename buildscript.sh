#!/bin/bash


#if any command fails, the script would exit immediately and any unset variables 
set  -eou pipefail


# To take version as input
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <new-version>"
    exit 1
fi

#variables
IMAGE_NAME="oluapp"
IMAGE_VERSION=$1
DOCKERHUB_USERNAME="olochkabar"


# build the docker image
sudo docker build -t $IMAGE_NAME:$IMAGE_VERSION .

# login to your dockerhub account
cat ~/dockerpwd.txt | sudo docker login -u $DOCKERHUB_USERNAME --password-stdin


# use the docker tag command to give the image a new name
sudo docker tag $IMAGE_NAME:$IMAGE_VERSION $DOCKERHUB_USERNAME/$IMAGE_NAME:$IMAGE_VERSION


# push the image to your docker hub repository
sudo docker push $DOCKERHUB_USERNAME/$IMAGE_NAME:$IMAGE_VERSION

#version output for later use
echo “Version $IMAGE_VERSION of $IMAGE_NAME successfully published and ready for use”