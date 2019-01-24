#!/bin/bash

docker container prune -f
docker volume prune -f
docker network prune -f
docker system prune -f

ssh docker101 docker container prune -f
ssh docker101 docker volume prune -f
ssh docker101 docker network prune -f
ssh docker101 docker system prune -f

ssh docker102 docker container prune -f
ssh docker102 docker volume prune -f
ssh docker102 docker network prune -f
ssh docker102 docker system prune -f

ssh docker103 docker container prune -f
ssh docker103 docker volume prune -f
ssh docker103 docker network prune -f
ssh docker103 docker system prune -f

ssh docker104 docker container prune -f
ssh docker104 docker volume prune -f
ssh docker104 docker network prune -f
ssh docker104 docker system prune -f

ssh docker105 docker container prune -f
ssh docker105 docker volume prune -f
ssh docker105 docker network prune -f
ssh docker105 docker system prune -f


echo "!!!Already clean docker swarm!!!"