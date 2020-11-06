#!/bin/bash
set -e
docker build -t  redm1ne ./redmine
docker tag redm1ne ivkosarev/redm1ne:latest

docker login --username ${docker_login} --password ${docker_pass}

docker push ivkosarev/redm1ne:latest

if [ $? -eq 0 ]
then
  echo "Build Successfully Pushed!"
else
  echo "Something went wrong" >&2
fi