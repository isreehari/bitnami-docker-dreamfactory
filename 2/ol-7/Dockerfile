FROM bitnami/oraclelinux-extras:7-r305
LABEL maintainer "Bitnami <containers@bitnami.com>"

# Install required system packages and dependencies
RUN install_packages bzip2-libs cyrus-sasl-lib expat freetds freetype glibc gmp gnutls keyutils-libs krb5-libs libcom_err libcurl libffi libgcc libgcrypt libgpg-error libicu libidn libjpeg-turbo libmcrypt libmemcached libnghttp2 libpng libselinux libssh2 libstdc++ libtasn1 libtidy libuv libxml2 libxslt ncurses-libs nettle nspr nss nss-softokn-freebl nss-util openldap openssl-libs p11-kit pcre postgresql-libs readline sqlite xz-libs zlib
RUN bitnami-pkg unpack apache-2.4.38-2 --checksum bf099fdd01c4f5ec72a41dcbccbb04af1a75627f8e5e5112a2d5f62f4cbc4203
RUN bitnami-pkg install redis-client-4.0.14-0 --checksum d322eae8c6273b055f819169d6fb3024af101f0f9a535771845fe95db5d8f14e
RUN bitnami-pkg unpack php-7.1.27-0 --checksum df9cfdf30d8f0cfda05287c0837fbed19a1083fb296b4d82124764113db0b1ac
RUN bitnami-pkg install mysql-client-10.1.38-0 --checksum 8140732986832471cc54aede727b66729811a0fa79e6fa86c7c791ce1f513451
RUN bitnami-pkg install mongodb-client-3.6.11-0 --checksum dc345fc94209afdae46f658fa20735d71f4c7f2065357d32fb4bab993c689b8e
RUN bitnami-pkg unpack libphp-7.1.27-0 --checksum 96e104d4595616662738955e4416ba8c6f8e87be3038252a88cf63efdf0a4bf7
RUN bitnami-pkg unpack dreamfactory-2.14.1-20 --checksum a2b9cb6eada686c8a9882c49f2264eedc26645d4f5ef69fdfaaf321cd717e3cd
RUN mkdir -p /opt/bitnami/apache/tmp && chmod g+rwX /opt/bitnami/apache/tmp
RUN ln -sf /dev/stdout /opt/bitnami/apache/logs/access_log
RUN ln -sf /dev/stderr /opt/bitnami/apache/logs/error_log

COPY rootfs /
ENV APACHE_HTTPS_PORT_NUMBER="443" \
    APACHE_HTTP_PORT_NUMBER="80" \
    BITNAMI_APP_NAME="dreamfactory" \
    BITNAMI_IMAGE_VERSION="2.14.1-ol-7-r168" \
    MARIADB_HOST="mariadb" \
    MARIADB_PASSWORD="" \
    MARIADB_PORT_NUMBER="3306" \
    MARIADB_USER="root" \
    MONGODB_HOST="mongodb" \
    MONGODB_PASSWORD="" \
    MONGODB_PORT_NUMBER="27017" \
    MONGODB_USER="" \
    PATH="/opt/bitnami/apache/bin:/opt/bitnami/redis/bin:/opt/bitnami/php/bin:/opt/bitnami/php/sbin:/opt/bitnami/mysql/bin:/opt/bitnami/mongodb/bin:$PATH" \
    REDIS_HOST="redis" \
    REDIS_PASSWORD="" \
    REDIS_PORT_NUMBER="6379" \
    SMTP_HOST="" \
    SMTP_PASSWORD="" \
    SMTP_PORT="" \
    SMTP_PROTOCOL="" \
    SMTP_USER=""

EXPOSE 80 443

ENTRYPOINT [ "/app-entrypoint.sh" ]
CMD [ "httpd", "-f", "/bitnami/apache/conf/httpd.conf", "-DFOREGROUND" ]
