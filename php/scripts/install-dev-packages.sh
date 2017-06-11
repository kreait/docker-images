#!/bin/sh
set -ex

apk --no-cache add \
    php7-xdebug

sed -i 's/;zend_extension/zend_extension/' /etc/php7/conf.d/xdebug.ini
