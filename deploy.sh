#!/bin/bash
set -e
docker build -t  redm1ne ./redmine
docker tag redm1ne ivkosarev/redm1ne:latest

echo $my_passwd_docker | docker login --username ivkosarev --password-stdin

docker push ivkosarev/redm1ne:latest

if [ $? -eq 0 ]
then
  echo "Build Successfully Pushed!"
else
  echo "Something went wrong" >&2
fi
