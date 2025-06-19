#!/bin/bash
set -e

if [ -z "$1" ]; then
  echo "Usage: <username>"
  exit 1
fi

if docker exec reverse-proxy test -f /etc/nginx/.htpasswd; then
  docker exec -u root -it reverse-proxy htpasswd /etc/nginx/.htpasswd "$1"
else
  docker exec -u root -it reverse-proxy htpasswd -c /etc/nginx/.htpasswd "$1"
fi

echo "User '$1' added to reverse proxy"
