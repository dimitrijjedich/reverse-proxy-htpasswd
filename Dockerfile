FROM nginx:latest

USER root

RUN apt-get update && \
    apt-get install -y apache2-utils && \
    rm -rf /var/lib/apt/lists/* && \
    chown -R nginx:nginx /var/cache/nginx && \
    touch /var/run/nginx.pid && \
    chown nginx:nginx /var/run/nginx.pid

USER nginx
