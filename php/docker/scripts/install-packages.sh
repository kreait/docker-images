#!/bin/sh
set -ex

apk --no-cache add \
    bash \
    zip unzip \
    php \
    php-ctype \
    php-curl \
    php-dom \
    php-ftp \
    php-gd \
    php-iconv \
    php-intl \
    php-json \
    php-mbstring \
    php-mysqlnd \
    php-openssl \
    php-pdo \
    php-pdo_sqlite \
    php-pdo_mysql \
    php-pdo_pgsql \
    php-pear \
    php-phar \
    php-posix \
    php-session \
    php-sqlite3 \
    php-xml \
    php-xmlreader \
    php-zip \
    php-zlib

ln -s /usr/bin/php7 /usr/bin/php
