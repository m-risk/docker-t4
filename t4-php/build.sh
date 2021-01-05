#!/bin/bash

git add *
git commit -m "latest"

docker build -t docker.pkg.github.com/m-risk/docker-t4/t4-php:latest .
docker push docker.pkg.github.com/m-risk/docker-t4/t4-php:latest

git tag latest

git push origin main --tags

