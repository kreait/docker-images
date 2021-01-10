ARG ALPINE_VERSION

###########################################################

FROM alpine:${ALPINE_VERSION} as base

ARG ALPINE_VERSION
ARG PHP_VERSION
ARG VCS_REF

LABEL maintainer="Jérôme Gamez <jerome@kreait.com>" \
      org.label-schema.vcs-ref=$VCS_REF \
      org.label-schema.vcs-url="https://github.com/kreait/docker-images"

COPY docker /docker/

ADD https://dl.bintray.com/php-alpine/key/php-alpine.rsa.pub /etc/apk/keys/php-alpine.rsa.pub

RUN apk --update-cache add ca-certificates \
    && echo https://dl.bintray.com/php-alpine/v$ALPINE_VERSION/php-$PHP_VERSION >> /etc/apk/repositories \
    # See https://github.com/gliderlabs/docker-alpine/issues/184
    && sed -i 's/http\:\/\/dl-cdn.alpinelinux.org/https\:\/\/alpine.global.ssl.fastly.net/g' /etc/apk/repositories \
    && apk update && apk upgrade \
    && /docker/scripts/install-packages.sh \
    && /docker/scripts/ensure-www-data.sh \
    && mv /docker/php-entrypoint /usr/local/bin/

ENTRYPOINT ["php-entrypoint"]

CMD ["php", "-a"]

###########################################################

FROM base AS php

RUN rm -rf /docker

###########################################################

FROM base as php-dev

RUN /docker/scripts/install-dev-packages.sh \
    && rm -rf /docker

###########################################################

FROM base AS base-fpm

RUN apk --no-cache add php7-fpm \
    && mv /docker/www.conf /etc/php7/php-fpm.d/www.conf

EXPOSE 9000

CMD ["php-fpm7"]

###########################################################

FROM base-fpm as php-fpm

RUN rm -rf /docker

###########################################################

FROM base-fpm as php-fpm-dev

RUN /docker/scripts/install-dev-packages.sh \
    && rm -rf /docker
