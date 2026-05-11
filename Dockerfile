FROM php:8.2-cli

RUN apt-get update && apt-get install -y \
    git \
    unzip \
    zip \
    libicu-dev

RUN docker-php-ext-install intl pdo pdo_mysql

COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

WORKDIR /app

COPY . .

RUN composer install --no-interaction --prefer-dist

RUN chmod -R 777 tmp logs
RUN touch /app/tmp/database.sqlite
RUN chmod -R 777 /app/tmp
RUN chmod -R 777 /app/logs

EXPOSE 8080

CMD php -S 0.0.0.0:8080 -t webroot