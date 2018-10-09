#!/bin/sh

LICENSE=https://letsencrypt.org/documents/LE-SA-v1.2-November-15-2017.pdf
ACCOUNT_KEY=/etc/ssl/acme/account.pem

acme-client -a ${LICENSE} -Nnvv -f ${ACCOUNT_KEY} ${DOMAIN} && renew=1
[ "$renew" = 1 ] && [ ! $1 ] && nginx -s reload
