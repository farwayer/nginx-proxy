## nginx-proxy

[![Docker Build Status](https://img.shields.io/docker/build/farwayer/nginx-proxy.svg)](https://hub.docker.com/r/farwayer/nginx-proxy/) [![MicroBadger Size](https://img.shields.io/microbadger/image-size/farwayer/nginx-proxy.svg)](https://hub.docker.com/r/farwayer/nginx-proxy/)

Simple out-of-the-box nginx proxy with **Let's Encrypt** integration:

- auto request and renew https certificate
- **http** and **websocket** upstream support
- simple configuration with envs
- **A+** [ssllabs](https://www.ssllabs.com/ssltest/) rating
- based on [alpine](https://alpinelinux.org/) and very small (~8Mb)
- http->https redirect and upstream keepalive

## How to use

### envs

- `DOMAINS` (required)
- `UPSTREAM` (default `api:8080`)

### docker

```bash
docker run -it -p 80:80 -p 443:443 \
 -e DOMAINS=domain.com,www.domain.com,my.domain.com -e UPSTREAM=1.2.3.4:8080 \
 farwayer/nginx-proxy 
```

### docker-compose

```yaml
  version: '2'
  
  services:
    api:
      image: ... 
  
    proxy:
      image: farwayer/nginx-proxy:1.0.0
      depends_on: [api]
      ports: ['80:80', '443:443']
      environment:
        - DOMAINS=domain.com,www.domain.com,my.domain.com # required
        - UPSTREAM=api:1234 # api:8080 by default 
```
