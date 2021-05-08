FROM alpine as dhgen
RUN apk add --update --no-cache libressl
RUN libressl dhparam -dsaparam -out /dhparam.pem 4096

FROM alpine:edge
LABEL maintainer="farwayer@gmail.com"
RUN apk add -X http://dl-cdn.alpinelinux.org/alpine/edge/testing --update --no-cache acme-client nginx nginx-mod-http-brotli
COPY --from=dhgen /dhparam.pem /etc/nginx
COPY http.d /etc/nginx/http.d
COPY acme-client.conf /etc
COPY acme.sh /etc/periodic/weekly
COPY start.sh /
VOLUME /etc/ssl/acme
EXPOSE 80 443
CMD ["/start.sh"]
