#!/bin/sh

docker run --name reviews -p 8082:8082 --link ratings -e 'ENABLE_RATINGS=true' -e 'RATINGS_SERVICE=http://ratings:8080' reviews

docker run --name productpage -p 8083:8083 --link details -e 'DETAILS_HOSTNAME=http://details:8081' --link ratings -e 'RATINGS_HOSTNAME=http://ratings:8080' --link reviews -e 'REVIEWS_HOSTNAME=http://reviews:8082' productpage