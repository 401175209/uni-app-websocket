FROM php:7.3-cli
LABEL maintainer="waxiongfeifei@gmail.com" version="1.0"
RUN sed -i s@/deb.debian.org/@/mirrors.aliyun.com/@g /etc/apt/sources.list \
&& apt-get clean \
&& apt-get update \
&& apt-get install -y openssl libssl-dev \
&& apt-get install libevent-dev -y \
&& docker-php-ext-install pcntl sockets pdo_mysql \
&&  sh -c '/bin/echo -e "no\nyes\n/usr\nno\nyes\nno\nyes\nno" | pecl install event' \
&& docker-php-ext-enable event \
&& pecl install redis \
&& docker-php-ext-enable redis \
&& curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer
EXPOSE 8282 8283 7273 1238
CMD /bin/bash
