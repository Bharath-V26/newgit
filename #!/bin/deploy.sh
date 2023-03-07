#!/bin/bash

# set the working directory to the directory of this script
cd "$(Dockerfile "$0")"

# pull the latest changes from the git repository
git pull

# build the docker image
docker build -t my-web-server .

# stop and remove the existing container (if it exists)
docker stop my-web-server-container
docker rm my-web-server-container

# run the new container
docker run -d --name my-web-server-container -p 80:80 my-web-server
