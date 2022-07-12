FROM alpine
#ADD ./conf /etc/nginx/http.d/default.conf
#ADD ./tools/server.crt /etc/nginx/ssl/server.crt
#ADD ./tools/server.key /etc/nginx/ssl/server.key
RUN apk add --no-cache nginx
#	&& cd /etc/nginx/ssl \
#		&& openssl req -x509 -newkey rsa:4096 -days 1024 -keyout server.key -out server.crt \
#	&& chmod 400 server.key \
#	&& chmod 444 server.crt
EXPOSE 443
ENTRYPOINT ["nginx", "-g", "daemon off;"]
