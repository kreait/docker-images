# Docker PHP Images

Docker images built on top of Alpine Linux with the latest stable PHP Version and common and useful extensions.

https://github.com/kreait/docker-images

The images are automatically re-built and published on a weekly basis.

## Available tags and information

| Image  | Dockerfile |Size |
| --- | --- | --- |
| kreait/php:7  | [php/7/Dockerfile](https://github.com/kreait/docker-images/blob/master/php/7/Dockerfile) | [![](https://images.microbadger.com/badges/image/kreait/php:7.svg)](https://microbadger.com/images/kreait/php:7) |
| kreait/php:7-dev  | [php/7-dev/Dockerfile](https://github.com/kreait/docker-images/blob/master/php/7-dev/Dockerfile) | [![](https://images.microbadger.com/badges/image/kreait/php:7-dev.svg)](https://microbadger.com/images/kreait/php:7-dev) |
| kreait/php:7-fpm  | [php/7-fpm/Dockerfile](https://github.com/kreait/docker-images/blob/master/php/7-fpm/Dockerfile) | [![](https://images.microbadger.com/badges/image/kreait/php:7-fpm.svg)](https://microbadger.com/images/kreait/php:7-fpm) |
| kreait/php:7-fpm-dev  | [php/7-fpm-dev/Dockerfile](https://github.com/kreait/docker-images/blob/master/php/7-fpm-dev/Dockerfile) | [![](https://images.microbadger.com/badges/image/kreait/php:7-fpm-dev.svg)](https://microbadger.com/images/kreait/php:7-fpm-dev) |
| kreait/php:7.2  | [php/7.2/Dockerfile](https://github.com/kreait/docker-images/blob/master/php/7.2/Dockerfile) | [![](https://images.microbadger.com/badges/image/kreait/php:7.2.svg)](https://microbadger.com/images/kreait/php:7.2) |
| kreait/php:7.2-dev  | [php/7.2-dev/Dockerfile](https://github.com/kreait/docker-images/blob/master/php/7.2-dev/Dockerfile) | [![](https://images.microbadger.com/badges/image/kreait/php:7.2-dev.svg)](https://microbadger.com/images/kreait/php:7.2-dev) |
| kreait/php:7.2-fpm  | [php/7.2-fpm/Dockerfile](https://github.com/kreait/docker-images/blob/master/php/7.2-fpm/Dockerfile) | [![](https://images.microbadger.com/badges/image/kreait/php:7.2-fpm.svg)](https://microbadger.com/images/kreait/php:7.2-fpm) |
| kreait/php:7.2-fpm-dev  | [php/7.2-fpm-dev/Dockerfile](https://github.com/kreait/docker-images/blob/master/php/7.2-fpm-dev/Dockerfile) | [![](https://images.microbadger.com/badges/image/kreait/php:7.2-fpm-dev.svg)](https://microbadger.com/images/kreait/php:7.2-fpm-dev) |

## Installed PHP packages

The images include the same PHP extensions as the official PHP images, `php7-xdebug` being the only
added extension on the `*-dev` images.

```
[PHP Modules]
Core
ctype
curl
date
dom
fileinfo
filter
ftp
hash
iconv
json
libxml
mbstring
mysqlnd
openssl
pcre
PDO
pdo_sqlite
Phar
posix
readline
Reflection
session
SimpleXML
SPL
sqlite3
standard
tokenizer
xml
xmlreader
xmlwriter
zlib
```

## `www-data` user

Same as in the official PHP images, and as it is very likely that PHP is used in combination with a webserver, all images include a `www-data` user (UID 82, GID 82 - 82 is the standard uid/gid for `www-data` in Alpine).
