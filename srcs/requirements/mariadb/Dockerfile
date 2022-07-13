FROM alpine
RUN apk add mysql mysql-client
# TODO: Check if chown and chgrp are needed
RUN mysql_install_db --user=mysql --datadir=/var/lib/mysql \
		&& chown -R mysql /var/lib/mysql \
		&& chgrp -R mysql /var/lib/mysql \
		&& mkdir -p /run/mysqld \
		&& chown -R mysql /run/mysqld
RUN mysqld --user=mysql \
		& sleep 1  \
		&& mysqladmin -u root password toor 
## TODO: Check is EXPOSE is needed
EXPOSE 3306 
ENTRYPOINT ["mysqld", "--user=mysql"]
