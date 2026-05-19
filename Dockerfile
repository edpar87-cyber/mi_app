FROM php:8.2-apache

RUN apt-get update && apt-get install -y \
    git \
    unzip \
    libicu-dev \
    && docker-php-ext-install intl pdo pdo_mysql mysqli

COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

WORKDIR /app

COPY . .

RUN composer install --no-interaction --prefer-dist

RUN mkdir -p /app/tmp
RUN rm -f /app/tmp/database.sqlite
RUN sqlite3 /app/tmp/database.sqlite < /app/config/schema.sql

RUN chmod -R 777 /app/tmp
RUN chmod -R 777 /app/logs

EXPOSE 8080

CMD ["apache2-foreground"]