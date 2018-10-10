#!/bin/sh

nginx
/etc/periodic/weekly/acme.sh init
nginx -s stop
crond
mv /etc/nginx/conf.d/proxy.conf.disabled /etc/nginx/conf.d/proxy.conf
sed -i "s/UPSTREAM/${UPSTREAM:-api:8080}/" /etc/nginx/conf.d/proxy.conf
nginx -g "daemon off;"
