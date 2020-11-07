#### This repository was created by me to perform the task of deploying a container from scratch with Redmine+Puma, and also take ready-made images of Postgresql and Nginx. I also connected Travis CI to build a Redmine image and publish it to DockerHub

# To reproduce the result you need to do a few simple steps:

1. git pull
2. add folder "secret" with files:
  + database.yml -config file for Redmine that specifies how to connect to the database
  + variables.env -env for postgres with user login, password and name of DB
  + my_passwd_docker.txt -password for dokerhub login
3. bash deploy.sh
