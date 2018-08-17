.PHONY: all
all: build test

.PHONY: build
build:
	docker build -f php/7/Dockerfile -t kreait/php:7 php
	docker build -f php/7-dev/Dockerfile -t kreait/php:7-dev php
	docker build -f php/7-fpm/Dockerfile -t kreait/php:7-fpm php
	docker build -f php/7-fpm-dev/Dockerfile -t kreait/php:7-fpm-dev php

	docker build -f php/7.2/Dockerfile -t kreait/php:7.2 php
	docker build -f php/7.2-dev/Dockerfile -t kreait/php:7.2-dev php
	docker build -f php/7.2-fpm/Dockerfile -t kreait/php:7.2-fpm php
	docker build -f php/7.2-fpm-dev/Dockerfile -t kreait/php:7.2-fpm-dev php

.PHONY: test
test:
	docker run --rm kreait/php:7 php -v | grep '7.1'
	docker run --rm kreait/php:7-dev php -v | grep '7.1'
	docker run --rm kreait/php:7-fpm php -v | grep '7.1'
	docker run --rm kreait/php:7-fpm-dev php -v | grep '7.1'

	docker run --rm kreait/php:7.2 php -v | grep '7.2'
	docker run --rm kreait/php:7.2-dev php -v | grep '7.2'
	docker run --rm kreait/php:7.2-fpm php -v | grep '7.2'
	docker run --rm kreait/php:7.2-fpm-dev php -v | grep '7.2'

	docker run --rm kreait/php:7-dev php -v | grep 'Xdebug'
	docker run --rm kreait/php:7-fpm-dev php -v | grep 'Xdebug'
	docker run --rm kreait/php:7.2-dev php -v | grep 'Xdebug'
	docker run --rm kreait/php:7.2-fpm-dev php -v | grep 'Xdebug'


.PHONY: deploy
deploy:
	docker push kreait/php:7
	docker push kreait/php:7-dev
	docker push kreait/php:7-fpm
	docker push kreait/php:7-fpm-dev

	docker push kreait/php:7.2
	docker push kreait/php:7.2-dev
	docker push kreait/php:7.2-fpm
	docker push kreait/php:7.2-fpm-dev

.PHONY: clean
clean:
	docker image ls -q kreait/php | xargs docker rmi -f
