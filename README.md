## nginx-proxy

![Docker Build Status](https://img.shields.io/docker/build/farwayer/nginx-proxy.svg)
![MicroBadger Size (tag)](https://img.shields.io/microbadger/image-size/farwayer/nginx-proxy.svg)

Simple out-of-box nginx proxy with **Let's Encrypt** integration:

- auto request and renew https certificate
- **http** and **websocket** upstream support
- simple configuration with envs
- **A+** [ssllabs](https://www.ssllabs.com/ssltest/) rating
- based on [alpine](https://alpinelinux.org/) and very small (~8Mb)
- http->https redirect and upstream keepalive

## How to use

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
        - DOMAIN=my-domain.com # required
        - UPSTREAM=api:1234 # api:8080 by default 
```
