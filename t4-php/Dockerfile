FROM php:fpm-alpine

MAINTAINER Rafael Cid "rcid@m-risk.com"

COPY php-cli.ini /usr/local/etc/php/
COPY www-php-ini.conf /usr/local/etc/php-fpm.d/

RUN chmod 622 /usr/local/etc/php-fpm.d/* && \
    apk add \
        re2c \
        libpq \
        gettext-libs \
		libzip \
		libxslt \
		libpng \
        --update && \
    apk add \
        file \
        binutils \
        coreutils \
        g++ \
        make \
        autoconf \
        wget \
        gettext-dev \
        postgresql-dev \
        libxml2-dev \
		libzip-dev \
		libxslt-dev \
		libpng-dev \
        --virtual devpacks && \
    cd /tmp && \
    wget https://github.com/websupport-sk/pecl-memcache/archive/4.0.4.zip -O pecl-memcache-4.0.4.zip && \
    unzip pecl-memcache-4.0.4.zip && \
    cd pecl-memcache-4.0.4 && \
    phpize && \
    ./configure && \
    make && \
    make install && \
    cd /tmp && \
    rm -rf * && \
    docker-php-ext-enable memcache && \
    cd /tmp && \
    docker-php-ext-enable opcache && \
    docker-php-ext-install -j$(nproc) pcntl zip gettext pdo_pgsql sockets xmlrpc xsl gd &&  \
    apk del devpacks --purge
	
RUN mkdir -p /var/lib/mrisk/bo/upload && \
    chown www-data /var/lib/mrisk/bo/upload && \
    chgrp www-data /var/lib/mrisk/bo/upload
    
VOLUME /var/lib/mrisk/bo/upload

WORKDIR /media/sf_T4

