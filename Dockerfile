FROM php:8.2-cli

RUN apt-get update && apt-get install -y \
git \
unzip \ 
libicu-dev \
default-mysql-client \
&& docker-php-ext-install intl pdo pdo_mysql mysqli

COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

WORKDIR /app

COPY . .

RUN composer install --no-interaction --prefer-dist
RUN docker-php-ext-install pdo pdo_mysql

EXPOSE 8080

CMD php -S 0.0.0.0:$PORT -t webroot
