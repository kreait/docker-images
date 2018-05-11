FROM alpine:3.7

LABEL maintainer "Jérôme Gamez <jerome@gamez.name>"

COPY scripts /scripts

RUN /scripts/install-packages.sh \
    && /scripts/ensure-www-data.sh \
    && apk --no-cache add php7-fpm \
    && rm -rf /scripts

COPY 7-fpm/www.conf /etc/php7/php-fpm.d/www.conf

EXPOSE 9000

CMD ["php-fpm7"]
