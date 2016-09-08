#!/bin/bash

# Checkout code
git clone https://github.com/karrung/cicd-lab.git
cd cicd-lab

# Make directory prepare for docker volume assets
mkdir -p ./assets/gitlab
mkdir -p ./assets/jenkins_home
mkdir -p ./assets/postgresql
mkdir -p ./assets/redis

# Set docker insecure-registry pull/push mode
sudo echo 'DOCKER_OPTS="--insecure-registry 192.168.1.200:5000"'
sudo service docker restart
