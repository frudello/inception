FROM debian:buster


RUN apt update -y && apt upgrade -y && apt install mariadb-server -y

COPY tools/50-server.cnf /etc/mysql/mariadb.conf.d/


COPY tools/config.sh /
#COPY tools/db.sql /

EXPOSE 3306
CMD ["/config.sh"]
