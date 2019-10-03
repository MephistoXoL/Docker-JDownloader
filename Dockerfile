FROM bellsoft/liberica-openjdk-alpine:latest-armv7l

MAINTAINER XoL <MephistoXoL@gmail.com>

RUN mkdir -p /app/JDownloader/ && \
    mkdir -p /app/JDownloader/Downloads && \
    wget -O /app/JDownloader/JDownloader.jar "http://installer.jdownloader.org/JDownloader.jar" && \
    apk add --update --no-cache bash libstdc++ ffmpeg tini-static && \
    rm -rf /tmp/*

COPY entrypoint.sh /usr/bin/entrypoint.sh

RUN chmod +x /usr/bin/entrypoint.sh

VOLUME /app/JDownloader/Downloads

ENTRYPOINT ["tini-static", "--", "/usr/bin/entrypoint.sh"]