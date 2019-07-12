ARG ALPINE_VERSION

###########################################################

FROM alpine:${ALPINE_VERSION} as base

LABEL maintainer="Jérôme Gamez <jerome@kreait.com>"

COPY docker /docker/

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

FROM base as php-fpm

RUN apk --no-cache add php7-fpm \
    && mv /docker/www.conf /etc/php7/php-fpm.d/www.conf \
    && rm -rf /docker

EXPOSE 9000

CMD ["php-fpm7"]

###########################################################

FROM base as php-fpm-dev

RUN apk --no-cache add php7-fpm \
    && mv /docker/www.conf /etc/php7/php-fpm.d/www.conf \
    && /docker/scripts/install-dev-packages.sh \
    && rm -rf /docker

EXPOSE 9000

CMD ["php-fpm7"]
