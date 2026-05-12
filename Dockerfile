FROM php:8.2-cli

RUN apt-get update && apt-get install -y \
    git \
    unzip \
    zip \
    sqlite3 \
    libsqlite3-dev \
    libicu-dev

RUN docker-php-ext-install intl pdo pdo_sqlite

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

CMD ["sh", "-c", "php -S 0.0.0.0:${PORT:-8080} -t webroot"]