#!/bin/bash

git add *
git commit -m "latest"

docker build -t docker.pkg.github.com/m-risk/docker-t4/t4-db:latest .
docker push docker.pkg.github.com/m-risk/docker-t4/t4-db:latest

git tag latest

git push origin main --tags

