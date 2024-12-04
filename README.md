# Alpine :: SSH proxy via sshpiperd
![size](https://img.shields.io/docker/image-size/coralhl/sshpiper/1.4.4?color=0eb305) ![version](https://img.shields.io/docker/v/coralhl/sshpiper?color=eb7a09) ![pulls](https://img.shields.io/docker/pulls/coralhl/sshpiper?color=2b75d6) ![activity](https://img.shields.io/github/commit-activity/m/coralhl/sshpiper-docker?color=c91cb8) ![commit-last](https://img.shields.io/github/last-commit/coralhl/sshpiper-docker?color=c91cb8)

Run a SSH proxy based on Alpine Linux. Small, lightweight, secure and fast

## Run
```shell
docker run --name sshpiper \
  -d coralhl/sshpiper \
  -v /opt/docker/sshpiper/sshpiper.yaml:/sshpiperd/sshpiper.yaml \
  -p 2222:2222 \
  -e TZ=Europe/Moscow \
  sshpiperd --log-level=trace yaml --config /sshpiperd/sshpiper.yaml 
```

docker-compose.yml
```yaml
services:
  sshpiper:
    image: coralhl/sshpiper
    container_name: sshpiper
    restart: unless-stopped
    command: sshpiperd --log-level=trace yaml --config /sshpiperd/sshpiper.yaml
    environment:
      TZ: Europe/Moscow 
    ports:
      - 2222:2222
    volumes:
      - /opt/docker/sshpiper/sshpiper.yaml:/sshpiperd/sshpiper.yaml
```

## Defaults
| Parameter | Value | Description |
| --- | --- | --- |
| `user` | docker | user docker |
| `uid` | 1000 | user id 1000 |
| `gid` | 1000 | group id 1000 |
| `home` | /sshpiperd | home directory of user docker |

## Environment
| Parameter | Value | Default |
| --- | --- | --- |
| `SSHPIPERD_SERVER_KEY` | ed25519 server key | /etc/ssh/ssh_host_ed25519_key |

## Built with
* [sshpiper](https://github.com/tg123/sshpiper)
* [docker-sshpiper](https://github.com/11notes/docker-sshpiper)
* [Alpine Linux](https://alpinelinux.org/)

## Tips
* Only use rootless container runtime (podman, rootless docker)
* If using the yaml plugin, make sure your yaml file has permissions 600
* Don't bind to ports < 1024 (requires root), use NAT/reverse proxy (haproxy, traefik, nginx)