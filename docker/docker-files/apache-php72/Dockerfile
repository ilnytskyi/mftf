FROM php:7.2.15-apache-stretch

RUN apt-get update

RUN apt-get install -y \
    libfreetype6-dev \
    libicu-dev \
    libjpeg62-turbo-dev \
    libmcrypt-dev \
    libxslt1-dev \
    git \
    vim \
    nano \
    wget \
    openssh-client \
    libmcrypt-dev \
    gnupg \
  && apt-get clean

RUN pecl install mcrypt-1.0.1
RUN docker-php-ext-enable mcrypt

RUN docker-php-ext-configure \
    gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/; \
    docker-php-ext-install \
    gd \
    intl \
    mbstring \
    pdo_mysql \
    xsl \
    zip \
    opcache \
    bcmath \
	soap \
	calendar
RUN curl -sL https://deb.nodesource.com/setup_6.x | bash -
RUN apt-get install -y nodejs
RUN export GIT_DISCOVERY_ACROSS_FILESYSTEM=1

ADD php.ini /usr/local/etc/php/conf.d/999-magento.ini
ADD apache-config.conf /etc/apache2/sites-enabled/000-default.conf

RUN pecl install xdebug-2.6.0 && docker-php-ext-enable xdebug

RUN apt-get update && apt-get install -y cron rsyslog && apt-get clean

RUN usermod -u 1000 www-data; \
  a2enmod rewrite; \
  curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer; \
  curl -o n98-magerun2.phar http://files.magerun.net/n98-magerun2-latest.phar; \
  chmod +x ./n98-magerun2.phar; \
  mv n98-magerun2.phar /usr/local/bin/; \
  mkdir -p /root/.composer; \
  touch /var/log/syslog; \
  touch /var/log/cron.log;

RUN mkdir ~/.ssh/
RUN chmod -R 600 ~/.ssh


ADD crontab /var/www/install/crontab.www-data
ADD auth.json /root/.composer/auth.json
ADD auth.json /var/www/.composer/auth.json

