#!/bin/bash

# Loop through all the directories in the current directory
for dir in */; do
    # Remove the trailing slash from the directory name
    dir=${dir%/}
    # Build the Docker image for the current directory
    IMAGE_NAME="${dir}-image"

    # Build the Docker image
    docker build -t $IMAGE_NAME $dir

    # Check if the build was successful
    if [ $? -eq 0 ]; then
        echo "Docker image $IMAGE_NAME built successfully"
    else
        echo "Docker image $IMAGE_NAME failed to build"
        exit 1
    fi
done