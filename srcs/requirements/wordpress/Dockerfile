FROM alpine
RUN apk add php8 php-fpm \
	&& mkdir -p /usr/share/webapps \
	&& cd /usr/share/webapps \
	&& wget http://wordpress.org/latest.tar.gz \
	&& tar -xzvf latest.tar.gz \
	&& rm latest.tar.gz \
	&& sed -i "s/listen = 127.0.0.1:9000/listen = 9000/g" /etc/php8/php-fpm.d/www.conf
EXPOSE 9000
ENTRYPOINT ["php-fpm8", "-F"]
