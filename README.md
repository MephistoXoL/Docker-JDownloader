![Docker-JDownloader](https://raw.githubusercontent.com/MephistoXoL/Docker-JDownloader/master/Docker-JDownloader.png)

# Docker-JDownloader
Docker Image JDownloader for Raspberry pi 3

The image base is ```bellsoft/liberica-openjdk-alpine:latest-armv7l```.
Container firts run download the last JDownloader version and install it, wait a while to complete the installation (around 5 min.).
The script entrypoint.sh will check and create the config file where are located MyJDownloader credentials.

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
    # Traefik optional
    labels:
      - traefik.enable: "false"
    networks:      
      - proxy-tier
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
        # Traefik optional
        labels:
          traefik.enable: "false"
        networks:
          - name: proxy-tier
      register: result

```
