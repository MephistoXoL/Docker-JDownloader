![Docker-JDownloader](https://raw.githubusercontent.com/MephistoXoL/Docker-JDownloader/master/Docker-JDownloader.png)

# Docker-JDownloader
Docker MultiArch Image JDownloader for Raspberry pi 4/3+/3/2, arm64 & amd64


[![Docker Pulls](https://img.shields.io/docker/pulls/mephistoxol/jdownloader?logo=docker)](https://hub.docker.com/r/mephistoxol/jdownloader)
[![Docker Image Version (tag latest semver)](https://img.shields.io/docker/v/mephistoxol/jdownloader/latest?logo=linux&logoColor=white)](https://hub.docker.com/r/mephistoxol/jdownloader)
[![MicroBadger Layers](https://img.shields.io/microbadger/layers/mephistoxol/jdownloader/latest)](https://hub.docker.com/r/mephistoxol/jdownloader)
[![Docker Image Size (tag)](https://img.shields.io/docker/image-size/mephistoxol/jdownloader/latest)](https://hub.docker.com/r/mephistoxol/jdownloader)
[![Docker Stars](https://img.shields.io/docker/stars/mephistoxol/jdownloader)](https://hub.docker.com/r/mephistoxol/jdownloader)
[![Paypal](https://img.shields.io/badge/paypal-donate-orange?logo=paypal)](https://www.paypal.me/mephistoxol)


The image base is ```alpine```.

Container firts run download the last JDownloader version and install it, wait a while to complete the installation (around 5 min.).

The script entrypoint.sh will check and create (when necessary) the config file where are located the MyJDownloader credentials.

You can update from WebUI.

Image exports:
- Downloads are located in /app/JDownloader/Downloads

## Environment Variables
You must to add 3 env. variables:

| Env. Variable | Description |
| --- | --- |
| DEVICENAME | your Device name |
| EMAIL | MyJDownloader Account |
| PASSWORD | MyJDownloader Password |

## Install
Command line:
```
docker run --restart=always --name jdownloader \ 
                   -e EMAIL=MyJDownloaderAccount \ 
                   -e PASSWORD=MyJDownloaderPassword \ 
                   -e DEVICENAME=yourdevicename \ 
                   -v /your/path/for/data:/app/JDownloader/Downloads \ 
                   -d mephistoxol/jdownloader
```

Docker Compose:
```
version: '3.2'
services:
  app:
    container_name: jdownloader
    image: mephistoxol/jdownloader
    restart: always
    env:
      - EMAIL=MyJDownloaderAccount
      - PASSWORD=MyJDownloaderPassword
      - DEVICENAME=yourdevicename
    ##################
    # Traefik v1.7 optional
    #labels:
    #  - traefik.enable: "false"
    #networks:      
    #  - proxy-tier
    ##################
    volumes:
      - /your/path/for/data:/app/JDownloader/Downloads
```

Ansible:
```
      docker_container:
        name: JDownloader
        image: mephistoxol/jdownloader
        volumes:
          - /your/path/for/data:/app/JDownloader/Downloads
        env:
          DEVICENAME: "yourdevicename"
          EMAIL: "MyJDownloaderAccount"
          PASSWORD: "MyJDownloaderPassword"
        restart_policy: always
        ##################
        # Traefik v1.7 optional
        #labels:
        #  traefik.enable: "false"
        #networks:
        #  - name: proxy-tier
        ##################
      register: result

```

## Changelog
```
02-04-2021
- MultiArch-v1.0
- Rebased to Alpine
- Added Multi-Arch building
- Minor fixes in Entrypoint script
```

## Donate
[![Paypal](https://raw.githubusercontent.com/MephistoXoL/Things/master/paypal.png)](https://www.paypal.me/mephistoxol)
