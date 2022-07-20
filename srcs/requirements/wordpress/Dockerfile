# syntax=docker/dockerfile:1.3-labs
FROM alpine
# TODO: automate wordpress configuration
RUN apk add --no-cache php php-fpm php-mysqli \
	&& mkdir -p /usr/share/webapps \
	&& cd /usr/share/webapps \
	&& wget http://wordpress.org/latest.tar.gz \
	&& tar -xzvf latest.tar.gz \
	&& rm latest.tar.gz \
	&& sed -i "s/listen = 127.0.0.1:9000/listen = 9000/g" /etc/php8/php-fpm.d/www.conf
ARG DB
ARG USER
ARG PASSWORD
ARG HOST
COPY <<-EOF /usr/share/webapps/wordpress/wp-config.php
<?php
"define( 'DB_NAME', '$DB' );"
"define( 'DB_USER', '$USER' );"
"define( 'DB_PASSWORD', '$PASSWORD' );"
"define( 'DB_HOST', '$HOST' );"
"define( 'DB_CHARSET', 'utf8' );"
"define( 'DB_COLLATE', '' );"
"define( 'AUTH_KEY',         'R7%E>BYN!A0(;5}v}_v7~7A6sas#)Xgj~G?V.8<c[OlB/rTZj)@c!@qeFn,X~XH7' );"
"define( 'SECURE_AUTH_KEY',  '-[oac_LjVAaSQojgs+/!jh0r,@%D!2SzZpk45,fBU=-%Q?&`4IRI~SmE~)5Q0/+L' );"
"define( 'LOGGED_IN_KEY',    '.ZCkm*(]kM;.?*nb:9n;MvvS{7+5{KrMvoa~?plRdK-O?6MP[Z,Y1tv|HpOC13N6' );"
"define( 'NONCE_KEY',        ' Fz6W80dTsJ[0BE@J&<?~R$;1kO ;w)y-bZ_wXQ,ng`yjl>&_F:BYsBI2Fd`+)Io' );"
"define( 'AUTH_SALT',        'nFVGEU`%]v=+WE06f&!+H=[@q>8NY7s qu? 1P&285/RQ_4z5_KI2cg}bl!KZg:)' );"
"define( 'SECURE_AUTH_SALT', 'E-^/qT3EPS#^:8Aq(bGbyOt~87TK&hW4#IOxBb@cnBLSh9O_LGA^vDT?[B;Q5h[s' );"
"define( 'LOGGED_IN_SALT',   'tKm2FJY!SoqGREo>;i~4jwOu5o>5zaO$8cm;KqE,1)cvXfK|`1hsY<eX=Kf^|^_y' );"
"define( 'NONCE_SALT',       'xk* 17r3GcsNlB.+R>5~0a~:Y~%J#IhV&2Bw(Pu4+#s`8dff m4r]H2MM6QwpT+S' );"
"\$table_prefix = 'wp_';"
"define( 'WP_DEBUG', false );"
"if ( ! defined( 'ABSPATH' ) ) {"
"        define( 'ABSPATH', __DIR__ . '/' );"
"}"
"require_once ABSPATH . 'wp-settings.php';"
EOF
CMD ["php-fpm8", "-F"]
