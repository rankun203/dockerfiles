FROM ubuntu:18.04

LABEL maintainer="Kun R<rankun203@gmail.com>"

# Mainly for installing PHP stuff
ENV TZ=Asia/Shanghai
ENV DEBIAN_FRONTEND=noninteractive

COPY ./rootfs /

RUN apt update && apt upgrade -y && \
    apt-get install -y software-properties-common tmux git vim gosu --fix-missing && \
    add-apt-repository -y ppa:ondrej/php && \
    apt update && \
    apt install -y php7.2 --fix-missing && \
    php -v && \
    apt install -y --fix-missing php-pear php7.2-curl php7.2-dev php7.2-gd php7.2-mbstring php7.2-zip php7.2-mysql php7.2-xml php7.2-zip php7.2-fpm unzip && \
    # apt install -y --fix-missing php-{curl,dev,gd,mbstring,zip,mysql,xml,bcmath,bz2,intl,fpm} php-pear unzip && \
    echo PHP installed

# Commands borrowed from https://getcomposer.org/download/
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" && \
    php -r "if (hash_file('sha384', 'composer-setup.php') === '48e3236262b34d30969dca3c37281b3b4bbe3221bda826ac6a9a62d6444cdb0dcd0615698a5cbe587c3f0fe57a54d8f5') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;" && \
    php composer-setup.php && \
    php -r "unlink('composer-setup.php');" && \
    mv composer.phar /usr/local/bin/composer && \
    chown -R www-data:www-data /var/www && \
    curl https://drupalconsole.com/installer -L -o drupal.phar && chmod +x drupal.phar && mv ./drupal.phar /usr/local/bin/drupal && \
    composer config -g repo.packagist composer https://packagist.laravel-china.org && \
    echo Composer installed

RUN apt install -y --fix-missing nginx mysql-client && \
    echo Nginx installed
