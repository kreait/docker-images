FROM alpine:3.7

LABEL maintainer "Jérôme Gamez <jerome@gamez.name>"

COPY scripts /scripts

RUN /scripts/install-packages.sh \
    && /scripts/ensure-www-data.sh \
	&& rm -rf /scripts

COPY entrypoints/php-entrypoint /usr/local/bin/

ENTRYPOINT ["php-entrypoint"]

CMD ["php", "-a"]
