#!/bin/sh
if [ "$(docker ps -f name=blue -q)" ]
then
    ENV="green"
    OLD="blue"
else
    ENV="blue"
    OLD="green"
fi

echo "Starting "$ENV" container"
docker-compose --project-name=$ENV up -d --build --force-recreate

echo "Waiting..."
sleep 5s

echo "Stopping "$OLD" container"
# docker-compose --project-name=$OLD down
docker rm -f $OLD"_adminer_1"
docker system prune -f
docker volume prune -f

docker rm -f linhtinh_adminer_1 && docker container rename blue_adminer_1 linhtinh_adminer_1

