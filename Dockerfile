FROM alpine:edge

MAINTAINER Jlintw <iamjlintw@gmail.com>

    RUN apk add --update curl \
    bash

    RUN apk add --no-cache --repository "http://dl-cdn.alpinelinux.org/alpine/edge/community" \
    ca-certificates \
    openssh \
    pcre \
    libmemcached-libs \
    zlib \
    php7 \
    php7-fpm \
    php7-bcmath \
    php7-ctype \
    php7-curl \
    php7-dom \
    php7-gd \
    php7-iconv \
    php7-intl \
    php7-json \
    php7-openssl \
    php7-opcache \
    php7-mbstring \
    php7-mcrypt \
    php7-mysqlnd \
    php7-mysqli \
    php7-pgsql \
    php7-pdo_mysql \
    php7-pdo_pgsql \
    php7-pdo_sqlite \
    php7-phar \
    php7-phpdbg \
    php7-session \
    php7-xml \
    php7-xmlreader \
    php7-zip \
    php7-zlib


    ##
    # Install composer
    # source: https://getcomposer.org/download/
    ##

    RUN curl -sS https://getcomposer.org/installer | php7 -- --install-dir=/usr/bin --filename=composer
    RUN chmod +rx /usr/bin/composer

    ##
    # Link php bin  
    ##  
    #ENTRYPOINT /usr/sbin/php7-fpm --nodaemonize
    #RUN ln -s /usr/bin/php7 /usr/bin/php   
    ##
    # Clean and Clear
    ##  
    RUN rm -rf /var/cache/apk/* && \
     rm -rf /tmp/*

   t add README.mdEXPOSE 9000
   CMD ["/usr/sbin/php-fpm7"]

