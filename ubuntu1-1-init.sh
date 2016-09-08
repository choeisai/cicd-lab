#!/bin/bash

# Make directory prepare for docker volume assets
mkdir -p ./assets/gitlab
mkdir -p ./assets/jenkins_home
mkdir -p ./assets/postgresql
mkdir -p ./assets/redis
chmod 777 ./assets/*

# Set docker insecure-registry pull/push mode
echo '{ "insecure-registries":["192.168.1.200:5000"] }' > /etc/docker/daemon.json
service docker restart
