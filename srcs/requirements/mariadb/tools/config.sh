#!/bin/bash



service mysql start 


echo "CREATE DATABASE IF NOT EXISTS $WP_DATABASE_NAME ;" > db.sql
echo "CREATE USER IF NOT EXISTS '$WP_DATABASE_USR'@'%' IDENTIFIED BY '$WP_DATABASE_PWD' ;" >> db.sql
echo "GRANT ALL PRIVILEGES ON $WP_DATABASE_NAME.* TO '$WP_DATABASE_USR'@'%' ;" >> db.sql
#echo "ALTER USER '$MYSQL_ROOT_USR'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PWD' ;" >> db.sql
echo "FLUSH PRIVILEGES;" >> db.sql

mysql -h localhost < db.sql

kill $(cat /var/run/mysqld/mysqld.pid)

mysqld

#tail -f
