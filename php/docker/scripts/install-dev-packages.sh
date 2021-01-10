#!/bin/bash
set -ex

apk --no-cache add \
    php-xdebug

sed -i 's/;zend_extension/zend_extension/' /etc/php7/conf.d/00_xdebug.ini
