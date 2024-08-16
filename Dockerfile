# Use uma imagem base do PHP com FPM
FROM php:8.2-fpm

# Instale as extensões necessárias
RUN apt-get update && apt-get install -y \
    libpng-dev libjpeg-dev libfreetype6-dev \
    libzip-dev unzip git \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install gd \
    && docker-php-ext-install zip pdo pdo_mysql

# Instale o Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Defina o diretório de trabalho
WORKDIR /var/www

# Copie o código do projeto para o contêiner
COPY . .

# Instale as dependências do Laravel
RUN composer install

# Defina permissões para os diretórios
RUN mkdir -p /var/www/storage && \
    mkdir -p /var/www/bootstrap/cache && \
    chown -R www-data:www-data /var/www/storage /var/www/bootstrap/cache && \
    chmod -R 775 /var/www/storage /var/www/bootstrap/cache

# Gere a chave de aplicação do Laravel
RUN php artisan key:generate

# Exponha a porta 9000 para o PHP-FPM
EXPOSE 9000