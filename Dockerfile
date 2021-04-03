FROM alpine:latest

LABEL maintainer="XoL <MephistoXoL@gmail.com>" description="JDownloader" version="MultiArch-v1.11"

RUN mkdir -p /app/JDownloader/ && \
    mkdir -p /app/JDownloader/Downloads && \
    wget -O /app/JDownloader/JDownloader.jar "http://installer.jdownloader.org/JDownloader.jar" && \
    apk add openjdk8-jre --repository=http://dl-cdn.alpinelinux.org/alpine/edge/testing && \
    apk add --update --no-cache bash libstdc++ ffmpeg && \
    rm -rf /tmp/*

COPY entrypoint.sh /usr/bin/entrypoint.sh

RUN chmod +x /usr/bin/entrypoint.sh

VOLUME /app/JDownloader/Downloads

CMD ["/usr/bin/entrypoint.sh"]