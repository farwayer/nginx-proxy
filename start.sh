#!/bin/sh

MAIN_DOMAIN=$(echo $DOMAINS | cut -d, -f1)
EXTRA_DOMAINS=$(echo $DOMAINS | cut -d, -f2-)
sed -i "s/MAIN_DOMAIN/$MAIN_DOMAIN/" /etc/periodic/weekly/acme.sh
sed -i "s/MAIN_DOMAIN/$MAIN_DOMAIN/" /etc/acme-client.conf
sed -i "s/EXTRA_DOMAINS/$EXTRA_DOMAINS/" /etc/acme-client.conf
sed -i "s/UPSTREAM/${UPSTREAM:-api:8080}/" /etc/nginx/http.d/proxy.conf.disabled
mkdir /var/www/acme

nginx
/etc/periodic/weekly/acme.sh init
nginx -s stop
crond

mv /etc/nginx/conf.d/proxy.conf.disabled /etc/nginx/conf.d/proxy.conf
nginx -g "daemon off;"
