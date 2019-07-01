FROM alpine:latest

RUN apk add --no-cache --update tzdata tar
RUN mkdir /mnt/backup -p && mkdir /mnt/daemon-data -p && mkdir /usr/local/bin/ark-backup
COPY scripts/* /usr/local/bin/ark-backup/
VOLUME ["/mnt/backup","/mnt/daemon-data","/var/spool/cron/"]
ENTRYPOINT docker-entrypoint.sh
