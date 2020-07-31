FROM httpd:2.4

ENV BUGZILLA_RELEASE 5.0
ENV BUGZILLA_PACKAGE 5.0.6

RUN apt update && apt install -y \
    libappconfig-perl \
    libdate-calc-perl \
    libtemplate-perl \
    libmime-tools-perl \
    libdatetime-timezone-perl \
    libemail-reply-perl \
    libdatetime-perl \
    libemail-address-perl \
    libemail-sender-perl \
    libemail-mime-perl \
    libemail-mime-modifier-perl \
    libfile-copy-recursive-perl \
    libdbd-pg-perl \
    libdbi-perl \
    libcgi-pm-perl \
    libmath-random-isaac-perl \
    libmath-random-isaac-xs-perl \
    libapache2-mod-perl2 \
    libcache-memcached-perl \
    libchart-perl \
    libxml-perl \
    libxml-twig-perl \
    perlmagick \
    libgd-graph-perl \
    libtemplate-plugin-gd-perl \
    libsoap-lite-perl \
    libhtml-scrubber-perl \
    libjson-rpc-perl \
    libdaemon-generic-perl \
    libtheschwartz-perl \
    libtest-taint-perl \
    libauthen-radius-perl \
    libfile-slurp-perl \
    libencode-detect-perl \
    libmodule-build-perl \
    libnet-ldap-perl \
    libfile-which-perl \
    libauthen-sasl-perl \
    libfile-mimeinfo-perl \
    libhtml-formattext-withlinks-perl \
    graphviz \
    libperl-dev \
    make \
    git \
 && rm -rf /var/lib/apt/lists/*

RUN cpan install PatchReader

RUN apt purge -y \
    libperl-dev \
    make

# Copy apache vhost file to proxy php requests to php-fpm container
COPY bugzilla.apache.conf /usr/local/apache2/conf/bugzilla.apache.conf

RUN echo "Include /usr/local/apache2/conf/bugzilla.apache.conf" \
    >> /usr/local/apache2/conf/httpd.conf

VOLUME ["/code"]

#COPY ./localconfig /

EXPOSE 80

#RUN echo 2

COPY ./docker-entrypoint.sh /

ENTRYPOINT ["sh","/docker-entrypoint.sh"]

CMD ["/usr/local/apache2/bin/httpd","-D","FOREGROUND"]

