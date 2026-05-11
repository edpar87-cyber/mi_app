FROM dunglas/frankenphp

# Instalar paquetes del sistema
RUN apt-get update && apt-get install -y \
    git \
    unzip \
    zip

# Instalar extensiones PHP necesarias
RUN install-php-extensions \
    intl \
    pdo_mysql \
    mbstring \
    zip

# Instalar Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

WORKDIR /app

COPY . /app

# Instalar dependencias CakePHP
RUN composer install --no-interaction --prefer-dist

RUN chmod -R 777 tmp logs

EXPOSE 80

CMD ["frankenphp", "run", "--config", "/etc/caddy/Caddyfile"]   