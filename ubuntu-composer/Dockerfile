FROM ubuntu:18.04

LABEL maintainer="Kun R<rankun203@gmail.com>"

# Mainly for installing PHP stuff
ENV TZ=Asia/Shanghai
ENV DEBIAN_FRONTEND=noninteractive

RUN apt update && apt upgrade -y && \
    apt-get install -y software-properties-common tmux git vim --fix-missing && \
    add-apt-repository -y ppa:ondrej/php && \
    apt update && \
    apt install -y php7.3 --fix-missing && \
    php -v && \
    apt install -y --fix-missing php-pear php7.3-curl php7.3-dev php7.3-gd php7.3-mbstring php7.3-zip php7.3-mysql php7.3-xml php-zip unzip && \
    echo PHP installed

# Commands borrowed from https://getcomposer.org/download/
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" && \
    php -r "if (hash_file('sha384', 'composer-setup.php') === '48e3236262b34d30969dca3c37281b3b4bbe3221bda826ac6a9a62d6444cdb0dcd0615698a5cbe587c3f0fe57a54d8f5') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;" && \
    php composer-setup.php && \
    php -r "unlink('composer-setup.php');" && \
    mv composer.phar /usr/local/bin/composer && \
    chown -R www-data:www-data /var/www && \
    curl https://drupalconsole.com/installer -L -o drupal.phar && chmod +x drupal.phar && mv ./drupal.phar /usr/local/bin/drupal && \
    echo Composer installed

RUN apt install -y nginx php-fpm mysql-client && \
    echo Nginx installed
