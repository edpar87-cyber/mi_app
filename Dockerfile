FROM php:8.2-apache

RUN apt-get update && apt-get install -y \
    libicu-dev \
    libzip-dev \
    unzip \
    zip \
    git

RUN docker-php-ext-configure intl

RUN docker-php-ext-install \
    intl \
    pdo \
    pdo_mysql

RUN a2dismod mpm_event
RUN a2enmod mpm_prefork
RUN a2enmod rewrite

COPY --from=composer:2 /usr/bin/composer /usr/bin/composer

WORKDIR /var/www/html

COPY . .

ENV COMPOSER_ALLOW_SUPERUSER=1

RUN composer install --optimize-autoloader --no-interaction

EXPOSE 80