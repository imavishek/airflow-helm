#!/bin/bash

IMAGE=${1:-airflow}
TAG=${2:-latest}

ENVCONFIG=$(minikube docker-env)
if [ $? -eq 0 ]; then
  eval $ENVCONFIG
fi

# Remove if any temp directory exits
rm -rf .tmp/

# Create a tmp directory and cd to the directory
mkdir -p .tmp && cd .tmp

# Clone the airflow from github and cd to docker-airflow
git clone https://github.com/puckel/docker-airflow.git
cd docker-airflow

# Build the airflow docker image with extra kubernetes dependencies
docker build --build-arg PYTHON_DEPS="Flask-OAuthlib" --build-arg AIRFLOW_DEPS="kubernetes" --tag=${IMAGE}:${TAG} .

# Delete the temp directory
cd ../..
rm -rf .tmp/