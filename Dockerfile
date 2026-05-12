FROM php:8.2-apache

# Instalar dependencias necesarias
RUN apt-get update && apt-get install -y \
    libicu-dev \
    libsqlite3-dev \
    sqlite3 \
    unzip \
    git \
    && docker-php-ext-install intl pdo pdo_sqlite

# Activar mod_rewrite
RUN a2enmod rewrite

# Instalar Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Copiar proyecto
COPY . /var/www/html/

WORKDIR /var/www/html

# Instalar dependencias de CakePHP
RUN composer install --no-interaction --prefer-dist

# Permisos
RUN chown -R www-data:www-data /var/www/html/tmp
RUN chown -R www-data:www-data /var/www/html/logs

# Apache apuntando a webroot
ENV APACHE_DOCUMENT_ROOT /var/www/html/webroot

RUN sed -ri -e 's!/var/www/html!${APACHE_DOCUMENT_ROOT}!g' \
/etc/apache2/sites-available/*.conf

EXPOSE 80

CMD ["apache2-foreground"]