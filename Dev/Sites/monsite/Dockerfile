FROM httpd:alpine


RUN apk update; \
    apk upgrade;

RUN mkdir /srv/htdocs


EXPOSE 80 443
# Exposer les ports 80 et 443

WORKDIR /usr/local/apache2/conf
# change dans le réperoitre de configuration

COPY ./conf/httpd.conf httpd.conf
COPY ./conf/extra/httpd-ssl.conf extra/httpd-ssl.conf
COPY ./certs/server.* ./

# Remplacer le httpd.conf par le notre.
