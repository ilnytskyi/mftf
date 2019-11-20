#/bin/bash

docker stop $(docker ps -a -q)
cd docker && docker-compose up -d

#docker exec -it $(docker-compose ps | grep "application" | awk '{print $1}') bash
docker exec -it -u www-data $(docker-compose ps | grep "application" | awk '{print $1}') bash