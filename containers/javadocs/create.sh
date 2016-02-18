#!/bin/bash

#you can add a soecific volume to handle configuration data like so

#step 1: remove an existing container
docker rm javadocs
#step 2: create your container

docker create \
  --name javadocs \
  -h javadocs \
  -p 80:80 \
  -p 443:443 \
  --log-driver="syslog" \
  --log-opt='syslog-tag=javadocs' \
  cesi/javadocs
