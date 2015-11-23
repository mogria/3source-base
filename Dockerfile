FROM alpine:latest

MAINTAINER "Mogria" <m0gr14@gmail.com>

ENV RUN_AS 0
USER root
WORKDIR /tmp

COPY get-arch.sh /usr/bin/get-arch.sh
COPY umask-wrapper.sh /usr/bin/umask-wrapper.sh
COPY container-user.sh /usr/bin/container-user.sh

RUN chmod +x /usr/bin/get-arch.sh

# openssl required for https:// download
RUN apk add --update openssl && \
    wget -O /usr/bin/gosu "https://github.com/tianon/gosu/releases/download/1.7/gosu-$(get-arch.sh)" && \
    chmod +x /usr/bin/umask-wrapper.sh && \
    chmod +x /usr/bin/container-user.sh && \
    chmod +x /usr/bin/gosu && \
    rm /usr/bin/get-arch.sh



ENTRYPOINT ["umask-wrapper.sh", "container-user.sh"]
