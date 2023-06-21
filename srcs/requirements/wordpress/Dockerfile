FROM debian:buster


RUN apt update -y && apt upgrade -y 

RUN apt install php-fpm php-mysql -y

RUN apt install curl -y && apt install wget -y

RUN apt install mariadb-client -y






#RUN mkdir -p /var/www/html
#RUN chown -R www-data:www-data /var/www

RUN mkdir -p /run/php && chown www-data:www-data /run/php
COPY tools/www.conf /etc/php/7.3/fpm/pool.d

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN cp wp-cli.phar /usr/bin/wp
WORKDIR /var/www/html
EXPOSE 9000


COPY tools/config.sh /
CMD ["/config.sh"]
