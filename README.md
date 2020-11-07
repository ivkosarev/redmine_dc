#### This repository was created by me to perform the task of deploying a container from scratch with Redmine+Puma, and also take ready-made images of Postgresql and Nginx. I also connected Travis CI to build a Redmine image and publish it to DockerHub

# To reproduce the result you need to do a few simple steps:

1. git pull
2. Put your secrets:
  + in  redmine/database.yml insert your login and password
  + create variables.env -env for postgres with user login, password and name of DB or just edit ${VARS}
3. bash deploy.sh for build and push image to dockerhub or docker-compose up for build and run containers on your host
