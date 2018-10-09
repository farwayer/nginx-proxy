FROM alpine:3.8 as dhgen
RUN apk add --update --no-cache openssl
RUN openssl dhparam -dsaparam -out /dhparam.pem 2048

FROM nginx:1.15.5-alpine
LABEL maintainer="farwayer@gmail.com"
RUN apk add --update --no-cache acme-client
COPY conf.d /etc/nginx/conf.d
COPY --from=dhgen /dhparam.pem /etc/nginx
COPY acme.sh /etc/periodic/weekly
COPY start.sh /
VOLUME /etc/ssl/acme
EXPOSE 80 443
CMD ["/start.sh"]
