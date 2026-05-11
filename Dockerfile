FROM php:8.2-apache

RUN apt-get update && apt-get install -y \
    git \
    unzip \
    zip \
    libicu-dev

RUN docker-php-ext-install intl pdo pdo_mysql

COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Activar mod_rewrite
RUN a2enmod rewrite

WORKDIR /var/www/html

COPY . .

RUN composer install --no-interaction --prefer-dist

RUN chmod -R 777 tmp logs

# Configurar Apache para CakePHP
RUN sed -i 's!/var/www/html!/var/www/html/webroot!g' /etc/apache2/sites-available/000-default.conf

EXPOSE 80