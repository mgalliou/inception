FROM alpine
RUN apk add mysql mysql-client
ARG ROOT_PASSWORD
ARG USER
ARG PASSWORD
ARG DATABASE
COPY ./conf /etc/my.cnf.d/mariadb-server.cnf
# TODO: Test with root user
RUN mysql_install_db --user=mysql --datadir=/var/lib/mysql \
		&& mkdir -p /run/mysqld \
		&& chown -R mysql /run/mysqld
RUN mysqld --user=mysql \
		& sleep 10  \
		&& mysqladmin -u root password $ROOT_PASSWORD \
		&& mysql -u root -e "CREATE DATABASE wordpress" \
		&& mysql -u root -e "GRANT ALL PRIVILEGES ON $DATABASE.* TO '$USER'@'wordpress.docker-network' IDENTIFIED BY '$PASSWORD'" \
		&& mysql -u root -e "FLUSH PRIVILEGES"
# TODO: Check is EXPOSE is needed
EXPOSE 3306 
ENTRYPOINT ["mysqld", "--user=mysql"]
