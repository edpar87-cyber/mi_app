FROM php:8.2-apache

RUN apt-get update && apt-get install -y \
    git \
    unzip \
    libicu-dev && \
    docker-php-ext-install intl pdo pdo_mysql mysqli

COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

WORKDIR /app

COPY . .

RUN composer install --no-interaction --prefer-dist

RUN chown -R www-data /var/www/html/tmp
RUN chown -R www-data /var/www/html/logs

EXPOSE 80

CMD ["apache2-foreground"]