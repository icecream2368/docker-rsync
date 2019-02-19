FROM alpine:3.9

LABEL maintainer="8wy2513537@163.com"

# daily backup, from ENV:DATA_DIR rsync to ENV:BACKUP_DIR
ENV DATA_DIR /nexus-data/
ENV BACKUP_DIR /nexus-back/

RUN apk add --no-cache rsync runit

ADD crond/run /etc/service/crond/run
ADD backup /etc/periodic/daily/

VOLUME ${DATA_DIR}
VOLUME ${BACKUP_DIR}

CMD ["/sbin/runsvdir", "-P", "/etc/service"]
