.PHONY: all
all: php test-php

.PHONY: php
php:
	docker build --build-arg ALPINE_VERSION=3.7 --target php -t kreait/php:7.1 -f php/Dockerfile php
	docker build --build-arg ALPINE_VERSION=3.7 --target php-dev -t kreait/php:7.1-dev -f php/Dockerfile php
	docker build --build-arg ALPINE_VERSION=3.7 --target php-fpm -t kreait/php:7.1-fpm -f php/Dockerfile php
	docker build --build-arg ALPINE_VERSION=3.7 --target php-fpm-dev -t kreait/php:7.1-fpm-dev -f php/Dockerfile php

	docker build --build-arg ALPINE_VERSION=3.9 --target php -t kreait/php:7.2 -f php/Dockerfile php
	docker build --build-arg ALPINE_VERSION=3.9 --target php-dev -t kreait/php:7.2-dev -f php/Dockerfile php
	docker build --build-arg ALPINE_VERSION=3.9 --target php-fpm -t kreait/php:7.2-fpm -f php/Dockerfile php
	docker build --build-arg ALPINE_VERSION=3.9 --target php-fpm-dev -t kreait/php:7.2-fpm-dev -f php/Dockerfile php

	docker build --build-arg ALPINE_VERSION=3.10 --target php -t kreait/php:7.3 -f php/Dockerfile php
	docker build --build-arg ALPINE_VERSION=3.10 --target php-dev -t kreait/php:7.3-dev -f php/Dockerfile php
	docker build --build-arg ALPINE_VERSION=3.10 --target php-fpm -t kreait/php:7.3-fpm -f php/Dockerfile php
	docker build --build-arg ALPINE_VERSION=3.10 --target php-fpm-dev -t kreait/php:7.3-fpm-dev -f php/Dockerfile php

.PHONY: test-php
test-php:
	docker run --rm kreait/php:7.1 bash -c "php -v | grep '7\.1'"
	docker run --rm kreait/php:7.1-dev bash -c "php -v | grep '7\.1'"
	docker run --rm kreait/php:7.1-fpm bash -c "php -v | grep '7\.1'"
	docker run --rm kreait/php:7.1-fpm-dev bash -c "php -v | grep '7\.1'"

	docker run --rm kreait/php:7.2 bash -c "php -v | grep '7\.2'"
	docker run --rm kreait/php:7.2-dev bash -c "php -v | grep '7\.2'"
	docker run --rm kreait/php:7.2-fpm bash -c "php -v | grep '7\.2'"
	docker run --rm kreait/php:7.2-fpm-dev bash -c "php -v | grep '7\.2'"

	docker run --rm kreait/php:7.3 bash -c "php -v | grep '7\.3'"
	docker run --rm kreait/php:7.3-dev bash -c "php -v | grep '7\.3'"
	docker run --rm kreait/php:7.3-fpm bash -c "php -v | grep '7\.3'"
	docker run --rm kreait/php:7.3-fpm-dev bash -c "php -v | grep '7\.3'"

	docker run --rm kreait/php:7.1-dev bash -c "php -v | grep 'Xdebug'"
	docker run --rm kreait/php:7.1-fpm-dev bash -c "php -v | grep 'Xdebug'"
	docker run --rm kreait/php:7.2-dev bash -c "php -v | grep 'Xdebug'"
	docker run --rm kreait/php:7.2-fpm-dev bash -c "php -v | grep 'Xdebug'"
	docker run --rm kreait/php:7.3-dev bash -c "php -v | grep 'Xdebug'"
	docker run --rm kreait/php:7.3-fpm-dev bash -c "php -v | grep 'Xdebug'"

.PHONY: deploy
deploy:
	docker push kreait/php:7.1
	docker push kreait/php:7.1-dev
	docker push kreait/php:7.1-fpm
	docker push kreait/php:7.1-fpm-dev

	docker push kreait/php:7.2
	docker push kreait/php:7.2-dev
	docker push kreait/php:7.2-fpm
	docker push kreait/php:7.2-fpm-dev

	docker push kreait/php:7.3
	docker push kreait/php:7.3-dev
	docker push kreait/php:7.3-fpm
	docker push kreait/php:7.3-fpm-dev

.PHONY: clean
clean:
	docker image ls -q kreait/php | xargs docker rmi -f
