FROM php:7.2-fpm

MAINTAINER Mohamed Camara GUEYE <mohamed.gueye@akilee-by-ines.com>

RUN apt-get update && apt-get install -y \
    git \
    vim \
    unzip

RUN apt-get update && apt-get install -y \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libpng-dev

RUN buildDeps=" \
        default-libmysqlclient-dev \
        libbz2-dev \
        libmemcached-dev \
        libsasl2-dev \
    " \
    runtimeDeps=" \
        curl \
        git \
        libfreetype6-dev \
        libicu-dev \
        libjpeg-dev \
        libldap2-dev \
        libmemcachedutil2 \
        libpng-dev \
        libpq-dev \
        libxml2-dev \
    " \
    && apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y $buildDeps $runtimeDeps \
    && docker-php-ext-install bcmath bz2 calendar iconv intl mbstring mysqli opcache pdo_mysql pdo_pgsql pgsql soap zip \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install gd \
    && docker-php-ext-configure ldap --with-libdir=lib/x86_64-linux-gnu/ \
    && docker-php-ext-install ldap \
    && docker-php-ext-install exif \
    && pecl install memcached redis \
    && docker-php-ext-enable memcached.so redis.so \
    && apt-get purge -y --auto-remove $buildDeps \
&& rm -r /var/lib/apt/lists/*


# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer


# Set timezone
RUN rm /etc/localtime
RUN ln -s /usr/share/zoneinfo/Africa/Dakar /etc/localtime
RUN "date"

# Type docker-php-ext-install to see available extensions
RUN docker-php-ext-install pdo pdo_mysql pdo_pgsql
RUN docker-php-ext-enable pdo pdo_mysql pdo_pgsql

RUN docker-php-ext-install mbstring
RUN docker-php-ext-enable mbstring
RUN echo 'alias sf="php bin/console"' >> ~/.bashrc


ENV app=/app

RUN mkdir -p /app

WORKDIR /app

COPY . .

# RUN composer install


CMD ./bin/console server:run 0.0.0.0:8000

EXPOSE 8000
