all: php-7 php-7-dev php-7-fpm php-7-fpm-dev ## Builds all images

.PHONY: clean
clean:
	docker image rm $(docker images -q kreait/php) || true
	docker image rm $(docker images -q kreait/php) || true

test: test-php-7 test-php-7-dev test-php-7-fpm test-php-7-fpm-dev

.PHONY: php-7
php-7:
	docker build \
		-f php/7/Dockerfile \
		-t kreait/php:7 \
		php

.PHONY: test-php-7
test-php-7:
	docker run -t kreait/php:7 --version | grep '7.1'

.PHONY: php-7-dev
php-7-dev:
	docker build \
		-f php/7-dev/Dockerfile \
		-t kreait/php:7-dev \
		php

.PHONY: test-php-7-dev
test-php-7-dev:
	docker run -t kreait/php:7-dev --version | grep '7.1'
	docker run -t kreait/php:7-dev --version | grep 'Xdebug'

.PHONY: php-7-fpm
php-7-fpm:
	docker build \
		-f php/7-fpm/Dockerfile \
		-t kreait/php:7-fpm \
		php

.PHONY: test-php-7-fpm
test-php-7-fpm:
	docker run --name kreait-php-7-fpm -d kreait/php:7-fpm
	docker exec kreait-php-7-fpm sh -c "php --version" | grep '7.1'
	docker logs kreait-php-7-fpm 2>&1 | grep 'fpm is running'
	docker rm -f kreait-php-7-fpm

.PHONY: php-7-fpm-dev
php-7-fpm-dev:
	docker build \
		-f php/7-fpm-dev/Dockerfile \
		-t kreait/php:7-fpm-dev \
		php

.PHONY: test-php-7-fpm-dev
test-php-7-fpm-dev:
	docker run --name kreait-php-7-fpm-dev -d kreait/php:7-fpm-dev
	docker exec kreait-php-7-fpm-dev sh -c "php --version" | grep '7.1'
	docker exec kreait-php-7-fpm-dev sh -c "php --version" | grep 'Xdebug'
	docker logs kreait-php-7-fpm-dev 2>&1 | grep 'fpm is running'
	docker rm -f kreait-php-7-fpm-dev
