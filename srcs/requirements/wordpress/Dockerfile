FROM alpine
# TODO: automate wordpress configuration
RUN apk add php php-fpm php-mysqli \
	&& mkdir -p /usr/share/webapps \
	&& cd /usr/share/webapps \
	&& wget http://wordpress.org/latest.tar.gz \
	&& tar -xzvf latest.tar.gz \
	&& rm latest.tar.gz \
	&& sed -i "s/listen = 127.0.0.1:9000/listen = 9000/g" /etc/php8/php-fpm.d/www.conf
CMD ["php-fpm8", "-F"]
