#!/bin/sh
host=${NGINX_HOST:-localhost}
data_root=${NGINX_DATA_ROOT:-/usr/share/nginx/html}

cat /symfony-fpm.conf | \
  sed -e "s/%%NGINX_HOST%%/$host/g" | \
  sed -e "s#%%NGINX_DATA_ROOT%%#$data_root#g" | \
  sed -e "s/%%fpm-ip%%/$FPM_PORT_9000_TCP_ADDR/g" | \
  sed -e "s/%%fpm-port%%/$FPM_PORT_9000_TCP_PORT/g" > \
  /etc/nginx/conf.d/symfony.conf

nginx -g "daemon off;"
