FROM alpine
RUN apk add mysql mysql-client
COPY ./conf /etc/my.cnf.d/mariadb-server.cnf
RUN mysql_install_db --user=mysql --datadir=/var/lib/mysql \
		&& mkdir -p /run/mysqld \
		&& chown -R mysql /run/mysqld
RUN mysqld --user=mysql \
		& sleep 5  \
		&& mysqladmin -u root password toor \
		&& mysql -u root -e "CREATE DATABASE wordpress" \
		&& mysql -u root -e "GRANT ALL PRIVILEGES ON wordpress.* TO 'wordpress'@'wordpress.docker-network' IDENTIFIED BY 'wordpress'" \
		&& mysql -u root -e "FLUSH PRIVILEGES"
## TODO: Check is EXPOSE is needed
EXPOSE 3306 
ENTRYPOINT ["mysqld", "--user=mysql"]
