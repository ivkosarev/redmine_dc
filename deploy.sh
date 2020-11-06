#!/bin/sh
set -e


GIT_VERSION=$(git describe --always --abbrev --tags --long) # Git-хэш и теги

# Сборка и тегирование образа
docker build -t  redmine:${GIT_VERSION} ./redmine
docker tag redmine:${GIT_VERSION} redmine:latest

# Вход в Docker Hub и выгрузка образа
echo "${DOCKER_PASSWORD}" | docker login -u "${DOCKER_USERNAME}" --password-stdin
docker push redmine:${GIT_VERSION}

# Найти ID работающего контейнера
CONTAINER_ID=$(docker ps | grep takenote | cut -d" " -f1)

# Остановить старый контейнер, запустить новый, очистить систему
docker stop ${CONTAINER_ID}
docker run --restart unless-stopped -d -p 80:3000 redmine:${GIT_VERSION}
docker system prune -a -f
docker push 