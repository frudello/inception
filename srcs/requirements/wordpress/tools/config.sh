#!/bin/bash

FILE=/var/www/html/wp-config.php
if [ -f "$FILE" ]; then
    echo "wordpress already installed"
else
    cd /var/www/html

    wp core download --allow-root

    wp config create --dbname=$WP_DATABASE_NAME --dbuser=$WP_DATABASE_USR --dbpass=$WP_DATABASE_PWD --dbhost=$MYSQL_HOST --dbcharset="utf8" --dbcollate="utf8_general_ci" --allow-root

    wp core install --url=$DOMAIN_NAME/html --title=$WP_TITLE --admin_user=$WP_ADMIN_USR --admin_password=$WP_ADMIN_PWD --admin_email=$WP_ADMIN_EMAIL --skip-email --allow-root

    wp user create $WP_USER_USR $WP_USER_EMAIL --role=author --user_pass=$WP_USER_PWD --allow-root

    wp theme install inspiro --activate --allow-root

fi

echo "ready .."

/usr/sbin/php-fpm7.3 -F

