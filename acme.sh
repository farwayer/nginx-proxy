#!/bin/sh

acme-client MAIN_DOMAIN
[ $? = 0 ] && [ ! $1 ] && nginx -s reload
