FROM dunglas/frankenphp

RUN install-php-extensions \
    intl \
    pdo_mysql \
    mbstring

WORKDIR /app

COPY . /app

RUN composer install --no-interaction --prefer-dist

EXPOSE 80

CMD ["frankenphp", "run", "--config", "/etc/caddy/Caddyfile"]