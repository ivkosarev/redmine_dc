#!/bin/sh
set -e


GIT_VERSION=$(git describe --always --abbrev --tags --long) # Git-хэш и теги

# Сборка и тегирование образа
docker build -t  redm1ne ./redmine
docker tag redm1ne ivkosarev/redm1ne:latest

# Вход в Docker Hub и выгрузка образа
docker login --username ivkosarev -p 9f2d46ec-251b-46e9-89ef-619d99477ef4
docker push ivkosarev/redm1ne:latest

# Найти ID работающего контейнера
CONTAINER_ID=$(docker ps | grep takenote | cut -d" " -f1)

# Остановить старый контейнер, запустить новый, очистить систему
docker stop ${CONTAINER_ID}
docker run --restart unless-stopped -d -p 80:3000 redmine:${GIT_VERSION}
docker system prune -a -f
docker push 