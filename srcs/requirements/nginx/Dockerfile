FROM alpine
RUN apk add --no-cache nginx
ADD ./conf /etc/nginx/http.d/default.conf
ADD ./tools/server.crt /etc/nginx/ssl/server.crt
ADD ./tools/server.key /etc/nginx/ssl/server.key
#	&& cd /etc/nginx/ssl \
#		&& openssl req -x509 -newkey rsa:4096 -days 1024 -keyout server.key -out server.crt \
#	&& chmod 400 server.key \
#	&& chmod 444 server.crt
CMD ["nginx", "-g", "daemon off;"]
