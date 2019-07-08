FROM alpine:latest

VOLUME ["/mnt/backup","/mnt/daemon-data","/var/spool/cron/"]
ENTRYPOINT /usr/local/bin/ark-backup/ark-backup-full.sh
COPY scripts/* /usr/local/bin/ark-backup/
RUN apk add --no-cache --update tzdata tar && mkdir /mnt/backup -p && mkdir /mnt/daemon-data -p && chmod +x /usr/local/bin/ark-backup/*
