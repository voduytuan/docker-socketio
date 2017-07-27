FROM zzrot/alpine-node
MAINTAINER Vo Duy Tuan <tuanmaster2012@gmail.com>

RUN apk add --update \
    supervisor \
  && rm -rf /var/cache/apk/*

ADD supervisord.conf /etc/supervisor/conf.d/supervisord.conf

RUN /bin/mkdir -p /srv/logs

WORKDIR /srv

RUN npm install --silent socket.io
RUN npm dedupe

EXPOSE 8080

CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/conf.d/supervisord.conf"]

