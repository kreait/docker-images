ARG ALPINE_VERSION

###########################################################

FROM alpine:${ALPINE_VERSION} as base

LABEL maintainer="Jérôme Gamez <jerome@kreait.com>"

COPY docker /docker/

# See https://github.com/gliderlabs/docker-alpine/issues/184
RUN \
  sed -i 's/http\:\/\/dl-cdn.alpinelinux.org/https\:\/\/alpine.global.ssl.fastly.net/g' /etc/apk/repositories && \
  apk update && apk upgrade

RUN /docker/scripts/install-packages.sh \
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
