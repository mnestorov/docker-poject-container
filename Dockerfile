FROM php:8.1-apache

USER root

WORKDIR /var/www/html

RUN apt update && apt install -y \
        nodejs \
        git \
        vim \
        npm \
        libpng-dev \
        zlib1g-dev \
        libxml2-dev \
        libzip-dev \
        libonig-dev \
        zip \
        curl \
        unzip \
        zsh \
        wget \
    && docker-php-ext-configure gd \
    && docker-php-ext-install -j$(nproc) gd \
    && docker-php-ext-install pdo_mysql \
    && docker-php-ext-install mysqli \
    && docker-php-ext-install exif \
    && docker-php-ext-install zip \
    && docker-php-ext-enable gd pdo_mysql mysqli exif zip\
    && docker-php-source delete

COPY /apache/default.conf /etc/apache2/sites-available/000-default.conf

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
RUN groupadd --force -g 1000 mnestorov
RUN useradd -ms /bin/bash --no-user-group -g 1000 -u 1000 mnestorov
RUN chown -R mnestorov:mnestorov /var/www/html && a2enmod rewrite

# terminal colors with xterm
ENV TERM xterm

# set the zsh theme
ENV ZSH_THEME agnoster

# run the installation script
RUN wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh || true
