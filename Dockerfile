FROM php:8.2-cli

RUN apt-get update && apt-get install -y \
    libicu-dev \
    libzip-dev \
    unzip \
    zip \
    git

RUN docker-php-ext-configure intl

RUN docker-php-ext-install intl pdo pdo_mysql

COPY --from=composer:2 /usr/bin/composer /usr/bin/composer

WORKDIR /app

COPY . .

ENV COMPOSER_ALLOW_SUPERUSER=1

RUN composer install --optimize-autoloader --no-interaction

CMD php -S 0.0.0.0:$PORT -t webroot