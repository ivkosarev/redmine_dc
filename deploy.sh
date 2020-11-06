#!/bin/bash
set -e
docker build -t  redm1ne ./redmine
docker tag redm1ne ivkosarev/redm1ne:latest

docker login --username ivkosarev -p 9f2d46ec-251b-46e9-89ef-619d99477ef4

docker push ivkosarev/redm1ne:latest

if [ $? -eq 0 ]
then
  echo "Buil Successfully Pushed!"
else
  echo "something went wrong" >&2
fi