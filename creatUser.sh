#!/bin/bash
docker exec -u root -it reverse-proxy htpasswd -c /etc/nginx/.htpasswd $1
