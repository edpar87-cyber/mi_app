FROM php:8.2-cli

RUN apt-get update && apt-get install -y \
    git \
    unzip \
    zip \
    sqlite3 \
    libicu-dev

RUN docker-php-ext-install intl pdo pdo_mysql

COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

WORKDIR /app

COPY . .

RUN composer install --no-interaction --prefer-dist

RUN mkdir -p /app/tmp
RUN touch /app/tmp/database.sqlite
RUN sqlite3 /app/tmp/database.sqlite < /app/config/schema.sql
RUN touch /app/tmp/test.sqlite
RUN chmod -R 777 /app/tmp
RUN chmod -R 777 /app/logs

RUN chmod +x bin/cake

RUN bin/cake migrations migrate 
RUN bin/cake migrations seed --seed ArticlesSeed

EXPOSE 8080

CMD php -S 0.0.0.0:8080 -t webroot