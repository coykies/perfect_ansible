#!/bin/bash
# remove the ansible-test container
docker rm -f ansible-test
# clean up the system
docker system prune -f
# recreate the container (amd64)
docker run -d --name ansible-test --platform linux/amd64 debian:11 tail -f /dev/null
# install Python inside the container
docker exec ansible-test apt update && docker exec ansible-test apt install -y python3