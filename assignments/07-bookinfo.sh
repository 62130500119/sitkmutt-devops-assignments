#!/bin/sh

docker run --name reviews -p 8082:8082 --link ratings -e 'ENABLE_RATINGS=true' -e 'RATINGS_SERVICE=http://ratings:8080' reviews

docker run --name productpage -p 8083:8083 --link detail -e 'DETAILS_HOSTNAME=http://detail:8081' --link rating -e 'RATINGS_HOSTNAME=http://rating:8080' --link review -e 'REVIEWS_HOSTNAME=http://review:8082' productpage